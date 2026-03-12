#!/usr/bin/env bash
set -euo pipefail

REMOTE_HOST="${1:-hk}"
REMOTE_DB="${2:-/opt/new-api/data/new-api.db}"
BACKUP_DIR="${3:-$(pwd)/backups}"
STAMP="$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

scp "$REMOTE_HOST:$REMOTE_DB" "$BACKUP_DIR/new-api-${STAMP}.db"
echo "备份完成: $BACKUP_DIR/new-api-${STAMP}.db"
