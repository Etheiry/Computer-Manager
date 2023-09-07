@echo off
color 4

echo.=
echo.
echo.

goto KILLMENU
:KILLMENU
set /p OPTION="kill by (PID) or (Name): "
IF [%OPTION%] == "PID" goto PIDKILL
IF [%OPTION%] == "Name" goto PROCESSNAMEKILL


:PIDKILL
tasklist 
set /p PIDNUM="PID Number: "
taskkill /F /PID %PIDNUM%
goto KILLMENU

:PROCESSNAMEKILL
tasklist 
set /p PROCESSNAME="Process name: "
taskkill /IM PROCESSNAME /F
goto KILLMENU

