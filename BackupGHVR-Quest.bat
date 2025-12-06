@echo off

goto:checkForADB

if "%adb%" == "1"(
  adb kill-server
  adb start-server 
  goto:start
) else (
  goto:end
)


:start
call:listFunctions
 
if "%select%"=="1" (
  goto:SaveAllSaves
) else if "%select%"=="2" (
  goto:ClearAllSaves
) else if "%select%"=="3" (
  goto:end
) else (
  goto:start
)

:end
pause
exit

:SaveAllSaves
set /p "folder=Enter path to save: "
if exist %folder%\ (
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/SOA/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Story/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Survival/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Settings/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_SOA/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_Story/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_Survival/ %folder%
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Challenge/ %folder%

  echo ----------------------------
  echo File saved at %folder% (if exists)
  
) else (
  echo /!\ Failed, Folder does not exist /!\
)
goto:start

:checkForADB
  adb devices -l | find "device product:" >nul
  if errorlevel 1 (
    echo No connected devices
    set adb = "0"
  ) else (
    echo ADB Found and devices connected!
    set adb = "1"
  )
  goto:start

:ClearAllSaves
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/SOA/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Story/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Survival/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_SOA/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_Story/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/COOP_Survival/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Challenge/
  adb shell rm -r /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Settings/
  goto:start

:listFunctions 
  echo ------------------------------
  echo SELECT WHAT YOU WANT TO DO
  echo 1 - Backup all ghvr save files to a folder
  echo 2 - Clear all saves (no return possible)
  echo 3 - Exit
  set /p "select=Selection (just the number): "
  goto:eof
