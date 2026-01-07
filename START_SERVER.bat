@echo off
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM RIMBORSO KM - Server Launcher
REM Avvia il server Flask con controlli automatici + Browser
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

setlocal enabledelayedexpansion
chcp 65001 > nul
color 0A

REM Setup directories
cd /d "%~dp0"
set VENV_DIR=venv
set REQUIREMENTS_FILE=requirements.txt

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CONFIGURAZIONE - Modifica questi valori se necessario
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

REM Indirizzo e porta predefiniti
set HOST=127.0.0.1
set PORT=5000

REM Leggi da variabili di ambiente se impostate
if defined RIMBORSO_HOST set HOST=%RIMBORSO_HOST%
if defined RIMBORSO_PORT set PORT=%RIMBORSO_PORT%

REM Controlla parametri da linea di comando
REM Uso: START_SERVER.bat [host] [porta]
if not "%1"=="" set HOST=%1
if not "%2"=="" set PORT=%2

set URL=http://%HOST%:%PORT%

echo.
echo ============================================================
echo         🚗 RIMBORSO KM - Server Launcher
echo ============================================================
echo.
echo Server Address: %URL%
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM 1. Controlla se Python è installato
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo [1/4] 🔍 Verifica Python...
python --version > nul 2>&1
if errorlevel 1 (
    echo ❌ Python non trovato!
    echo Per favore installa Python da https://www.python.org/
    echo Ricordati di spuntare "Add Python to PATH" durante l'installazione
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
echo ✅ Trovato: %PYTHON_VERSION%
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM 2. Crea o attiva Virtual Environment
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo [2/4] 📦 Verifica Virtual Environment...
if not exist "%VENV_DIR%\" (
    echo   ⚙️  Creo virtual environment...
    python -m venv %VENV_DIR%
    if errorlevel 1 (
        echo ❌ Errore creazione venv!
        pause
        exit /b 1
    )
    echo ✅ Virtual environment creato
) else (
    echo ✅ Virtual environment trovato
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM 3. Installa/Aggiorna dipendenze
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo [3/4] 📚 Verifica dipendenze...
if exist "%REQUIREMENTS_FILE%" (
    echo   ⚙️  Installo/Aggiorno pacchetti...
    call %VENV_DIR%\Scripts\pip.exe install -q -r %REQUIREMENTS_FILE%
    if errorlevel 1 (
        echo ⚠️  Avvertimento durante installazione dipendenze
        echo Continuo comunque...
    ) else (
        echo ✅ Dipendenze aggiornate
    )
) else (
    echo ⚠️  File requirements.txt non trovato
    echo Installo pacchetti principali...
    call %VENV_DIR%\Scripts\pip.exe install -q flask flask-sqlalchemy requests openpyxl
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM 4. Avvia il server
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo [4/4] 🚀 Avvio server su %URL%...
echo.
echo ============================================================
echo         Server avviato!
echo         URL: %URL%
echo         Premi CTRL+C per fermare il server
echo ============================================================
echo.

REM Apri browser in background dopo 2 secondi (tempo di avvio)
start /B "" cmd /c "timeout /t 2 /nobreak > nul && start %URL%"

REM Imposta variabili di ambiente e avvia il server
set FLASK_HOST=%HOST%
set FLASK_PORT=%PORT%

call %VENV_DIR%\Scripts\python.exe run.py

REM Se il server si ferma, mostra messaggio
echo.
echo Server fermato. Premi un tasto per chiudere la finestra...
pause > nul
