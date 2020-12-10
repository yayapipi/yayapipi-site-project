@echo off
echo "projects:game, app, web, story, art, unknown"
echo "posts:tech, develop, share, review"
set /p id="Enter Article Name: "
hugo new %id%
echo %id% is created
pause