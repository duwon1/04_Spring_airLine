@ECHO OFF
SETLOCAL
SET HOUR=%TIME:~0,2%
IF "%HOUR:~0,1%" == " " SET HOUR=0%HOUR:~1,1%
SET T=%HOUR%%TIME:~3,2%%TIME:~6,2%
SET D=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%
SET DATETIME=%D%_%T%
expdp testadmin/1234 schemas=testadmin directory=DATA_DUMP DUMPFILE=dump%DATETIME%.dmp LOGFILE=dump%DATETIME%D.log
pause