@echo off
:a
  timeout /T 400
  powershell -ExecutionPolicy Bypass -File .\s.ps1
goto a
