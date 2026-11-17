#!/bin/bash
set -euo pipefail

# healthcheck.sh - Verifies the running application.

echo "Performing health check..."

#Accepts a target URL as an argument, deafulting to http://localhost:8080 if none is provided.


if [ -z "${1:-}" ]; then
    echo "No target URL provided. Defaulting to http://localhost:8080"
    TARGET_URL="http://localhost:8080"
else
    TARGET_URL="$1"
fi
echo "Target URL: $TARGET_URL"

#Issues an HTTP request and asserts a 200 response
TARGET_URL="${1:-http://localhost:8080}"

echo "Performing health check on $TARGET_URL..."
status_code=$(curl -o /dev/null -s -w "%{http_code}\n" "$TARGET_URL")

if [ "$status_code" -eq 200 ]; then
    echo "Health check passed. Status code: $status_code"
else
    echo "Health check failed. Status code: $status_code"
    exit 1
fi

# Exits 0 on success, 1 on failure, printing a clear diagnostic
if [ "$status_code" -eq 200 ]; then
    echo "Health check successful."
    exit 0
else
    echo "Health check failed with status code: $status_code"
    exit 1
fi

 

