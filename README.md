# Evan's dotfiles

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Install git and yadm

```bash

curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
xcode-select --install
```

### Clone repo

```bash
cd ~
yadm clone https://github.com/elocke/dotfiles.git
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

## Components

These are run automatically by the bootstrap script.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./scripts/macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course):

```bash
brew bundle --file=~/.Brewfile
```

### VS Code

```bash
./scripts/vscode
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/elocke/dotfiles/issues)!

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/)
* and a ton more people
