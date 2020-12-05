@echo off
set /p commit="Enter Commit Value: "
hugo
cd public
git add .
git commit -m "%commit%"
git push -u origin master
echo Commit Pushed
pause