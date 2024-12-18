#!/usr/bin/env bash

# Name:        main-session.sh
# Author:      Johan Eriksson
# Description: Start a tmux session

session_name="python-template"
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
rootdir=$(readlink -m "$scriptdir/..")

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "tmux is not installed. Please install it and try again."
    exit 1
fi

# Check if the session already exists
if ! tmux has-session -t "$session_name" 2>/dev/null; then
    # Create a new session in detached mode
    tmux new-session -d -s "$session_name" -c "$rootdir"

    # Rename the first window for main terminal work
    main_window_name="  "
    tmux rename-window -t "$session_name:0" "$main_window_name"

    # Create a second window for settings or configuration tasks
    settings_window_name="  "
    tmux new-window -d -t "$session_name" -n "$settings_window_name" -c "$rootdir"

    # Select the main window as the active one upon attaching
    tmux select-window -t "$session_name:$main_window_name"
fi

# Attach to the tmux session
tmux attach-session -t "$session_name"
