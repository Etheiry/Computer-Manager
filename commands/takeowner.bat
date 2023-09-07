@echo off
Rem Takes ownership of folders & files
set /p TAKEOWNER="File Path (absolute): "
takeown /f %TAKEOWNER% /r /d y
icacls %TAKEOWNER% /grant administrators:F /T
