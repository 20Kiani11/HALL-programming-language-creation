@echo off
set str=ASM()
set ASMpassthrough=false

:: Get content
set input=%str%
for /f "tokens=1,2 delims=(" %%A in ("%input%") do (
    set firstcontent=%%A
    set secondcontent=%%B
)
:: Remove the closing parenthesis from secondcontent
set secondcontent=%secondcontent:)=%
echo %firstcontent%
echo %secoundcontent%
if %firstcontent% equ ASM goto ASM
goto end

:ASM
if %ASMpassthrough% equ false set ASMpassthrough=true && goto ASMSKIP
if %ASMpassthrough% equ true set ASMpassthrough=false && goto ASMSKIP
:ASMSKIP
goto end

:end 
echo END
echo Compilation stats:
echo ASM value: %ASMpassthrough% (should not be true)
echo First: %firstcontent%
echo Secound: %secoundcontent%
