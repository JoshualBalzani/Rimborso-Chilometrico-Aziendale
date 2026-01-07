@echo off
REM Avvia il server - versione rapida (senza controlli)
cd /d "%~dp0"
call venv\Scripts\python.exe run.py
pause
