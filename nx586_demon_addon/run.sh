#!/bin/bash

echo "Starting my custom add-on..."

#CONFIG_FILE=$(jq --raw-output '.config_path' /data/options.json)
CONFIG_FILE="/data/nx584_config.ini"
DEFAULT_CONFIG_FILE="/app/default_nx584_config.ini"

cp "$DEFAULT_CONFIG_FILE" "$CONFIG_FILE"

# Check if the config file exists
if [ -f "$CONFIG_FILE" ]; then
    echo "Using config file: $CONFIG_FILE"
else
    echo "Copying default config to $CONFIG_FILE"
    cp "$DEFAULT_CONFIG_FILE" "$CONFIG_FILE"
fi



# Example: Start a Python script or service
##python3 -m http.server 8080 &
nx584_server --serial /dev/ttyUSB0 --baud 9600 --config "$CONFIG_FILE"  --listen 127.0.0.1 --port 5007

# Keep the process running
while true; do
    sleep 60
done
