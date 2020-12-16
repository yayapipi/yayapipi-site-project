@echo off
set /p commit="Enter Commit Value: "
hugo
cd public
git status
git add .
git commit -m "%commit%"
git push -u origin master
echo Public Commit Pushed
cd ..
git status
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin master
echo Root Commit Pushed
cd themes/hugo-PaperMod
git status
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin main
echo Themes Commit Pushed
pause