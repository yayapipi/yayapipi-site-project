@echo off
set /p id="Enter Article Name: "
hugo new %id%
echo %id% is created
pause