#!/bin/sh
sudo dnf install -y dnf-plugins-core

sudo dnf install -y \
    zsh \
    git \
    neovim \
    zoxide \
    fzf \
    ripgrep \
    fd-find \
    bat \
    htop \
    curl \
    wget \
    jq \
    trash-cli

sudo dnf copr enable -y alternateved/eza
sudo dnf copr enable -y jdxcode/mise
sudo dnf copr enable -y scottames/ghostty

sudo dnf install -y \
    eza \
    mise \
    ghostty

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi
