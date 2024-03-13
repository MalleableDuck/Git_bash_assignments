# Level 13
## Lines of code:-
1. `cd /`
2. `cd tmp`
3. `mkdir tmp_folder`
4. `cd tmp_folder`
5. > With this we have a tmp directory to add, extract and unzip files
6. `cp ~/data.txt .`
7. > With this we've copied the data into the tmp folder
8. `mv data.txt data`
9. > As we know it's a hexdump we can undo it to get its binary equivalent
10. `xxd -r data > binary_data`
11. `file binary_data`
12. > With this we see that the file binary_data is gzip compressed, so to uncompress it we'll convert it into a .gz file and uncompress it
13. `mv binary_data binary_data.gz`
14. `gzip`
15. With 
16. `cd ~`
17. `exit`
18. `ssh bandit13@bandit.labs.overthewire.org -p 2220`
19. `wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`
---
**With this we've logged into level-13**
