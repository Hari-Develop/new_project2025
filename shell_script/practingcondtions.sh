#!/bin/bash

ID=$(id -u)
echo "$ID"
if [ "$ID" -eq 0 ];
then
    echo "user has the root access"
else
    echo "Error: please run the user with root access"
fi