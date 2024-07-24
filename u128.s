; 128-bit unsigned integer to string and output
; the number is in r9:r8

	global _main
	section .text
_u128_print:
	xor rcx, rcx			; counter: how many digits?
	mov r8, 0xA
	mov r9, 0x2
_u128_str_loop:
	mov rax, r8
	xor rdx, rdx
	mov rbx, 10
	div rbx					; divide the lower bits by 10, remainder = d in rdx, quotient = c in rax
	push qword rax			; save rax: lower bits quotient (c), stack depth = 1
	push qword rdx			; save rdx: lower bits remainder (d), stack depth = 2
	mov rax, r9
	xor rdx, rdx
	div rbx					; divide the higher bits by 10, remainder = b in rdx, quotient = a in rax
	mov r10, rax			; r10 = a
	pop rax					; pop d into rax: now rdx:rax = b*2^64+d, stack depth = 1
	div rbx					; b * 2^64 + d = 10 * e (in rax) + f (in rdx): f is the final remainder
	mov r8, rax				; put e into r8
	pop rbx					; put c into rbx, stack cleared
	xor r9, r9				; clear in advance cuz xor clears CF
	add r8, rbx				; now r8 = c + e, might carry, im not sure
	adc r9, r10				; r9 = a + CF, now r9:r8 is the final quotient, rdx is the final remainder
	add rdx, '0'
	push qword rdx			; push rdx into the stack for outputing
	inc rcx					; that's another digit!
	cmp r9, 0
	jnz _u128_str_loop
	cmp r8, 0
	jnz _u128_str_loop
	mov r8, rcx				; end of division, save rcx in r8 cuz we need to dec it later
	mov rdx, _u128_str_out	; load address of out into rdx
_u128_str_output:
	pop qword [rdx]
	dec rcx
	inc rdx
	cmp rcx, 0
	jnz _u128_str_output
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, _u128_str_out
	mov rdx, r8
	syscall
	ret

	section .bss
_u128_str_out: resb 42		; 39 digits max theoretically, we'll make it 42 bytes long
