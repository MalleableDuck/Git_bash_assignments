#usr/bin/bash

source utils.sh

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
                        list_of_keys
                        add_existing_key
                elif [ "$option" == "3" ]; then
                        list_of_keys
                elif [ "$option" == "4" ]; then
                        delete_key
                else
                        echo "That's not a valid input, please enter an integer from 1 to 4"
                fi
        else
                echo "Exiting command"

        fi
done
