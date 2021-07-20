@echo off

if EXIST solitair.exe (
	del solitair.exe
)
tools\sjasmplus\sjasmplus.exe solitaire.asm --lst=solitaire.lst
if errorlevel 1 goto ERR
echo Ok!
goto END

:ERR
del solitair.exe
pause
echo Something was happened...
pause
goto END

:END
