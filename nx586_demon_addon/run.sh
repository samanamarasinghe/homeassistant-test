#!/bin/bash

echo "Starting my custom add-on..."

CONFIG_FILE=$(jq --raw-output '.config_path' /data/options.json)
DEFAULT_CONFIG_FILE="/app/default_nx584_config.ini"

# Check if the config file exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Using config file: $CONFIG_FILE"
else
    echo "Copying default config to $CONFIG_FILE"
    cp "$DEFAULT_CONFIG_FILE" "$CONFIG_FILE"
fi



# Example: Start a Python script or service
##python3 -m http.server 8080 &
nx584_server --serial /dev/ttyUSB0 --baud 9600 --config "$CONFIG_FILE"

# Keep the process running
while true; do
    sleep 60
done
