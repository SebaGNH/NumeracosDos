@echo off
start "" "C:\ruta\a\tu\programa.exe"  REM Iniciar el archivo .exe
timeout /t 5  REM Esperar 5 segundos
start "" "C:\ruta\a\tu\archivo.bat"  REM Ejecutar otro archivo .bat
timeout /t 5  REM Esperar 5 segundos
start "" "com.epicgames.launcher://apps/fn%3A4fe75bbc5a674f4f9b356b5c90567da5%3AFortnite?action=launch&silent=true"  REM Abrir la URL en el navegador
timeout /t 5  REM Esperar 5 segundos
exit  REM Cerrar este programa .bat
