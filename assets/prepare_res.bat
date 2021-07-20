mkdir resources
cd resources
..\..\tools\res_man\resources\bin\Debug\netcoreapp3.1\resources.exe ..\res.txt
copy 8b.bin /B + 8c.bin /B ..\..\src\assets\cards0.bin /B
copy 9h.bin /B + ah.bin /B ..\..\src\assets\cards1.bin /B
copy res_pal.asm ..\..\src\res_pal.asm
cd ..
pause 0
