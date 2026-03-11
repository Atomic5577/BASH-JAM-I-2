#!/bin/bash

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
    exit 1
fi


SCRIPT_DIR="$(dirname "$(realpath "$0")")"
FILE="$SCRIPT_DIR/emojis.txt"
FILE_HISTORY="$SCRIPT_DIR/History.txt"

# add command to add an emoji
add_emoji() {
    read -p "Enter emoji: " emoji
    read -p "Enter description: " desc

    echo "$emoji $desc" >> "$FILE"
    echo "Emoji added successfully!"
}


# adding history list
history() {

    # Ensure history file exists and is not empty
    [ -s "$FILE_HISTORY" ] || { echo "History is empty."; exit 1; }

    # Only show non-empty lines
    history_selected=$(grep -v '^$' "$FILE_HISTORY" | eval "$LAUNCHER" | cut -d' ' -f1)

    if [ -n "$history_selected" ]; then
        # Copy selected emoji to clipboard
        printf '%s' "$history_selected" | eval "$CLIP_CMD"
        echo "Copied emoji from history: $history_selected"
        exit 0
    else
        echo "No emoji selected."
        exit 1
    fi
}

clear_history(){
 > $FILE_HISTORY
 echo "History cleared "
 exit 
}



#Putting you emojis in a function
emoji_list() {
cat "$FILE"
}

case "$1" in
    add)
        add_emoji
        exit
        ;;
    history)
        history
        ;;
    clear-history)
        clear_history
        ;;
esac

#printing the emoji and move it to the clipboard

selected=$(emoji_list | eval "$LAUNCHER")

if [ -n "$selected" ]; then

    echo "$selected" >> "$FILE_HISTORY"

    emoji=$(echo "$selected" | cut -d' ' -f1)

    printf '%s' "$emoji" | eval "$CLIP_CMD"

    echo "Copied emoji: $emoji"

else
    echo "No emoji selected."
fi
