@echo off

REM assembles first.asm, using the included files in the "includes" directory
nasm -i .\includes\ -f win32 first.asm -l first.lst