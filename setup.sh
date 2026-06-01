#!/usr/bin/env bash


check_yes_no() {
    # Loop until a valid response is given
    while true; do
        read -p "$1 (y/n)? " yn
        case $yn in
            [Yy]* ) return 0;;  # Return success (0) for 'yes'
            [Nn]* ) return 1;;  # Return failure (1) for 'no'
            * ) echo "Please answer yes or no.";;
        esac
    done
}

safe_link() {
    if [ ! -e "$2" ]; then
        ln -s $1 $2
    elif [ -f "$2" ]; then
        mv $2 "$.BACKUP"
        ln -s $1 $2
    elif [ -L "$2" ]; then
        echo "$1 already linked"
    else
        "Should not see this"
    fi
}

echo "Attempting to find where this repo was checked out.."
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

if check_yes_no "Symlink dotfiles?"; then
  echo "Linking the repo's .zshrc and config.fish into your home folder"
  safe_link "$SCRIPT_DIR/dotfiles/.zshrc" ~/.zshrc
  safe_link "$SCRIPT_DIR/dotfiles/config.fish" ~/.config/fish/config.fish
fi
