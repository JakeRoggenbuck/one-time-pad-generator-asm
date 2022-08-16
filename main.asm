SECTION .data
msg     db      'Longer message with unknown length', 0Ah
 
SECTION .text
global  _start
 
_start:
	mov ebx, 	msg				; set ebx to addr of msg
	mov eax, 	ebx				; set eax to the same

nextchar:
	cmp 		byte [eax], 0	; compare the byte pointed to by eax to zero (end of line)
	jz			finished		; jump if zero to finished section
	inc 		eax				; increment eax if no zero flag
	jmp 		nextchar		; jump to nextchar section

 finished:
 	sub			eax, ebx		; eax - ebx
	mov 		edx, eax		; eax is the number of bytes in msg
	mov			ecx, msg		; move msg to ecx
	mov			ebx, 1
	mov			eax, 4
	int			80h

	mov			ebx, 0
	mov			eax, 1
	int			80h
