# Lines of code:-
1. `git stash`
2. `vi bug.txt` *(Remove the buggy line in the txt file)*
3. `git commit -am "remove bug"`
4. `git stash apply`
5. `vi bug.txt` *(Add the line "Finally, finished it!" at the end of the paragraph)*
6. `git commit -am "Finished removing the bug"`
7. `git verify`
---
*We can save our point of work with stash apply, change the bug.txt file as that's the only small change required and then save work from that point*
**With this we've finished the level-7**
