




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
