#!/bin/bash
# Simple real-time network speed monitor

# Find the active network interface (e.g., eth0, wlan0)
INTERFACE=$(ip route | grep default | awk '{print $5}')

# Check if vnstat is installed
if ! command -v vnstat &> /dev/null; then
    echo "Error: vnstat not installed. Run: sudo apt install vnstat"
    exit 1
fi

# Clear screen and show live stats
clear
echo "Network Speed Monitor (Interface: $INTERFACE)"
echo "Press Ctrl+C to exit..."
echo "----------------------------------------"

# Show live traffic (refreshes every second)
vnstat -i "$INTERFACE" --live
