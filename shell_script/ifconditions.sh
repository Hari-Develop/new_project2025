#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "Disk usage is: ${usage}%"

if [ "$usage" -ge 80 ]; then
    echo "Disk usage is critically high!"
else 
    echo "Disk usage under control"
fi

