@echo off

echo Commands:
echo		takeowner 			Take ownership of folder
echo		kill 				kill any application
echo		numgen				Number Generator
echo.
echo.

set /p COMMAND="Command: "
call commands\%COMMAND%

