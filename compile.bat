@echo off

REM links first.obj with driver.o and asm_io.obj, then compiles into an exe
REM gcc -o first first.obj .\includes\driver.o .\includes\asm_io.obj
gcc -o caverns caverns.obj