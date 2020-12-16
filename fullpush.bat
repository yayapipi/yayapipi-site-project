@echo off
set /p commit="Enter Commit Value: "
hugo
cd public
git status
git add .
git commit -m "%commit%"
git push -u origin master
echo ^<ESC^>[31m Public Commit Pushed
cd ..
git status
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin master
echo ^<ESC^>[31m Root Commit Pushed
cd themes/hugo-PaperMod
git status
git add .
git rm --cached public -f
git commit -m "%commit%"
git push -u origin main
echo ^<ESC^>[31m Themes Commit Pushed
pause