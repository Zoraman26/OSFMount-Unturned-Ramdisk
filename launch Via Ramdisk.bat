@ECHO OFF
SET RAMDISK_DRIVE=R:
SET RAMDISK_SIZE=3G
SET RAMDISK_LABEL=RAM Disk
IF NOT EXIST "%RAMDISK_DRIVE%" (
  "%PROGRAMFILES%\OSFMount\OSFMount.com" -a -t vm -s %RAMDISK_SIZE% -o format:fat32:"%RAMDISK_LABEL%" -m "%RAMDISK_DRIVE%
  MKDIR "%RAMDISK_DRIVE%\Unturned"
)
echo Copying files
xcopy "D:\SteamLibrary\steamapps\common\Unturned" "R:/Unturned" /s /e /y
echo Launching program
"R:/Unturned/Unturned.exe"
echo Program closed press any key to save and unmount
pause
xcopy "R:\Unturned\Worlds" "D:\SteamLibrary\steamapps\common\Unturned" /s /e /y
echo Save complete
echo Press any key to dismount the ram disk
echo THIS WILL DESTROY ALL DATA ON THE RAMDISK
pause
"C:\Program Files\OSFMount\OSFMount.com" -d -m R: