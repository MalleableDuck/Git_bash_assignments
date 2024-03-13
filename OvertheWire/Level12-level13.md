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
14. `gzip -d binary_data.gz`
15. > Again checking the type of the file binary_data we see it's bzip2 compressed, again we decompress it
16. `bzip2 -d binary_data`
17. > We see it's gzip compress again so we decompress the same way we did earlier
18. > Now we see that after compression file is in a TAR archive so let's extract it
19. `tar -xf binary_data`
20. > The next file is also a tar file so we extract it again, we see that again it's bzip2 compressed and goes in the given pattern, so we can keep decompressing and extracting files until we get an ACII file
21. `cat data8`
22. > data8 was the file that finally had ASCII text in it
23. > We can can copy the password on the terminal onto our clipboard
24. `cd ~`
25. `exit`
26. `ssh bandit13@bandit.labs.overthewire.org -p 2220`
27. `wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`
---
**With this we've logged into level-13**
