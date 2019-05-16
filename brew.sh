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

# -------------------------------
# Casks
# -------------------------------

brew install cask

# Dev utilities
brew cask install docker

# Browsers
brew cask install firefox

# Remove outdated versions from the cellar.
brew cleanup
