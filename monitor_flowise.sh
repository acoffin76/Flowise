#!/bin/bash

# Function to check if the process is running
is_process_running() {
    pgrep -f "pnpm start" > /dev/null
    return $?
}

# Function to start the process
start_process() {
    echo "Starting pnpm start..."
    cd /home/ubuntu/Apps/Flowise
    ./startFlowise.sh > /dev/null 2>&1
}

# Main loop
while true; do
    if ! is_process_running; then
	    echo "$(date) Flowise is not running. Restarting..."
        start_process
    else
	    echo "$(date) Flowise is running."
    fi
    
    # Wait for 60 seconds before checking again
    sleep 60
done
