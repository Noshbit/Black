attrib +s +h "$env:USERPROFILE\temp";
While ($true) {iwr "https://eenvandaag.assets.avrotros.nl/_processed_/5/4/csm_ANP-48868814_094851fb41.jpg" -outfile "$env:USERPROFILE\temp\a.jpg"; sp 'HKCU:Control Panel\Desktop' Wallpaper "$env:USERPROFILE\temp\a.jpg"; 1..59 | % {RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters -windowstyle hidden; $i; $i++}; sleep 30}
