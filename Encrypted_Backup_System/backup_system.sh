#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/folder"
    exit 1
fi

INPUT_PATH="$1"

if [ ! -d "$INPUT_PATH" ]; then
    echo "Error: $INPUT_PATH is not a valid directory."
    exit 2
fi

echo "Input directory is: $INPUT_PATH"

TIMESTAMP=$(date +%F_%H-%M-%S)
FOLDER_NAME=$(basename "$INPUT_PATH")
BACKUP_NAME="${FOLDER_NAME}_${TIMESTAMP}.tar.gz"

tar -czf "$BACKUP_NAME" -C "$(dirname "$INPUT_PATH")" "$FOLDER_NAME"
echo "Folder compressed to: $BACKUP_NAME"

ENCRYPTED_FILE="${BACKUP_NAME}.enc"
openssl enc -aes-256-cbc -salt -in "$BACKUP_NAME" -out "$ENCRYPTED_FILE" -pass file:./my_aes.key
echo "Encrypted backup saved as: $ENCRYPTED_FILE"

BACKUP_DIR="/home/yourname/backups"
mkdir -p "$BACKUP_DIR"
mv "$ENCRYPTED_FILE" "$BACKUP_DIR/"
echo "Encrypted backup moved to: $BACKUP_DIR/$ENCRYPTED_FILE"