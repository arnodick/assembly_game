

;
; file: first.asm
; First assembly program. This program asks for two integers as
; input and prints out their sum.
;
; To create executable:
; Using djgpp:
; nasm -f coff first.asm
; gcc -o first first.o driver.c asm_io.o
;
; Using Linux and gcc:
; nasm -f elf first.asm
; gcc -o first first.o driver.c asm_io.o
;
; Using Borland C/C++
; nasm -f obj first.asm
; bcc32 first.obj driver.c asm_io.obj
;
; Using MS C/C++
; nasm -f win32 first.asm
; cl first.obj driver.c asm_io.obj
;
; Using Open Watcom
; nasm -f obj first.asm
; wcl386 first.obj driver.c asm_io.obj

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
;
; These labels refer to strings used for output
;
prompt1 db    "What vicious maneouver shal;l u choose?", 0Ah, 0       ; don't forget nul terminator
move1 db    09h, "1) Punch", 0Ah, 0
move2 db    09h, "2) Kick", 0Ah, 0
move3 db    09h, "3) Parry", 0Ah, 0
move4 db    09h, "4) Dodge", 0Ah, 0
outcome1 db    "You blow your opponent with a Mighty PUNCH!", 0
outcome2 db    " Your opponent's defense are no match for your swift feet KICKs", 0
outcome3 db    ",Your quick and nimble hands PARRY the technique!", 0
outcome4 db    "Your DODGE is effervescent!", 0



;
; uninitialized data is put in the .bss segment
;
segment .bss
;
; These labels refer to double words used to store the inputs
;
input1  resd 1
input2  resd 1
 

;
; code is put in the .text segment
;
segment .text
        global  _asm_main
_asm_main:
        enter   0,0               ; setup routine
        pusha

        mov     eax, prompt1      ; print out prompt
        call    print_string
		
		mov     eax, move1      ; print out prompt
        call    print_string
		
		mov     eax, move2      ; print out prompt
        call    print_string
		
		mov     eax, move3      ; print out prompt
        call    print_string
		
		mov     eax, move4      ; print out prompt
        call    print_string

        call    read_int          ; read integer
        mov     [input1], eax     ; store into input1
		
		mov		eax, outcome1
		call	print_string

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


