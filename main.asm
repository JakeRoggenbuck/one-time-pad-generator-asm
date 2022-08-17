extern printf
extern rand
extern _exit
extern srand

section .data
	form:  db '%d'

section .text
	global	_start

_start:
	mov		rcx, 6
	call	srand			; seed the random number

before:
	cmp 	rcx, 0
	jnz		notzero
	; zero
	cmp		rcx, 0
	je 		exit_prog

notzero:
	sub		rcx, 1
	call 	rand			; generate a random number save to eax
	mov		ebx, 9			; move max random num to ebx

	mov 	edx, 0		
	div		ebx				; divide by ebx (9)
	mov 	eax, edx		; move the remainder of div to eax
	add		eax, 1			; add one to eax

	mov		esi, eax
	mov 	edi, form
	call 	printf
	jmp 	before

exit_prog:
	mov 	rax, 0
	jmp 	_exit
