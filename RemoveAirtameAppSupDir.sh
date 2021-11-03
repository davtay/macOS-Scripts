#!/bin/bash

# Get current user
targetUser=$(who | grep console | awk '{ print $1 }')

# If a user is logged in
if [ -n "$targetUser" ]; then
    # Quit Airtame application
    killall Airtame
    # Set target directory
    targetDir="/Users/$targetUser/Library/Application Support/airtame-application"
    # If target directory exists, remove it
    [ -d "$targetDir" ] && { echo "Removing ""$targetDir""..."; rm -Rf "$targetDir"; }
    # Reopen Airtame application after 2 seconds
    sleep 2
    open -a /Applications/Airtame.app
# If a user is not logged in
else
    # Output information
    echo "No user is currently logged in"
fi
