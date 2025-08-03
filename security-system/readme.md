🛡️ security-audit

This script performs a basic security audit and update on Ubuntu. It is designed to help identify potential security risks and apply system updates by checking:

    Package list updates (apt update)

    Installation of security updates (unattended-upgrade)

    Services enabled at boot

    Currently active services

    Open ports and listening applications

    Users with login permissions

    Permissions of sensitive files (/etc/passwd, /etc/shadow, /etc/sudoers)

    Users with sudo privileges

    List of all running services

    Detection of sensitive services (e.g., SSH, Apache, FTP)

    Active shell users

A log file is generated and saved with a timestamped name for future reference.

Usage: Run the script with root privileges:
```
chmod +x security-audit.sh
sudo ./security-audit.sh
```
