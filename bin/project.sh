#!/usr/bin/env bash

# Name:        project.sh
# Author:      Johan Eriksson
# Description: Start off development session

# Get the script and root directories
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
rootdir=$(readlink -m "$scriptdir/..")

# Configure i3 workspace and layout
i3-msg "workspace 4"
# Uncomment the line below to load the i3 layout
# i3-msg "append_layout $rootdir/bin/ws-primary.json"

editor.sh "$rootdir"

sleep 2

# Define URLs to open
urls=(
    'https://chatgpt.com'
    'https://github.com'
)

# Open the first URL in a new window
browser.sh waye --new-window "${urls[0]}" &>/dev/null &

# Wait for the first window to open
sleep 2

# Open the remaining URLs in the same window
for url in "${urls[@]:1}"; do
    browser.sh waye "$url" &>/dev/null &
done

sleep 1

i3-msg "workspace 5"

# Start main development session in Kitty terminal
if command -v kitty &>/dev/null; then
    kitty --name "editor" --override font_size=12 "$scriptdir/main-session.sh" &>/dev/null &
else
    echo "Kitty terminal is not installed."
    exit 1
fi

sleep 3
i3-msg "workspace 4"
