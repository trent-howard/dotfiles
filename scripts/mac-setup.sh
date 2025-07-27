#!/bin/bash

# set system preferences
# you'll need to log out and back in for a bunch of these to take effect

# finder and file browsing stuff
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

# avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ui styling
defaults write -g AppleReduceDesktopTinting -bool true
defaults write -g AppleInterfaceStyle -string "Dark"
# universalaccess might need sudo or file permissions changed
# defaults write com.apple.universalaccess reduceTransparency -bool true

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock showHidden -bool true # dim hidden apps in dock
defaults write com.apple.dock tilesize -int 48
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock "show-recents" -bool false
killall Dock

# input settings
# disable press and hold for special characters - Enable key repeating
defaults write -g ApplePressAndHoldEnabled -bool false

# set lower key repeat wait and faster repeat rate
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# disable smart quotes and smart dashes
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# tracking speed and tap to click
defaults write -g com.apple.trackpad.scaling -float 1.5
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# install xcode tools - we'll need these for homebrew
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

# create dirs we don't want entirely symlinked by stow
mkdir -p ~/.config/git

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

