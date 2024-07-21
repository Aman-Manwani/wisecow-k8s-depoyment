#!/bin/bash
SOURCE_DIRECTORY="/path/to/source/directory"  # Directory to backup
REMOTE_SERVER="user@remote.server.com"  # Remote server
REMOTE_DIRECTORY="/path/to/remote/directory"  # Remote backup directory
LOG_FILE="/path/to/backup.log"  # Log file to store the backup report

# Function to perform the backup
perform_backup() {
    echo "Starting backup: $(date)" >> "$LOG_FILE"
    rsync -avz --delete "$SOURCE_DIRECTORY" "$REMOTE_SERVER:$REMOTE_DIRECTORY" >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        echo "Backup successful: $(date)" >> "$LOG_FILE"
    else
        echo "Backup failed: $(date)" >> "$LOG_FILE"
    fi
}

echo "--------------------------------------------" >> "$LOG_FILE"
perform_backup
echo "Backup operation completed: $(date)" >> "$LOG_FILE"
echo "--------------------------------------------" >> "$LOG_FILE"
