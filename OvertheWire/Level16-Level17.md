# Level 17
## Lines of code:-
1. `nmap -v -sV localhost -p 31000-32000` *(In order to find which ports on the local hos tion the given range are open, we see that only port 31790 has supports ssl and doesn't echo)*
2. `openssl s_client -connect localhost:31790`
3. > With this we get the RSA key for the next level, copy onto our clipboard
4. `cd ~`
5. `exit`
6. > now create a new file to save the RSA key
7. `vi rsa_key.key`
8. > Now we must change the visibility of the key, as it's a private key we need to make the visibility for others zero
9. `chmod 400 rsa_key.key`
10. `ssh -i rsa_key.key -p 2220 bandit17@bandit.labs.overthewire.org`
---
**With this we've logged into level-17**
