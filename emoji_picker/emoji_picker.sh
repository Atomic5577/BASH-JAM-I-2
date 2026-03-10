#!/bin/bash


#add command to add an emoji
add_emoji() {
    SCRIPT_DIR="$(dirname "$(realpath "$0")")"
    FILE="$SCRIPT_DIR/emojis.txt"

    read -p "Enter emoji: " emoji
    read -p "Enter description: " desc

    echo "$emoji $desc" >> "$FILE"

    echo "Emoji added successfully!"
}

if [ "$1" = "add" ]; then
    add_emoji
    exit
fi


#Putting you emojis in a function
emoji_list() {
SCRIPT_DIR="$(dirname "$(realpath "$0")")"
FILE="$SCRIPT_DIR/emojis.txt"
cat "$FILE"
}
 
#Checking what you use 
if command -v wofi &>/dev/null && command -v wl-copy &>/dev/null; then
    LAUNCHER="wofi --dmenu --prompt 'Emoji:'"
    CLIP_CMD="wl-copy"
elif command -v rofi &>/dev/null && command -v xclip &>/dev/null; then
    LAUNCHER="rofi -dmenu -p 'Emoji:'"
    CLIP_CMD="xclip -selection clipboard"
else
    echo "Required tools not found! Running Setup script..."
    SCRIPT_DIR="$(dirname "$(realpath "$0")")"
    bash "$SCRIPT_DIR/Setup_script.sh"
fi

#printing the emoji and move it to the clipboard
selected=$(emoji_list | eval "$LAUNCHER" | cut -d' ' -f1)

if [ -n "$selected" ]; then
    printf '%s' "$selected" | eval "$CLIP_CMD"
    echo "Copied emoji: $selected"
else
    echo "No emoji selected."
fi
