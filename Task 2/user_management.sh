#!/bin/bash

# Shell Script for User Management
# Function to Create a New User
create_user() {
    echo "Enter the username: "
    read username

    # Check if the username already exists
    if id "$username" &>/dev/null; then
        echo "Error: Username $username already exists. Please choose a different username."
    else
        echo "Enter the Password for username: "
        read -s password

        # Create the user account
        sudo useradd -m -p "$password" "$username"
        echo "User $username created successfully."
    fi
}

# Function to Delete an existing User
delete_user() {
    echo "Enter the username to delete: "
    read username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        sudo userdel -r "$username"
        echo "User $username Deleted Successfully."
    else
        echo "Error: Username $username does not exist. Please enter a valid username."
    fi
}

# Function to reset the password for an existing User
reset_password() {
    echo "Enter the username to reset password: "
    read username

    # Check if the username exists
    if id "$username" &>/dev/null; then
        echo "Enter the new password for $username: "
        read -s password

        # Set the new password
        sudo passwd $username
        echo "Password for user $username reset successfully."
    else
        echo "Error: Username '$username' does not exist. Please enter a valid username."
    fi
}

# Function to list all Users on the system
list_users() {
    echo "User accounts on the system:"
    cat /etc/passwd | awk -F: '{ print "- " $1 " (UID: " $3 ")" }'
}

# Main menu
show_menu () {
  echo "Choose an option:"
  echo "1. Create user"
  echo "2. Delete user"
  echo "3. Reset Password"
  echo "4. List Users"
  echo "5. Exit"
}

while true; do
    show_menu
    read option

    case $option in
       1) create_user ;;
       2) delete_user ;;
       3) reset_password ;;
       4) list_users ;;
       5) echo "Exiting..."; break ;;
       *) echo "Invalid option" ;;
    esac

    echo "Would you like to continue or press 5 to exit"
done
