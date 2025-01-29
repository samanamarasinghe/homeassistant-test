#!/bin/bash

echo "Starting my custom add-on..."

# Example: Start a Python script or service
##python3 -m http.server 8080 &
nx584_server --serial /dev/ttyUSB0 --baud 9600

# Keep the process running
while true; do
    sleep 60
done
