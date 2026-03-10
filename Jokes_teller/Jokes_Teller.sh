#!/bin/bash

SCRIPT_DIR="$(dirname "$(realpath "$0")")"
FILE="$SCRIPT_DIR/Jokes.txt"

shuf -n 1 "$FILE"
