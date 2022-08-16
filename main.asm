extern printf
extern rand
extern _exit
extern srand

section .data
	form:  db '%d', 10

section .text
	global	_start

_start:
	call	srand		; seed the random number
	call 	rand		; generate a random number save to eax
	mov		ebx, 9		; move max random num to ebx

	mov 	edx, 0		
	div		ebx			; divide by ebx (9)
	mov 	eax, edx	; move the remainder of div to eax
	add		eax, 1		; add one to eax

	mov 	esi, eax	; move number in place for printf
	mov 	edi, form	; move form in place as well

	call 	printf

	mov 	rax, 0
	jmp 	_exit

