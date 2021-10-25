@echo off
:a
  timeout /T 420
  powershell -ExecutionPolicy Bypass -File .\s.ps1
goto a
