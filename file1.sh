#!/bin/bash

# Define the script path
SCRIPT_PATH="/home/computeruse/Downloads/file2.sh"

# Define the cron job schedule (every minute)
CRON_SCHEDULE="* * * * * $SCRIPT_PATH"

# Check if the cron job already exists
(crontab -l 2>/dev/null | grep -F "$SCRIPT_PATH") || {
    # If the cron job doesn't exist, add it
    echo "$CRON_SCHEDULE" | crontab -
    echo "Cron job added successfully: $CRON_SCHEDULE"
}

# Optional: Display the current crontab to confirm the cron job is added
echo "Current crontab:"
crontab -l
