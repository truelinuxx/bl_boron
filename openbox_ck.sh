#!/bin/bash

# This script checks if Openbox is running.

if pgrep openbox > /dev/null
then
    echo "Openbox running."
else
    echo "Openbox NOT running."
fi
