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

_body:
	pusha
	
;	call	no_cursor
	mov 	ah, 01h				; set int to take a key input
	call 	cursor_position1
	int 	21h					; get ASCII key input, put it in AL
	mov		dl, al				; move read ASCII value to DL
	sub 	dl, 30h				; subtract 30 from char (convert digits to 0 - 9)
	cmp		dl, 09h				; is it less than 9? (between 0 and 9)
	jle		digit1				; if it is, jump to print first digit's 4 bit code
	sub		dl, 07h				; if greater, subtract 7 from ASCII value (puts it in letter range A - F)
digit1:
	mov		cl, 04h				; prepare CX with 4 loops
	shl 	dl, cl				; shift the ASCII value left 4 bits (multiply it by 16, bc it's the higher digit)
	call 	cursor_position2
	int 	21h					; read next ASCII char from keyboard
	sub		al, 30h				; convert to number again
	cmp		al, 9h				; is it 0 - 9 again?
	jle		digit2				; if yes, print digit2
	sub		al, 7h				; if not, convert to char
digit2:
	add		dl, al				; add first digit to oher, high digit
	int		20h					; exit
	
	popa
	ret
	
no_cursor:
	pusha
	
	mov 	ah, 01h				; set int to set cursor appearance
	mov 	ch, 10h				; 5th bit = invisible cursor
	int 	10h					; cursor = invisible
	
	popa
	ret
	
cursor_position1:
	pusha
	
	mov 	ah, 02h				; set int to set cursor position
	mov 	bh, 00h				; graphics mode? dunno
	mov 	dh, 0fh				; middle y?
	mov		dl, 0fh				; middle x?
	int 	10h					; set position
	
	popa
	ret
	
cursor_position2:
	pusha
	
	mov 	ah, 02h				; set int to set cursor position
	mov 	bh, 00h				; graphics mode? dunno
	mov 	dh, 10h				; middle y?
	mov		dl, 10h				; middle x?
	int 	10h					; set position
	
	popa
	ret

;display an asterix
;	mov		ah, 2h				; output string with int 21
;	mov		dl, 2ah				; 2Ah = *
;	int		21h					; print char at AH
;	int		20h					; end code

; code is put in the text segment. Do not modify the code before
; or after this comment.