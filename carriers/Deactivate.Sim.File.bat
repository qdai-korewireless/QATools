@ECHO OFF
IF %1=="" GOTO :EOF
SET INPUT=%carrier%\scripts\Deactivation.Upload.File.sql

SET /P Count=Count of SIMs to Load: 
SET /P CompanyID=CompanyID: 
SET /P Continue=Press [Enter] to generate file.

SQLCMD -S %FESERVER% %FELOGIN% -d "%FEDB%" -h -1 -i "%input%" -o "..\DeactivateSim.txt"

:EOF



