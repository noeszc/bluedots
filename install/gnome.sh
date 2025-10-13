#!/bin/bash
# GNOME configuration for Fedora dotfiles

# ============================================================================
# Keyboard settings
# ============================================================================

gsettings reset org.gnome.desktop.input-sources xkb-options
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.peripherals.keyboard repeat true
gsettings set org.gnome.desktop.peripherals.keyboard delay 300
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30

# ============================================================================
# Default applications
# ============================================================================

gsettings set org.gnome.desktop.default-applications.terminal exec 'ghostty'
xdg-settings set default-web-browser com.google.Chrome.desktop

