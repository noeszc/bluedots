#!/bin/sh
sudo dnf install -y dnf-plugins-core

sudo dnf install -y \
    zsh \
    git \
    neovim \
    zoxide \
    xclip \
    fzf \
    ripgrep \
    fd-find \
    bat \
    btop \
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


# Commercial GUIs
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub \
    com.google.Chrome \
    com.slack.Slack \
    com.spotify.Client \
		org.localsend.localsend_app

if ! command -v 1password > /dev/null 2>&1; then
    sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc
    sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'
    sudo dnf install -y 1password
fi

if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi
