@echo off

adb kill-server
adb start-server 

set /p "folder=Enter path to save: "

if exist %folder%\ (
  adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/SOA/ %folder%
adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Story/ %folder%
adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Survival/ %folder%
adb pull /sdcard/Android/data/com.Incuvo.GreenHellVR/files/Settings/ %folder%

  echo ----------------------------
  echo File saved at %folder%
) else (
  echo Failed, Folder does not exist
)

pause