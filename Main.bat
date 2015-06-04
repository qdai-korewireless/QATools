@ECHO OFF

CALL env\Load.Env.bat 1
IF NOT DEFINED EnvName GOTO EnvError

cd carriers

:Carrier
cls
echo ======%EnvName%=======
echo.
echo ----- Carrier ------
echo 1. AT^&T (US Gold)
echo 2. T-Mobile
echo 3. Optus
echo --------------------
echo.
set /p carrierNum=carrier:
set carrier=
if %carrierNum%==1  set carrier=ATT
if %carrierNum%==2  set carrier=T-Mobile
if %carrierNum%==3 set carrier=Optus
IF NOT DEFINED carrier GOTO CarrierError

echo.
echo.
:Function
cls
echo========%EnvName% ^> %carrier%============
echo ------ Functions ------
REM display shared functions
DIR  /B /A:-D *.bat
echo.
REM display carrier functions
for %%A in ("%carrier%\%carrier%.*.bat") do echo %%A
echo -----------------------
echo.

SET /P callFunction=Function Name:
cls
echo========%EnvName% ^> %carrier% ^> %callFunction%==========

REM Override shared functions by finding carrier function first.
IF exist %carrier%\%callFunction% (
	CALL %carrier%\%callFunction% 1
	GOTO DONE
)
IF exist %callFunction% (
	CALL %callFunction% 1
	GOTO DONE
)
GOTO DONE

REM ---------------Error Messages-------------

:EnvError
echo Environment is not set properly.
goto EOF

:CarrierError
Echo No carrier defined.
goto Carrier

:DONE
echo Finished!
echo.
set /P continue=Do you like to continue with same carrier? [y/n]:
cls
if %continue% == y  (GOTO Function)
if %continue% == n  (GOTO Carrier)

:EOF
pause