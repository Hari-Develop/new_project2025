#!/bin/bash
# Create a script to check disk usage and send an alert if it exceeds 80%.

THRESHOLD=80
R=\e[31m
G=\e[32m
N=\e[0m
DISK_USAGE=$( df -h /| awk 'NR==2 {print $5}' | sed 's/%//' )

if [ "$DISK_USAGE" -eq "$THRESHOLD" ];
then
    echo " Disk usage is high please check ${DISK_USAGE}  ${R}alert${N}" &>> /tmp/logs
else
    echo " Dis usage is less ${DISK_USAGE} ${G}safe${N} " &>> /tmp/logs
if
