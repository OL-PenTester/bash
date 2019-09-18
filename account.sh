#!/bin/bash

# Check if user is Root
if [[ ${UID} -ne '0' ]]
then
	echo 'You are not autharized for this process'
	exit
fi

# Ask for full name
read -p 'Full Name: ' full_name # Set the input data to "full_name" variable

# Ask for user name
read -p 'User Name: ' user_name # Set the input data to "user_name" variable

# Check for user name length
username_length=${#user_name}

if [[ ${username_length} -lt 3 ]]
then
	echo 'User name should be at least 3 characters'
	exit
fi

# Ask for password
read -sp 'Password: ' password # Set the input data to "password" variable

# Check for password length
password_length=${#password}

if [[ ${password_length} -lt 8 ]]
then
	echo 'Password should be at least 8 characters'
	exit
fi

# Create the user
useradd -c "${comment}" -m ${user_name}

# Set the password for the user
echo -e "$password\n$password" | passwd "$user_name"

# Change password on first login
passwd -e ${user_name}
