#!/bin/bash

# Detect package manager and display server
if command -v pacman &>/dev/null && [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    sudo pacman -S --noconfirm wofi wl-clipboard
elif command -v pacman &>/dev/null && [ "$XDG_SESSION_TYPE" = "x11" ]; then
    sudo pacman -S --noconfirm rofi xclip
elif command -v apt &>/dev/null && [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    sudo apt install -y wofi wl-clipboard
elif command -v apt &>/dev/null && [ "$XDG_SESSION_TYPE" = "x11" ]; then
    sudo apt install -y rofi xclip
else
    echo "Could not detect package manager or display server!"
    exit 1
fi
