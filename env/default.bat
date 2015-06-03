@ECHO OFF
REM This script cannot be run on its own. Jump to end.
IF %1=="" GOTO EOF

SET EnvName=KW-PERF

SET BEServer=172.30.101.17
SET BEDB=KW-PERF-A-BE
SET BELOGIN=-U sa_dev -P devserver


SET FEServer=172.30.101.11
SET FEDB=KW-PERF-A-FE
SET FELOGIN=-U sa_dev -P devserver
