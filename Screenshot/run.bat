@echo off
:a
  timeout /T 1200
  powershell -ExecutionPolicy Bypass -File .\s.ps1
goto a
