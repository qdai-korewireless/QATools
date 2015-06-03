@ECHO OFF
REM This script cannot be run on its own. Jump to end.
IF %1=="" GOTO :EOF



SET ENV_PATH=%CD%\env
SET DEFAULT=%CD%\env\default.bat

IF EXIST "%DEFAULT%" GOTO Load

:Choose
CLS
ECHO Choose an environment
CD "%ENV_PATH%"
DIR /b "%ENV_PATH%\*.txt"

SET ENV=
SET /P ENV=[TAB] auto-completes: 
CD..

IF DEFINED ENV COPY "%ENV_PATH%\%ENV%" "%DEFAULT%" > NUL
IF EXIST "%DEFAULT%" GOTO Load
GOTO :Error

:Load

CALL "%DEFAULT%" 1

SET Change=Y
SET /P Change=Your environment is [%EnvName%]. Proceed? [Y]/N 
IF %Change%==N GOTO Choose
IF %Change%==n GOTO Choose

ECHO.
GOTO EOF

:Error
ECHO Error loading environment. Further processing may fail. Proceed with caution.

:EOF
