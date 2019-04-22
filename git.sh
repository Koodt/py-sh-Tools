###Delete a Local GitHub Branch
git branch -d yourbranch
Deleted branch yourbranch (was 2a4ef7)

error: The branch 'my-branch' is not fully merged.
If you are sure you want to delete it, run 'git branch -D my-branch'.

git branch -D yourbranch
Deleted branch yourbranch (was 2a4ef7)

###Delete a Remote GitHub Branch
git push origin --delete yourbranch

###Delete Merged Branches
git branch --merged master | grep -v "\*master" | xargs -n 1 git branch -d
git branch --merged | grep -v "\*" | xargs -n 1 git branch -d

###Delete All Branches Except Master
git branch | grep -v "master" | sed 's/^[ *]*//' | sed 's/^/git branch -d /' | bash

###Recover a Deleted GitHub Branch
git fsck --full --no-reflogs | grep commit
dangling commit 609bb956bc9ef1b43c0w6af60fa009e37be0566d
dangling commit 608bb956bc9ef1b43c0g4af60fa0e9e34be0566d
dangling commit 708bb956bc9ef1b43c0wdaf60fa000e99be0566d
dangling commit 402bb956bc9ef1b43c0d4af60fa001e87be0566d

git show 609bb956bc9ef1b43c0w6af60fa009e37be0566d

git branch 609bb956bc9ef1b43c0w6af60fa009e37be0566d


DIFFF!!!!
git diff --no-index setup.py setup.py_fix
