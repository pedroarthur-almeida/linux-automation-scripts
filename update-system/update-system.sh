#!/bin/bash

# Script to update and clean the system.

echo "Starting system update..."

# Here the system repositories and packages are updated.
sudo apt update && sudo apt upgrade -y

# In case the user uses snap.
if command -v snap &> /dev/null; then
	echo "Updating snap packages..."
	sudo snap refresh
fi

# In case the user uses flatpak.
if command -v flatpak &> /dev/null; then
	echo "Updating flatpak packages..."
	flatpak update -y
fi

# Here, orphaned and unnecessary packages are removed.
echo "Removing orphaned packages and performing system cleanup..."
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

echo "System successfully updated and cleaned."
