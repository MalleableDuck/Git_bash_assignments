#usr/bin/bash

create_new_key(){

echo "creating a new key"
gpg --full-generate-key
}

add_existing_key(){

echo "Given above is the list of all the keys that have been generated, enter the index if the ID of the one you'd like to add"
read required_id_pos
while IFS= read -r line; do
        key_ids+=( "$line" )
done < <( gpg --list-secret-keys --keyid-format=long | awk '/sec/{if (length($2)>0) print $2}' )

req_key_id="$key_ids[(required_id_pos - 1)]"

if [ -n "$req_key_id" ]; then
        git config --global user.signingkey $req_key_id
        git config --global commit.gpgsign true
        git config --global user.signingkey
        echo "You can add the selected gpg key to your account"
else
        echo "Enter an integer value for the key-id given that is within its bounds"
fi

}

list_of_keys(){

echo "list of all keys"
while IFS= read -r line; do
        key_ids+=( "$line" )
done < <( gpg --list-secret-keys --keyid-format=long | awk '/sec/{if (length($2)>0) print $2}' )
for i in "${!key_ids[@]}"; do
        printf "\n$((i+1)). "
        printf "Key_ID:- ${key_ids[$i]}\n"
done
}

starting_menu(){

read -r -d '' -a keys_array <<< "$line"
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
                        list_of_keys
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
