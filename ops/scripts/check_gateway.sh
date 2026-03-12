#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://45.207.213.87:8081}"
TOKEN="${2:-}"

if [[ -z "$TOKEN" ]]; then
  echo "用法: $0 <base_url> <api_token>" >&2
  exit 1
fi

payload='{"model":"gpt-5.4","input":"Reply with exactly: ok"}'

curl -sS \
  -H "Authorization: Bearer ${TOKEN}" \
  -H 'Content-Type: application/json' \
  -d "$payload" \
  "$BASE_URL/v1/responses"

echo
