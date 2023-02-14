@echo off
cd %~dp0
cd 

echo.
echo. 
echo Installing Visual Studio Runtime 
cd Packages
call "%cd%\vstor_redist.exe" /q /norestart
echo Complete!

echo. 
echo. 
echo Installing Bipsync64
call msiexec.exe /i "%cd%\Bipsync64.msi" /qn
echo Complete!


echo. 
echo. 
echo Installing add-ins
call install.bat
echo Complete!

cd %~dp0
echo Copying OPTIONS.INI for Bipsync
cd Packages
robocopy "%cd%" "C:\Program Files\Bipsync\Bipsync Notes" OPTIONS.ini /w:0 /r:3 /NFL /NDL /NJH /NJS /nc /ns /np
ping localhost -n 10 >nul 