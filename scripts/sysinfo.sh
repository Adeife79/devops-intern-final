#!/bin/bash
set -euo pipefail

# sysinfo.sh - Reports the host environment information.

# Check current user and effective User ID
echo "Current User: $(whoami)"
echo "Effective User ID: $(id -u)"

# Check Hostname and Kernel release
echo "Hostname: $(hostname)"
echo "Kernel Release: $(uname -r)"

# Check system date in ISO-8601 format

echo "System date: $(date -Iseconds)"

echo "Starting disk usage check..."

# Disk usage in human-readable form
check_disk_usage() {
    echo "=== Disk Usage Report ==="
    df -h --output=source,size,used,avail,pcent,target | tail -n +2

    echo "=== Disk usage checked ==="
}

check_disk_usage

# Memory usage
check_memory_usage() {
    echo "=== Checking Memory Usage ==="
    free -h

}

check_memory_usage

# Docker Daemon status
docker_daemon_status() {
    echo "=== Checking Docker Daemon Status ==="
    systemctl is-active docker && echo "Docker Daemon is running." || echo "Docker Daemon is not running."
}

docker_daemon_status

