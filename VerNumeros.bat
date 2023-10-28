@echo off
set "NumeroMotherboard=Default string"
set "NumeroUUID=03C00218-044D-056F-4206-C90700080009"
title HWID
echo **********************************
color 0F
echo **********************************
:start
cls
wmic diskdrive get model, serialnumber
echo -----------------------------
echo CPU
wmic cpu get serialnumber
echo -----------------------------
echo BIOS
wmic bios get serialnumber
echo -----------------------------
echo Motherboard
for /f "tokens=2 delims==" %%I in ('wmic baseboard get serialnumber /value') do set "board_serial=%%I"

if "%board_serial%"=="%NumeroMotherboard%" (
    echo Numero anterior PELIGRO
    echo %NumeroMotherboard% ORIGINAL  PELIGRO
    echo %board_serial% FRESCO    PELIGRO
) else (
    echo Numeros nuevos SEGURO
    echo %NumeroMotherboard% ORIGINAL  SEGURO
    echo %board_serial% FRESCO    SEGURO
)
echo -----------------------------
echo smBIOS UUID
for /f "tokens=2 delims==" %%I in ('wmic path win32_computersystemproduct get uuid /value') do set "uuid=%%I"

if "%uuid%"=="%NumeroUUID%" (
    echo Numero anterior PELIGRO
    echo %NumeroUUID% ORIGINAL  PELIGRO
    echo %uuid% FRESCO    PELIGRO
) else (
    echo Numeros nuevos SEGURO
    echo %NumeroUUID% ORIGINAL  SEGURO
    echo %uuid% FRESCO    SEGURO
)
echo -----------------------------
getmac
echo Press any key to get your hardware serials again.
pause>nul
goto start