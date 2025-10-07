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
xdg-settings set default-web-browser google-chrome.desktop

# ============================================================================
# Workspaces
# ============================================================================

# Disable app shortcuts (Super+1-9) for workspace shortcuts
for i in {1..9}; do
    gsettings set org.gnome.shell.keybindings switch-to-application-${i} "[]"
done

# Disable Super+M from message tray
gsettings set org.gnome.shell.keybindings toggle-message-tray "[]"

# Configure 4 static workspaces
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 4

# Switch to workspace
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super>4']"

# Move window to workspace
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-2 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-3 "['<Super><Shift>3']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-4 "['<Super><Shift>4']"

# Navigate workspaces with Super+Tab
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Super><Shift>Tab']"

# ============================================================================
# Window tiling
# ============================================================================

# Enable edge tiling
gsettings set org.gnome.mutter edge-tiling true

# Tile windows with Super+H/L
gsettings set org.gnome.mutter.keybindings toggle-tiled-left "['<Super>h']"
gsettings set org.gnome.mutter.keybindings toggle-tiled-right "['<Super>l']"

# Close window with Super+W
gsettings set org.gnome.desktop.wm.keybindings close "['<Super>q']"

# Maximize window with Super+M
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>m']"

# Minimize window with Super+comma
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super>comma']"

echo " GNOME settings configured successfully!"
