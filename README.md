```bash```



```bash
if %reiniciar%==1 (
    echo -----------------------------
    echo Reiniciando la PC en 120 segundos...
    for /l %%i in (120,-1,1) do (
        echo Tiempo restante: %%i segundos
        timeout /t 1 > nul
    )
    echo -----------------------------
    echo Pulse cualquier tecla para cancelar el reinicio.
    choice /c ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 /n /t 120 /d A
    if errorlevel 1 (
        echo REINICIO CANCELADO
        goto start
    )
) else (
    echo -----------------------------
    echo Presione cualquier tecla para refrescar.
    pause > nul
    goto start
)
```
```bash
if %reiniciarMother%==1 (
    set "reiniciar=1"
) else if %reiniciarUUID%==1 (
    set "reiniciar=1"
)

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
```

```bash
@echo off
rem Tu script aquí
timeout /t 10  REM Espera 10 segundos
exit  REM Cierra el script
```



```bash
@echo off
start "" "C:\ruta\a\tu\programa.exe"  REM Iniciar el archivo .exe
timeout /t 5  REM Esperar 5 segundos
start "" "C:\ruta\a\tu\archivo.bat"  REM Ejecutar otro archivo .bat
timeout /t 5  REM Esperar 5 segundos
exit  REM Cerrar este programa .bat
```

C:\Users\3400G\AppData\Local\Vivaldi\Application\vivaldi.exe --incognito
```bash
@echo off
start "" "C:\Users\3400G\AppData\Local\Vivaldi\Application\vivaldi.exe --incognito"  REM Iniciar el archivo .exe
timeout /t 1  REM Esperar 1 segundos
exit  REM Cerrar este programa .bat
```
```bash
@echo off
start "" "C:\Users\3400G\AppData\Local\Vivaldi\Application\vivaldi.exe" --incognito
exit
```

"G:\Documentos\CTR 2.1 RC5\CTR 2.1.exe"
```bash
@echo off
timeout /t 5  REM Esperar 5 segundos
start "" "G:\Documentos\CTR 2.1 RC5\CTR 2.1.exe"
exit
```



