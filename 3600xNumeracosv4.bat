@echo off
rem Unknown
set "NumeroCPU=Unknown"
rem System Serial Number
set "NumeroBIOS=System Serial Number"
rem 200569744400562
set "NumeroMotherboard=200569744400562"
rem E3F9F6C8-1299-E04B-D990-D45D64B80BB8
set "NumeroUUID=E3F9F6C8-1299-E04B-D990-D45D64B80BB8"
rem Mac
rem D4-5D-64-B8-0B-B8   \Device\Tcpip_{EDC80A0E-C33E-41CE-89CF-A7498F15C84A)
set "reiniciar=0"
title VerNumeracos
echo **********************************
color 0F
echo **********************************
:start
cls
echo -----------------------------
rem CPU---------------------------
for /f "tokens=2 delims==" %%I in ('wmic cpu get serialnumber /value') do set "cpu_serial=%%I"

if "%cpu_serial%"=="%NumeroCPU%" (
    echo CPU  PELIGRO
    echo %NumeroCPU% ORIGINAL  PELIGRO
    echo %cpu_serial% FRESCO    PELIGRO
) else (
    echo CPU  SEGURO
    echo %NumeroCPU% ORIGINAL  SEGURO
    echo %cpu_serial% FRESCO    SEGURO
)
echo -----------------------------
rem BIOS--------------------------
for /f "tokens=2 delims==" %%I in ('wmic bios get serialnumber /value') do set "bios_serial=%%I"

if "%bios_serial%"=="%NumeroBIOS%" (
    echo BIOS  PELIGRO
    echo %NumeroBIOS% ORIGINAL  PELIGRO
    echo %bios_serial% FRESCO    PELIGRO
) else (
    echo BIOS  SEGURO
    echo %NumeroBIOS% ORIGINAL  SEGURO
    echo %bios_serial% FRESCO    SEGURO
)
echo -----------------------------
rem Motherboard------------------
for /f "tokens=2 delims==" %%I in ('wmic baseboard get serialnumber /value') do set "board_serial=%%I"

if "%board_serial%"=="%NumeroMotherboard%" (
    set "reiniciar=1"
    echo Motherboard  PELIGRO
    echo %NumeroMotherboard% ORIGINAL  PELIGRO
    echo %board_serial% FRESCO    PELIGRO
) else (
    echo Motherboard  SEGURO
    echo %NumeroMotherboard% ORIGINAL  SEGURO
    echo %board_serial% FRESCO    SEGURO
)
echo -----------------------------
rem smBIOS UUID-------------------
for /f "tokens=2 delims==" %%I in ('wmic path win32_computersystemproduct get uuid /value') do set "uuid=%%I"

if "%uuid%"=="%NumeroUUID%" (
    set "reiniciar=1"
    echo UUID  PELIGRO
    echo %NumeroUUID% ORIGINAL  PELIGRO
    echo %uuid% FRESCO    PELIGRO
) else (
    echo UUID  SEGURO
    echo %NumeroUUID% ORIGINAL  SEGURO
    echo %uuid% FRESCO    SEGURO
)
echo -----------------------------
echo Discos
wmic diskdrive get model, serialnumber
echo -----------------------------
getmac

if %reiniciar%==1 (
    echo -----------------------------
    echo Reiniciando la PC en 60 segundos...
    for /l %%i in (60,-1,1) do (
        echo Tiempo restante: %%i segundos
        timeout /t 1 > nul
    )
    echo -----------------------------
    shutdown /r /t 0
) else (
    echo -----------------------------
    echo Presione cualquier tecla para refrescar.
    pause > nul
    goto start
)
