@echo off
color 0E

::
:: Edit these 4 SET variables:
::
SET HOST=localhost
SET USERNAME=yourusername
SET PASSWORD=yourpassword
SET DBNAME=yourdbname
::
::
:: 
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"

set "fullstamp=%MM%-%DD%-%YYYY%_%HH%-%Min%-%Sec%"
echo MySQL DB Backup Script
echo Make backup for %fullstamp%
pause

set bkupfilename=%fullstamp%.sql

C:\MAMP\bin\mysql\bin\mysqldump.exe -h%HOST% -u%USERNAME% -p%PASSWORD% %DBNAME% > C:\Users\d65\Desktop\"%DBNAME%_%bkupfilename%"
