@echo off

REM assembles first.asm, using the included files in the "includes" directory
REM nasm -i .\includes\ -f win32 first.asm -l first.lst
REM nasm -f obj caverns.asm MIGHT NEED THIS FOR LINKING DIFFERENT OBJ FILES IN PETEY N'S BOOK
nasm -o caverns.com caverns.asm