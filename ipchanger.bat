@ECHO OFF
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
CLS
:MENU
ECHO.
ECHO ...............................................
ECHO ALAT PENGUBAH IP~
ECHO ...............................................
ECHO.
ECHO 1 - Ubah IP Menjadi Static
ECHO 2 - Ubah IP Menjadi Dynamic
ECHO 3 - Matikan Wi-Fi
ECHO 4 - Nyalakan Wi-Fi
ECHO 5 - EXIT
ECHO.
SET /P M=Ketik 1, 2 atau 3 lalu Tekan ENTER: 
IF %M%==1 GOTO STATIC
IF %M%==2 GOTO DYNAMIC
IF %M%==3 GOTO WIFIOFF
IF %M%==4 GOTO WIFION
IF %M%==5 GOTO EOF
:DYNAMIC
ECHO.
netsh interface ip set address name="Ethernet" source=DHCP
ECHO IP Berhasi diubah menjadi Dynamic
ECHO ===============================================
ECHO.
GOTO MENU
:STATIC
ECHO.
SET /P M=Set IP: 
netsh interface ip set address name="Ethernet" source=static ^ address=%M% mask=255.255.255.0
ECHO IP Berhasi diubah menjadi %M%
ECHO ===============================================
ECHO.
GOTO MENU
:WIFIOFF
ECHO.
netsh interface set interface "Wi-Fi" DISABLED
ECHO IP Berhasi diubah menjadi Dynamic
ECHO ===============================================
ECHO.
GOTO MENU
:WIFION
ECHO.
netsh interface set interface "Wi-Fi" ENABLED
ECHO IP Berhasi diubah menjadi Dynamic
ECHO ===============================================
ECHO.
GOTO MENU
