@echo off
color B

IF NOT EXIST "logcredentials\uname.txt" goto SIGNUP
IF NOT EXIST "logcredentials\upassword.txt" goto SIGNUP
goto LOGIN



REM Account signup
:SIGNUP
title Register
cls
echo -------------------------------------------------
echo                     SignUp
echo -------------------------------------------------
echo.

REM Prompt user register account
set /p UNAME="Enter Username: "
set /p UPASS="Enter Password: "
echo.
echo.

REM if user input == nothing call error
IF [%UNAME%] == [""] goto SIGNUPERROR
IF [%UPASS%] == [""] goto SIGNUPERROR
goto CREATEACC


REM Invalid username or password call SIGNUP function
:SIGNUPERROR
echo -------------------------------------------------
echo                     Error
echo -------------------------------------------------
echo Invalid Username or password
pause
goto SIGNUP


:CREATEACC
echo %UNAME% >> logcredentials\uname.txt
echo %UNAME% >> logcredentials\upassword.txt
attrib logcredentials\uname.txt +s +h
attrib logcredentials\upassword.txt +s +h
goto LOGIN


:LOGIN
set/p uname = < logcredentials\uname.txt
set/p pass = < logcredentials\upassword.txt
title Login
cls
echo -------------------------------------------------
echo                       Login					
echo -------------------------------------------------
echo.
echo.
set /p "unamel=_               Username : "
set /p "passwordl=_               Password : "
echo.
IF "%unamel%"=="" goto LOGINERROR
IF "%passwordl"=="" goto LOGINERROR
IF NOT %unamel%==%uname% goto LOGINERROR
IF NOT %passwordl%==%pass% goto LOGINERROR
goto LOADING


:LOGINERROR
echo -------------------------------------------------
echo                     Error
echo -------------------------------------------------
echo Invalid Username or password
pause
goto LOGIN

:LOADING
title Loading...
set load=%load%!!!!!!!
cls
echo -------------------------------------------------
echo                       Login
echo -------------------------------------------------
echo.
echo.
echo                 Username : %unamel%
echo                 Password : %passwordl%
echo.
echo.
echo          Logging in...
echo          ===================================
echo          %load%
echo          ===================================
echo.                              Please Wait...
echo.
ping localhost -n 2 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==5 goto DONE
goto LOADING

:DONE
title Done
cls
echo -------------------------------------------------
echo                       Done
echo -------------------------------------------------
echo.
echo               #
echo             #
echo     #     #            Login Successfully
echo      #  #
echo       #
echo.
echo.
echo -------------------------------------------------
pause
cls
call main.bat