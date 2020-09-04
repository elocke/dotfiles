#!/usr/bin/env bash

# This is part of a larger script for setting a mac for python development.
set -e

pretty_print() {
  printf "\n%b\n" "$1"
}

xcode-select --install

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  pretty_print "You already have Homebrew installed...good job!"
fi


source macos
source dock
source python
source rust


# setup .gitconfig-work from prompt
