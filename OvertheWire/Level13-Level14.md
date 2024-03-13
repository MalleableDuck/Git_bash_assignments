# Level 14
## Lines of code:-
1. `ls`
2. > Here we see that there is only a ssh key so we take open the bandit14 via the ssh key
3. `ssh -i sshkey.private -p 2220 bandit14@localhost`
4. > This allows us to login via bandit14
5. `cat /etc/bandit_pass/bandit14`
6. > The key which is now printed on the terminal can be copied onto the clipboard
7. `cd ~`
8. `exit`
9. `exit`
10. `ssh bandit14@bandit.labs.overthewire.org -p 2220`
11. `fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq`
---
**With this we've logged into level-14**
