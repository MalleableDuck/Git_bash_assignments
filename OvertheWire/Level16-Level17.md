# Level 16
## Lines of code:-
1. `nmap -v -sV localhost -p 31000-32000` *(In order to find which ports on the local hos tion the given range are open, we see that only port 31790 has supports ssl and doesn't echo)*
2. `openssl s_client -connect localhost:31790`
3. > Paste the previous password into the terminal
4. > The key which is now printed on the terminal can be copied onto the clipboard
5. `cd ~`
6. `exit`
7. `ssh bandit16@bandit.labs.overthewire.org -p 2220`
8. `JQttfApK4SeyHwDlI9SXGR50qclOAil1`
---
**With this we've logged into level-16**
