@echo off
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM RIMBORSO KM - Setup Checker
REM Verifica che tutto sia pronto per avviare il server
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

setlocal enabledelayedexpansion
chcp 65001 > nul
color 0A

cd /d "%~dp0"

echo.
echo ============================================================
echo         🔍 RIMBORSO KM - Setup Checker
echo ============================================================
echo.

setlocal
set /a CHECKS=0
set /a PASSED=0
set /a FAILED=0

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 1: Python installato
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 🐍 Python
python --version > nul 2>&1
if errorlevel 1 (
    echo   ❌ FAIL - Python non trovato
    echo   Installa da https://www.python.org/
    set /a FAILED=FAILED+1
) else (
    for /f "tokens=*" %%i in ('python --version') do set PYTHON_VERSION=%%i
    echo   ✅ PASS - %PYTHON_VERSION%
    set /a PASSED=PASSED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 2: File run.py
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📝 run.py
if exist "run.py" (
    echo   ✅ PASS - run.py trovato
    set /a PASSED=PASSED+1
) else (
    echo   ❌ FAIL - run.py non trovato
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 3: File requirements.txt
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📦 requirements.txt
if exist "requirements.txt" (
    echo   ✅ PASS - requirements.txt trovato
    set /a PASSED=PASSED+1
) else (
    echo   ❌ FAIL - requirements.txt non trovato
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 4: Cartella app/
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📁 app/ (Flask app)
if exist "app\" (
    if exist "app\__init__.py" (
        echo   ✅ PASS - app/ trovata con __init__.py
        set /a PASSED=PASSED+1
    ) else (
        echo   ❌ FAIL - app/__init__.py mancante
        set /a FAILED=FAILED+1
    )
) else (
    echo   ❌ FAIL - Cartella app/ non trovata
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 5: Cartella templates/
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📁 app/templates/ (HTML pages)
if exist "app\templates\" (
    if exist "app\templates\index.html" (
        echo   ✅ PASS - templates/ con index.html
        set /a PASSED=PASSED+1
    ) else (
        echo   ❌ FAIL - index.html mancante
        set /a FAILED=FAILED+1
    )
) else (
    echo   ❌ FAIL - Cartella templates/ non trovata
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 6: Cartella static/
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📁 app/static/ (CSS/JS)
if exist "app\static\" (
    if exist "app\static\css\style.css" (
        echo   ✅ PASS - static/ con style.css
        set /a PASSED=PASSED+1
    ) else (
        echo   ❌ FAIL - style.css mancante
        set /a FAILED=FAILED+1
    )
) else (
    echo   ❌ FAIL - Cartella static/ non trovata
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 7: Cartella data/ (dove va il database)
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📁 data/ (Database storage)
if exist "data\" (
    echo   ✅ PASS - data/ trovata (si crerà il database)
    set /a PASSED=PASSED+1
) else (
    echo   ⚠️  WARN - data/ non trovata (la creerò automaticamente)
    mkdir data
    echo   ✅ PASS - Creata cartella data/
    set /a PASSED=PASSED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 8: models.py
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📄 app/models.py (Database models)
if exist "app\models.py" (
    echo   ✅ PASS - models.py trovato
    set /a PASSED=PASSED+1
) else (
    echo   ❌ FAIL - models.py non trovato
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 9: config.py
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] ⚙️ app/config.py (Configuration)
if exist "app\config.py" (
    echo   ✅ PASS - config.py trovato
    set /a PASSED=PASSED+1
) else (
    echo   ❌ FAIL - config.py non trovato
    set /a FAILED=FAILED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM CHECK 10: Schema
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set /a CHECKS=CHECKS+1
echo [%CHECKS%] 📋 schema.sql (Database schema)
if exist "schema.sql" (
    echo   ✅ PASS - schema.sql trovato
    set /a PASSED=PASSED+1
) else (
    echo   ⚠️  WARN - schema.sql non trovato (opzionale)
    set /a PASSED=PASSED+1
)
echo.

REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
REM Risultati
REM ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo.
echo ============================================================
echo         RISULTATI
echo ============================================================
echo.
echo Total Checks: %CHECKS%
echo ✅ Passed:    %PASSED%
echo ❌ Failed:    %FAILED%
echo.

if %FAILED% EQU 0 (
    echo 🎉 Setup COMPLETO! Tutto è pronto.
    echo.
    echo Puoi avviare il server con:
    echo   → START_SERVER.bat        (con controlli)
    echo   → START_SERVER_QUICK.bat  (veloce)
    echo.
    echo Oppure manualmente:
    echo   python -m venv venv
    echo   venv\Scripts\activate
    echo   pip install -r requirements.txt
    echo   python run.py
    echo.
) else (
    echo ❌ Alcuni controlli FALLITI!
    echo Risolvi i problemi e ripeti il controllo.
    echo.
)

echo ============================================================
pause
