@ECHO OFF
IF %1=="" GOTO :EOF
SET INPUT=%carrier%\scripts\Upload.Msisdn.Load.File.sql

SET /P Count=Count of SIMs to Load: 

SET /P Continue=Press [Enter] to generate file.

SQLCMD -S %FESERVER% %FELOGIN% -d "%FEDB%" -h -1 -i "%input%" -o "..\msisdn.txt"

:EOF