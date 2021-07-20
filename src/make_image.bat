rem echo OFF
mkdir build
echo Unmounting old image ...
osfmount.com -D -m X:

echo Assembling ...
tools\sjasmplus\sjasmplus.exe solitaire.asm --lst=solitaire.lst
if errorlevel 1 goto ERR

echo Preparing floppy disk image ...
copy /Y image\dss_image.img build\SOLITAIR.img
rem Delay before copy image
timeout 2 > nul
osfmount.com -a -t file -o rw -f build/SOLITAIR.img -m X:
if errorlevel 1 goto ERR
mkdir X:\SOLITAIR
mkdir X:\SOLITAIR\ASSETS
copy /Y SOLITAIR.EXE /B X:\SOLITAIR\ /B
copy /Y assets\*.b* /B X:\SOLITAIR\ASSETS\ /B

if errorlevel 1 goto ERR
rem Delay before unmounting image
timeout 2 > nul
echo Unmounting image ...
osfmount.com -d -m X:
goto SUCCESS
:ERR
rem pause
echo Some Building ERRORs!!!
pause 0
rem exit
goto END
:SUCCESS
echo Copying image to ZXMAK2 Emulator
copy /Y build\SOLITAIR.img /B %SPRINTER_EMULATOR% /B
echo Done!
:END
pause 0