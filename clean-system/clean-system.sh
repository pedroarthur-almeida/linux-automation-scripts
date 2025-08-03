#!/bin/bash

echo "Starting system cleanup..."

echo "Cleaning APT cache..."
sudo apt-get clean

echo "Cleaning user cache (~/.cache)..."
rm -rf ~/.cache/*

echo "Cleaning temporary files (/tmp and /var/tmp)..."
sudo rm -rf /tmp/*
sudo rm -rf /var/tmp/*

echo "Cleaning old thumbnails (~/cache/thumbnails)..."
rm -rf ~/.cache/thumbnails/*

echo "Cleanup completed successfully."
