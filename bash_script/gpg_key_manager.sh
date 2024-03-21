#usr/bin/bash

create_new_key(){

echo "creating a new key"
gpg --full-generate-key

}

add_existing_key(){

echo "Given below is the list of all the keys that have been generated, enter the ID of the one you'd like to add"
gpg --list-secret-keys --keyid-format LONG | grep '^sec' | awk '{print $2}' | awk -F '/' '{print $2}'
read required_id

if [ -n "$required_id" ]; then
        git config --global user.signingkey $required_id
        git config --global commit.gpgsign true
        git config --global user.signingkey
        echo "You can add the selected gpg key to your account"
else
        echo "Copy the ID from list above accurately"
fi

}

list_of_keys(){

echo "list of all keys"
gpg --list-secret-keys --keyid-format LONG | grep '^sec' | awk '{print $2}' | awk -F '/' '{print $2}'

}

starting_menu(){

echo "To generate a new gpg key type (1)"
echo "To add an existing gpg key type (2)"
echo "To see the list of all gpg keys type (3)"

}

check_need="y"
while [ "$check_need" == "y" ]
do
        echo "Welcome to GPG key setup for Git, would you like to continue? (y/n)"
        read check_need

        if [ "$check_need" == "y" ]; then
                starting_menu
                read option
                if [ "$option" == 1 ]; then
                        echo "Creating a new GPG key"
                        create_new_key
                        #check_other
                elif [ "$option" == 2 ]; then
                        add_existing_key
                elif [ "$option" == "3" ]; then
                        list_of_keys
                else
                        echo "That's not a valid input, please enter an integer from 1 to 4"
                fi
        else
                echo "Exiting command"

        fi
done
