cd "C:\Delphi\CVS projects\dale\DKLang" 
del /s /q *.~* *.dcu *.ddp *.log *.bak *.tmp *.identcache *.bdsproj.local Entries.Old Entries.Extra.Old 1>nul 2>nul
rmdir /s /q Packages\__history 1>nul 2>nul
rmdir /s /q Packages\ModelSupport 1>nul 2>nul