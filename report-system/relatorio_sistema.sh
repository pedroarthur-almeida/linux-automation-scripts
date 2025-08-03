#!/bin/bash

arquivo="system_report.txt"

echo "System report generated on: $(date)" > $arquivo

echo -e "\nSystem information" >> $arquivo
uname -a >> $arquivo

echo -e "\nUptime" >> $arquivo
uptime -p >> $arquivo

echo -e "\nDisk usage" >> $arquivo
df -h >> $arquivo

echo -e "\nRAM usage" >> $arquivo
free -h >> $arquivo

echo -e "\nTop 5 CPU consuming processes" >> $arquivo
ps -eo pid,command,%cpu --sort=-%cpu | head -n 6 >> $arquivo

echo -e "\nIP addresses" >> $arquivo
hostname -I >> $arquivo

echo -e "\nReport successfully generated in file: $arquivo"
