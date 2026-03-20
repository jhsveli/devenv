# Starship prompt
eval "$(starship init zsh)"

export DEVENV_DIR="/Users/jorgen.sveli/git/devenv"

[ -f /Users/jorgen.sveli/opt/etc/shrc ] && . /Users/jorgen.sveli/opt/etc/shrc

# Environment variables
export GPG_TTY=$(tty)
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH" 
export EDITOR='subl -nw'

eval "$(fnm env --use-on-cd --shell zsh)"

# Check for and set GH AUTH

if [ ! -f ~/.config/gh/hosts.yml ]; then
  if [ -e ~/github-token.txt ]; then
    gh auth login -h github.com --with-token < ~/github-token.txt
  else
    echo "GITHUB token file not found at ~/github-token.txt"
  fi
fi

# Aliases
alias zshc="subl ~/.zshrc"
alias idea='open -na "IntelliJ IDEA.app"'
alias ls="ls -la --color=auto"
alias kbp="cd ~/git/awl-monorepo/apps/team-bm-betaling/kundefront-bm-payments"
alias kbt="cd ~/git/kundefront-bm-transaksjoner"
alias kbis="cd ~/git/kundefront-bm-incoming-swift"
alias kbrt="cd ~/git/kundefront-bm-recent-transactions"
alias abp="cd ~/git/awl-monorepo/apps/team-bm-betaling/api-bm-payment"
alias abda="cd ~/git/awl-monorepo/apps/team-bm-transaksjoner/api-bm-document-archive"
alias abt="cd ~/git/api-bm-transaksjoner"
alias abot="cd ~/git/api-bm-ocr-transactions"
alias abtc="cd ~/git/api-bm-transaction-customizations"

alias gs="git status"
alias gc="git commit"
alias glg="git log"
alias gd="git diff"
alias base="BASE=\$(git rev-parse --abbrev-ref -- origin/HEAD | cut -c8-) && git checkout \$BASE"
alias set-intellij-version='python3 -c "import re,pathlib,sys;p=pathlib.Path(\"~/git/provision-dev/globals.sh\").expanduser();p.write_text(re
  .sub(r\"(INTELLIJ_VERSION=).*\",r\"\g<1>\"+sys.argv[1],p.read_text()))" '

alias kns=kubens
alias kcx=kubectx

alias draft="gh pr create -df"
alias vp="gh pr view --web"

export PATH="$PATH:$DEVENV_DIR/src"

# Functions

function idea () {
  open -na "IntelliJ IDEA.app" --args "$@"
}

gpgconf --launch gpg-agent
