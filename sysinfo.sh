#!/bin/bash
# BL Boron / OpenBox - Basic System Info Notification

INFO=$(echo -e "Hostname: $(hostname)\nUptime: $(uptime -p)\nCPU: $(grep 'model name' /proc/cpuinfo | head -1 | cut -d: -f2)\nMemory: $(free -h | grep Mem | awk '{print $3 "/" $2}')\nDisk: $(df -h / | awk 'NR==2 {print $3 "/" $2 " used"}')")

notify-send "BL Boron System Info" "$INFO"
