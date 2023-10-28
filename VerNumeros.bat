@echo off
rem Unknown
set "NumeroCPU=99999999999"
rem System Serial Number
set "NumeroBIOS=8888888888"
rem 200569744400562
set "NumeroMotherboard=Default string"
rem E3F9F6C8-1299-E04B-D990-D45D64B80BB8
set "NumeroUUID=03C00218-044D-056F-4206-C90700080009"
rem Mac
rem D4-5D-64-B8-0B-B8   \Device\Tcpip_{EDC80A0E-C33E-41CE-89CF-A7498F15C84A}
title VerNumeracos
echo **********************************
color 0F
echo **********************************
:start
cls
wmic diskdrive get model, serialnumber
echo -----------------------------
echo CPU
rem CPU
for /f "tokens=2 delims==" %%I in ('wmic cpu get serialnumber /value') do set "cpu_serial=%%I"

if "%cpu_serial%"=="%NumeroCPU%" (
    echo %NumeroCPU% ORIGINAL  PELIGRO
    echo %cpu_serial% FRESCO    PELIGRO
) else (
    echo %NumeroCPU% ORIGINAL  SEGURO
    echo %cpu_serial% FRESCO    SEGURO
)
echo -----------------------------
echo BIOS
rem BIOS
for /f "tokens=2 delims==" %%I in ('wmic bios get serialnumber /value') do set "bios_serial=%%I"

if "%bios_serial%"=="%NumeroBIOS%" (
    echo %NumeroBIOS% ORIGINAL  PELIGRO
    echo %bios_serial% FRESCO    PELIGRO
) else (
    echo %NumeroBIOS% ORIGINAL  SEGURO
    echo %bios_serial% FRESCO    SEGURO
)
echo -----------------------------
echo Motherboard
rem Motherboard
for /f "tokens=2 delims==" %%I in ('wmic baseboard get serialnumber /value') do set "board_serial=%%I"

if "%board_serial%"=="%NumeroMotherboard%" (
    echo %NumeroMotherboard% ORIGINAL  PELIGRO
    echo %board_serial% FRESCO    PELIGRO
) else (
    echo %NumeroMotherboard% ORIGINAL  SEGURO
    echo %board_serial% FRESCO    SEGURO
)
echo -----------------------------
echo smBIOS UUID
rem smBIOS UUID
for /f "tokens=2 delims==" %%I in ('wmic path win32_computersystemproduct get uuid /value') do set "uuid=%%I"

if "%uuid%"=="%NumeroUUID%" (
    echo Numero anterior PELIGRO
    echo %NumeroUUID% ORIGINAL  PELIGRO
    echo %uuid% FRESCO    PELIGRO
) else (
    echo %NumeroUUID% ORIGINAL  SEGURO
    echo %uuid% FRESCO    SEGURO
)
echo -----------------------------
getmac
echo Press any key to get your hardware serials again.
pause>nul
goto start
