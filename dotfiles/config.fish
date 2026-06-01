if status is-interactive
	# Commands to run in interactive sessions can go here

	set -gx DEVENV_DIR "/Users/jorgen.sveli/git/devenv"
	set -gx GPG_TTY (tty)
	set -g theme_nerd_fonts yes


	# Load shrc.d in one bass subshell so helper functions persist across files
	# Skip: aws_completer, bash/zsh prompts, bob-completion, zsh-site-functions, history
	bass "source ~/opt/etc/shrc.d/00-safe-path-add.sh; for f in ~/opt/etc/shrc.d/*.sh; do case \$f in *aws_completer*|*bash-prompt*|*zsh-prompt*|*bob-completion*|*10_zsh*|*history*|*aliases*) ;; *) . \$f ;; esac; done"

	# Translate aliases from aliases.sh into fish aliases
	for line in (grep '^alias ' ~/opt/etc/shrc.d/aliases.sh)
	  set -l name  (string match -r '^alias ([^=]+)=' -- $line)[2]
	  set -l value (string match -r "^alias [^=]+=['\"](.*)['\"]\$" -- $line)[2]
	  alias $name="$value"
	end

	# PATH changes
	fish_add_path -a "/Applications/Sublime Text.app/Contents/SharedSupport/bin" 
	fish_add_path -a "$DEVENV_DIR/src"abt
	fish_add_path -a "/bin" "/usr/bin" "/sbin:/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/games" "/usr/local/games"
	fish_add_path -a "/home/$USER_HOME/.local/bin"
	fish_add_path -a "/home/$USER_HOME/opt/jdk/bin"
	fish_add_path -a "/home/$USER_HOME/opt/node/bin"
	fish_add_path -a "/home/$USER_HOME/git/bob"
	fish_add_path -a "/home/$USER_HOME/opt/bin"
	fish_add_path -a "/home/$USER_HOME/opt/maven/bin"

	# Aliases / Abbreviations
	abbr -a -- ga 'git add'
	abbr -a -- gb 'git branch'
	abbr -a -- gc 'git commit'
	abbr -a -- gco 'git checkout'
	abbr -a -- gs 'git status'
	abbr -a -- gd 'git diff'
	abbr -a -- glg 'git log'
	abbr -a -- gcm 'git checkout main && git pull && git remote prune origin'
	abbr -a -- gcmm 'git checkout main && git pull && git remote prune origin && git rm-merged'

	abbr -a -- kns kubens
	abbr -a -- kcx kubectx

	abbr -a -- mkpr 'gh pr create -f'
	abbr -a -- draft 'gh pr create -df'
	abbr -a -- vp 'gh pr view --web'

	abbr -a -- abt 'cd ~/git/api-bm-transaksjoner'
	abbr -a -- kbt 'cd ~/git/kundefront-bm-transaksjoner'

	abbr -a -- kc 'kubectx'
	abbr -a -- kx 'kubectx'
	abbr -a -- kns 'kubens'

	alias ls="ls -la --color=auto"



end
