#!/usr/bin/env bash


echo "Attempting to find where this repo was checked out.."
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Linking the repo's -zshrc into your home folder"
ln -s "$SCRIPT_DIR/dotfiles/.zshrc" ~/.zshrc

echo "Installing pipenv"
brew install pipenv

pipenv install