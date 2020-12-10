@echo off
set /p commit="Enter Commit Value: "
cd public
git status
git add .
git commit -m "%commit%"
git push -u origin master
echo Commit Pushed
pause