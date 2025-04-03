#!/usr/bin/env zsh

# Output the current shell's bin path
echo "Current shell bin path: $(which $SHELL)"

# 1. install brew if not installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 2. install brew packages
packages=(
    stow
    skhd
    yabai
    sketchybar
    btop
    yazi
    lazygit
    neovim
)

# Install packages if not already installed
for package in "${packages[@]}"; do
    if ! brew list --formula $package &>/dev/null; then
        echo "Installing $package..."
        brew install $package
    else
        echo "$package already installed"
    fi
done

## casks
casks=(
    hammerspoon
    kitty
)

for cask in "${casks[@]}"; do
    if ! brew list --cask $cask &>/dev/null; then
        echo "Installing $cask..."
        brew install --cask $cask
    else
        echo "$cask already installed"
    fi
done


stow -t ~ kitty
stow -t ~ yabai
stow -t ~ skhd
stow -t ~ sketchybar
stow -t ~ nvim
stow -t ~ zsh
stow -t ~ lazygit
stow -t ~ yazi
stow -t ~ fish
stow -t ~ hammerspoon
stow -t ~ btop

# defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

