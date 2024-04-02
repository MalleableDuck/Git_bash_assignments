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

delete_key(){

list_of_keys
echo "Choose the index of the key you'd like to delete from the above list"
read required_id_pos
if [[ $gpg_count -ge $required_id_pos ]] && [[ $required_id_pos -gt 0 ]]; then
        gpg_to_delete="${keys_array[(required_id_pos - 1)]}"
        gpg --delete-secret-keys $gpg_to_delete
        echo -e "${GREEN}Gpg deleted with id $(echo -n "$gpg_to_delete" | tr -d '\n') ${DEFAULT}"
else
        echo -e "${RED}Please enter from 1 to $gpg_count${DEFAULT}"
fi
}

starting_menu(){

read -r -d '' -a keys_array <<< "$line"
echo "To generate a new gpg key type (1)"
echo "To add an existing gpg key type (2)"
echo "To see the list of all gpg keys type (3)"
echo "To delte an existing gpg key type (4)"
}
