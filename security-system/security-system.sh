#!/bin/bash

# First, we need to check if the script is running as root, i.e., superuser, to have the necessary permissions.

if [[ $EUID -ne 0 ]]; then
	echo "Please run this script as sudo or as root."
	exit 1
fi

LOG="/home/pedro-almeida/Documentos/GitHub/linux-automation-scripts/security-system/audit_$(date +%Y%m%d_%H%M%S).log"

echo "Starting security audit and update"

echo -e "\n1) Updating package list..."
apt update -qq

echo -e "\n2) Installing security updates..."
unattended-upgrade -d

echo -e "\n3) Services enabled to start at boot:"
systemctl list-unit-files --type=service | grep enabled

echo -e "\n4) Currently active services:"
systemctl list-units --type=service --state=running

echo -e "\n5) Open ports and listening programs:"
ss -tuln

echo -e "\n6) Users with login permissions:"
awk -F: '$7 ~ /(bash|sh)/ { print $1 }' /etc/passwd

echo -e "\n7) Permissions of sensitive system files:"
ls -l /etc/passwd /etc/shadow /etc/sudoers

echo -e "\n8) Users with administrative privileges (sudo):"
getent group sudo | cut -d: -f4

echo -e "\n9) Running services:"
systemctl list-units --type=service --state=running | grep ".service" | awk '{print $1}' | sort

echo -e "\nSensitive services detected:"
for servico in ssh apache2 vsftpd telnet samba cups ftp; do
	if systemctl is-active --quiet "$servico"; then
		echo "Running service: $servico"
	fi
done

echo "[$(date)] Checking users with active shell..." | tee -a "$LOG"

awk -F: '($7 !~ /nologin|false/) { print $1 ": " $7 }' /etc/passwd | tee -a "$LOG"

echo "[$(date)] Security check completed successfully." | tee -a "$LOG"
echo "Report saved at: $LOG"
