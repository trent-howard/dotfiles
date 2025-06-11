#!/bin/bash

# install xcode tools - we'll need these for hombrew
if test ! $(which gcc); then
  echo "Installing xcode command line toolset..."
  /usr/bin/xcode-select --install
fi

# install rosetta if we're on an apple silicon mac
if [[ $(uname -m) == "arm" ]]; then
  softwareupdate --install-rosetta --agree-to-license
fi

# install homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew analytics off

# install packages
packages=(
  antidote
  aws-cdk
  awscli
  deno
  fd
  fnm
  fzf
  git
  go
  goose
  inetutils
  jq
  lazygit
  neovim
  node
  pnpm
  prettier
  python3
  ripgrep
  stow
  uv
)

echo "Installing packages..."
brew install "${packages[@]}"

# install apps
apps=(
  bitwarden
  firefox
  font-jetbrains-mono-nerd-font
  ghostty
  google-chrome
  karabiner-elements
  postman
  rectangle
  signal
  spotify
  sublime-text
  the-unarchiver
  vlc
)

echo "Installing applications..."
brew install --cask "${apps[@]}"

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# Disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock showHidden -bool true # dim hidden apps in dock
defaults write com.apple.dock tilesize -int 48
killall Dock

# Disable press and hold for special characters - Enable key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

# Set lower key repeat wait and faster repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

