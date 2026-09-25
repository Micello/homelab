#!/bin/bash
set -euo pipefail

SOURCE="/data"
DESTINATION="${DESTINATION:?DESTINATION environment reuired}"

echo "[$(date --iso-8601=seconds)] Backup started"
echo "Source: $SOURCE"
echo "Destination: $DESTINATION"

aws s3 sync "$SOURCE" "$DESTINATION"

echo "[$(date --iso-8601=seconds)] Backup completed successfully"

