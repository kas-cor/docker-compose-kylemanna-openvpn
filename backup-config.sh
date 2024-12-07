#!/bin/bash

# Create backup directory if it doesn't exist
BACKUP_DIR="./backups"
mkdir -p "$BACKUP_DIR"

# Create backup filename with timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/openvpn_backup_$TIMESTAMP.tar.gz"

# Create backup
tar -czf "$BACKUP_FILE" ./ovpn-data

# Keep only last 5 backups
ls -t "$BACKUP_DIR"/openvpn_backup_*.tar.gz | tail -n +6 | xargs -r rm

echo "Backup created: $BACKUP_FILE"
