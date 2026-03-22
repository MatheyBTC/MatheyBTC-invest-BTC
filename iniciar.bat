@echo off
echo Iniciando MatheyBTC Dashboard...
cd /d "%~dp0"
python -m http.server 8080
