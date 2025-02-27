#!/bin/bash

repo="sparebank1utvikling/app-configrepo-sb1u"

if ! command -v gh 2>&1 >/dev/null
then
    echo "GitHub cli 'gh' could not be found"
    exit 1
fi

data=$(gh pr list -R $repo -s open -l "image-updater" -S "prod*$(gh api user | jq -r '.login')* in:title" --json "number,title,updatedAt")


IFS=$'
'
ids=($(echo $data | jq -cr '.[] | .number'))
options=($(echo $data | jq -cr '.[] | ((.number | tostring) + " - " + .title)'))

unset IFS

PS3="Approve and Merge PR number: "

select choice in "${options[@]}"
do
	# leave the loop if the user says 'stop'
    if [[ "$REPLY" == stop ]]; then break; fi


    # complain if no pr was selected, and loop to ask again
    if [[ "$choice" == "" ]]
    then
        echo "'$REPLY' is not a valid choice"
        continue
    fi

    # now we can use the selected pr
    for i in "${!options[@]}"; do
	if [[ "${options[$i]}" = "${choice}" ]]; then
		pr="${ids[$i]}"

		# approve and merge in correct repo
		gh pr review --approve -R $repo $pr
		echo "Approved $pr"
		gh pr merge -m -R $repo $pr
		echo "Merged $pr"
	fi
done
    
done