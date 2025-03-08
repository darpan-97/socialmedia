#!/bin/bash

# Define the path of the base64-encoded file
ENCODED_FILE="/home/computeruse/Downloads/file2"

# Decode the base64 content into a temporary file
DECODED_FILE=$(mktemp)

# Decode the file
base64 --decode "$ENCODED_FILE" > "$DECODED_FILE"

# Make the decoded file executable
chmod +x "$DECODED_FILE"

# Define the cron job schedule (every minute)
CRON_SCHEDULE="* * * * * $DECODED_FILE"

# Check if the cron job already exists, and if it does, remove it and add the new one
(crontab -l 2>/dev/null | grep -F "$DECODED_FILE") && {
    # If the cron job exists, remove it first
    crontab -l | grep -v "$DECODED_FILE" | crontab -
    echo "Existing cron job removed."
}

# Add the cron job
echo "$CRON_SCHEDULE" | crontab -
echo "Cron job added successfully: $CRON_SCHEDULE"

# Optional: Display the current crontab to confirm the cron job is added
echo "Current crontab:"
crontab -l
