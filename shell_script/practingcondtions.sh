#!/bin/bash

ID=$(id -u)
echo "$ID"
if [ "$ID" -eq 0 ];
then
    echo "user has the root access"
else
    echo "Error: please run the user with root access"
fi

apt-get install mysql -y 

if [ $? -ne 0 ];
then
    echo "Print the mysql is failed to install"

else 
    echo "print mysql installtion is successful"
fi