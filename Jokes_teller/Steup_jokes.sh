#!/usr/bin/env bash

SCRIPT_PATH="$(realpath "$(dirname "$0")/Jokes_Teller.sh")"

sudo chmod +x "$SCRIPT_PATH"

(crontab -l 2>/dev/null | grep -v "$SCRIPT_PATH"; echo "*/5 * * * * /usr/bin/bash $SCRIPT_PATH") | crontab -

echo "Cron job installed for $SCRIPT_PATH to run every 5 minutes."
