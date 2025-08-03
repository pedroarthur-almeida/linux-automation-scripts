🧹 system-update-clean

This script updates and cleans an Ubuntu-based system. It helps keep the system secure, up to date, and free from unnecessary files by performing:

    System repository and package updates (apt update && apt upgrade)

    Snap package updates (if Snap is installed)

    Flatpak package updates (if Flatpak is installed)

    Removal of orphaned and unused packages (autoremove)

    Cleanup of old and unnecessary cache files (autoclean, clean)

Usage: Run the script with execution permissions:
```
chmod +x update-clean.sh
./update-clean.sh
```
You may need to run it with sudo to allow system updates and cleanup.
