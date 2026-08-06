#!/usr/bin/env bash
# sysinfo.sh - Prints current user, current date, and disk usage.

set -euo pipefail

echo "==================== SYSTEM INFORMATION ===================="
echo "Current User:"
whoami
echo ""

echo "Current Date & Time:"
date
echo ""

echo "Disk Usage:"
df -h
echo "============================================================"
