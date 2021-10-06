#!/usr/bin/env bash

# https://github.com/lucasfcosta/dotfiles

echo "Installing brew formulae..."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install ag

# This is needed for python support on Neovim for YouCompleteMe
# Please see https://github.com/neovim/neovim/issues/1315
brew install python3
pip3 install --user --upgrade neovim

brew install wget
brew install curl

# Install more recent versions of some macOS tools.
brew install neovim
brew install grep
brew install openssh

# Install other useful binaries.
brew install git
brew install tmux
brew install ccat
brew install tree
brew install ncdu
brew install htop
brew install darksky-weather
brew install ctags
brew install yarn
brew install zsh

# Extend zsh to oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Ensure tmux plugin manager is installed
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Ensure vim plug is installed for neovim
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy configs from this repo to the appropriate locations on this local machine
mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim
cp .zshrc ~/.zshrc

# TODO Automate getting tmux Nord theme working
# 1. Install powerline fonts: https://github.com/powerline/fonts
# 2. Install Nord terminal theme: https://github.com/arcticicestudio/nord-terminal-app
# 3. Switch the Nord profile's font to a powerline font:

# -------------------------------
# Casks
# -------------------------------

# Dev utilities
brew install --cask docker

# Browsers
brew install --cask firefox

# Remove outdated versions from the cellar.
brew cleanup
