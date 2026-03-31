#!/bin/bash

# Master Dotfiles Installer (Bash)
# Supports: Linux (Fedora/i3) & macOS (Yabai/Ghostty)

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

echo "🚀 Starting Dotfiles Installation..."

# --- Helper Functions ---
link_file() {
    local src=$1
    local dst=$2
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$dst")"
    
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        echo "📦 Backing up existing file: $dst"
        mkdir -p "$BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
    fi
    
    echo "🔗 Linking $dst -> $src"
    ln -sf "$src" "$dst"
}

# --- OS Detection ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    IS_MAC=true
    echo "💻 Detected macOS"
else
    IS_LINUX=true
    echo "🐧 Detected Linux"
fi

# --- 1. Common Configurations ---
echo "⚙️  Installing Common Configs..."

# Zsh
link_file "$DOTFILES_DIR/common/zsh/.zshrc" "$HOME/.zshrc"

# Tmux
link_file "$DOTFILES_DIR/common/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Neovim
link_file "$DOTFILES_DIR/common/nvim" "$HOME/.config/nvim"

# Alacritty
link_file "$DOTFILES_DIR/common/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# K9s
link_file "$DOTFILES_DIR/common/k9s" "$HOME/.config/k9s"

# Zed (Path varies by OS)
if [ "$IS_MAC" = true ]; then
    link_file "$DOTFILES_DIR/common/zed/settings.json" "$HOME/Library/Application Support/Zed/settings.json"
    link_file "$DOTFILES_DIR/common/zed/themes" "$HOME/Library/Application Support/Zed/themes"
else
    link_file "$DOTFILES_DIR/common/zed/settings.json" "$HOME/.config/zed/settings.json"
    link_file "$DOTFILES_DIR/common/zed/themes" "$HOME/.config/zed/themes"
fi

# --- 2. OS Specific Configurations ---
if [ "$IS_LINUX" = true ]; then
    echo "🐧 Installing Linux Configs..."
    link_file "$DOTFILES_DIR/linux/i3" "$HOME/.config/i3"
    link_file "$DOTFILES_DIR/linux/polybar" "$HOME/.config/polybar"
    link_file "$DOTFILES_DIR/linux/picom" "$HOME/.config/picom"
    link_file "$DOTFILES_DIR/linux/rofi" "$HOME/.config/rofi"
    
    # Wallpaper
    mkdir -p "$HOME/Pictures/Wallpapers"
    cp "$DOTFILES_DIR/wallpapers/zen-focus.jpg" "$HOME/Pictures/Wallpapers/zen-focus.jpg"
fi

if [ "$IS_MAC" = true ]; then
    echo "🍎 Installing macOS Configs..."
    link_file "$DOTFILES_DIR/mac/yabairc" "$HOME/.yabairc"
    link_file "$DOTFILES_DIR/mac/skhdrc" "$HOME/.skhdrc"
    link_file "$DOTFILES_DIR/mac/sketchybar" "$HOME/.config/sketchybar"
    link_file "$DOTFILES_DIR/common/ghostty/config" "$HOME/.config/ghostty/config"
fi

# --- 3. Firefox Profile Sync ---
echo "🦊 Syncing Firefox Tokyo Night Theme..."

FF_ROOT=""
if [ "$IS_MAC" = true ]; then
    FF_ROOT="$HOME/Library/Application Support/Firefox"
else
    FF_ROOT="$HOME/.mozilla/firefox"
fi

if [ -d "$FF_ROOT" ]; then
    # Find all default-release profiles
    profiles=$(find "$FF_ROOT" -maxdepth 1 -name "*.default-release" -type d)
    
    for profile in $profiles; do
        echo "✨ Applying theme to profile: $(basename "$profile")"
        mkdir -p "$profile/chrome"
        ln -sf "$DOTFILES_DIR/firefox/userChrome.css" "$profile/chrome/userChrome.css"
        ln -sf "$DOTFILES_DIR/firefox/userContent.css" "$profile/chrome/userContent.css"
        ln -sf "$DOTFILES_DIR/firefox/user.js" "$profile/user.js"
    done
else
    echo "⚠️  Firefox directory not found, skipping theme sync."
fi

echo "✅ Installation Complete! Please restart your terminal or run 'reload'."
