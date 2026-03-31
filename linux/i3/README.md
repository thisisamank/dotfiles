# i3-wm Tokyonight DevOps/SRE Guide

This setup is optimized for high-performance developer workflows, specifically for DevOps and SRE tasks, using the **Tokyonight** theme.

## 🛠 Dotfiles Management
Your configurations are now organized in `~/dotfiles` and are cross-platform (Linux & Mac).
- **Update/Install:** Run `~/dotfiles/install.sh` to refresh symlinks.
- **Mac Support:** The same repository works on macOS with **Ghostty**, **Yabai**, **SKHD**, and **Sketchybar**.

## 🚀 Core Components
- **Window Manager:** i3-gaps (Layout, Tiling, Workspaces)
- **Terminal:** Alacritty (Linux) / Ghostty (Mac)
- **Editor:** Zed (Primary code editor)
- **Status Bar:** Polybar (System monitoring, Clock, Workspaces, Battery, Netspeed)
- **Compositor:** Picom (Rounded corners, transparency, shadows)
- **Launcher:** Rofi (Searchable app menu, window switcher)
- **Utilities:** bat (cat replacement), fzf (Fuzzy finder)
- **Wallpaper:** feh (Active: `~/Pictures/Wallpapers/zen-focus.jpg`)
- **Screenshots:** Flameshot (GUI-based, annotation ready)

---

## ⌨️ Essential Keybindings (Linux & Mac)

| Command | Keybinding |
| :--- | :--- |
| **Open Terminal** | `Alt + Enter` |
| **Open Zed Editor** | `Alt + c` |
| **App Launcher (Rofi)** | `Alt + d` |
| **Kill Window** | `Alt + Shift + q` |
| **Toggle Fullscreen** | `Alt + f` |
| **Vim Navigation** | `Alt + h/j/k/l` |
| **Move Window** | `Alt + Shift + h/j/k/l` |
| **Split Vertical** | `Prefix` then `\` or `\|` |
| **Split Horizontal** | `Prefix` then `-` or `_` |

---

## 🐚 Tmux (Terminal Multiplexer)

| Action | Keybinding |
| :--- | :--- |
| **Prefix Key** | `Ctrl + a` |
| **Vertical Split** | `Prefix` then `\` or `\|` |
| **Horizontal Split** | `Prefix` then `-` or `_` |
| **Switch Pane** | `Alt + Arrows` or `Prefix + h/j/k/l` |
| **Reload Config** | `Prefix + r` |

---

## 🎨 Aesthetic Customization
- **i3 Fonts:** JetBrains Mono 14
- **Topbar Fonts:** JetBrains Mono 12
- **Topbar Features:** Battery %, Network Speeds (Up/Down)
- **Scroll:** Natural Scrolling (Inverted) enabled via `xmodmap`
- **Gaps:** Inner 10px, Outer 5px.
- **Rounded Corners:** 10px (Configured in `~/.config/picom/picom.conf`).
- **Transparency:** 90% Focused, 85% Unfocused.
- **Colors:** Tokyonight (Extracted from Neovim config).
