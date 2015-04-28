; file: caverns.asm
; A game made using Peter Norton's Assembly Language book
;
; Compile with NASM:
; nasm -o caverns.com caverns.asm

segment .data
;
; initialized data is put in the data segment here
;

segment .bss
;
; uninitialized data is put in the bss segment
;

segment .text

	mov		ah, 2h				; output string with int 21
	mov		dl, 2ah				; 2Ah = *
	int		21h					; print char at AH
	int		20h					; end code

; code is put in the text segment. Do not modify the code before
; or after this comment.



