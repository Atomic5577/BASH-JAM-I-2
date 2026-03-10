#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
FILE="$SCRIPT_DIR/Jokes.txt"

echo "Wanna hear a Joke ?"
echo "(yes/no)"
read answer

if [[ "$answer" == "yes" || "$answer" == "Yes" ]]; then
    shuf -n 1 "$FILE"
else
    echo -e "Seems like you are not in a good mood\nMaybe later ;)"
fi
