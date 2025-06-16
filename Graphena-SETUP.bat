::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCCaLmCGIroL5uT07u6Unk8SW/ZybZvS1qfAOukDig==
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFD9MXg++GG6pDaET+NTc/euXqkgTVaw2e4C7
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFD9MXg++GGS5E7gZ5vzo086CtEgRW/IyfYHP5pOcIfAb70vlWqUR5X9OjdswKwlZbhquYA4LmmtWo3TLMt+Z0w==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    exit /b
)

echo ==== Remove Microsoft-Store apps (1/8) ====
PowerShell -Command "Get-AppxPackage * | Where-Object {$_.Name -notlike '*Microsoft.WindowsStore*' -and $_.Name -notlike '*DesktopAppInstaller*'} | Remove-AppxPackage -AllUsers"

echo ==== set taskbar to left (2/8) ====
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAl /t REG_DWORD /d 0 /f

echo ==== removes microsoft edge (3/8) ====
cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application
for /d %%i in (*) do (
    if exist "%%i\Installer\setup.exe" (
        "%%i\Installer\setup.exe" --uninstall --system-level --verbose-logging --force-uninstall
    )
)

echo ==== Downloading chromium (4/8) ====
set ChromiumURL=https://download-chromium.appspot.com/dl/Win?type=snapshots
echo Lade Chromium herunter...
powershell -Command "Invoke-WebRequest -Uri %ChromiumURL% -OutFile %TEMP%\chromium.zip"
powershell -Command "Expand-Archive -Path %TEMP%\chromium.zip -DestinationPath C:\Chromium"
echo Chromium entpackt. Starte es mit: C:\Chromium\chrome.exe

echo ==== set black wallpaper (5/8) ====
reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo ==== set registries (6/8) ====
set "regfile=%TEMP%\custom_ui.reg"
> "%regfile%" echo Windows Registry Editor Version 5.00
>> "%regfile%" echo.
>> "%regfile%" echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
>> "%regfile%" echo "BorderWidth"="-15"
>> "%regfile%" echo "CaptionFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "CaptionHeight"="-330"
>> "%regfile%" echo "CaptionWidth"="-330"
>> "%regfile%" echo "IconFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "IconTitleWrap"="1"
>> "%regfile%" echo "MenuFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "MenuHeight"="-285"
>> "%regfile%" echo "MenuWidth"="-285"
>> "%regfile%" echo "MessageFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "ScrollHeight"="-255"
>> "%regfile%" echo "ScrollWidth"="-255"
>> "%regfile%" echo "Shell Icon Size"="32"
>> "%regfile%" echo "SmCaptionFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "SmCaptionHeight"="-330"
>> "%regfile%" echo "SmCaptionWidth"="-330"
>> "%regfile%" echo "StatusFont"=hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00
>> "%regfile%" echo "PaddedBorderWidth"="-60"
>> "%regfile%" echo "AppliedDPI"=dword:00000060
>> "%regfile%" echo "IconSpacing"="-1125"
>> "%regfile%" echo "IconVerticalSpacing"="-1125"
>> "%regfile%" echo "MinAnimate"="1"

regedit /s "%regfile%"
del "%regfile%"

echo ==== set registries (7/8) ====

slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato

echo ==== install boot-utils (8/8) ====

boot-utils.zip

echo ==== rebooting required ====
pause
