@echo off
git status
set /p commit="Enter Commit Value: "
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin master
echo Commit Pushed
pause