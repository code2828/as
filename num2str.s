; integer to string and output
; this function alters the following regs: rax, rbx, rdx, rdi, rsi, r8, r9.

	global _num2str
	section .text
_num2str:
	push rax
	push rbx
	push rdx
	push rdi
	push rsi
	push r8
	push r9
	xor r9, r9 ; how many digits?
	mov r8, rdi ; the number from argument
	mov rax, r8
_n2s_loop:
	xor rdx, rdx
	mov rbx, 10
	div rbx
	add dl, '0'
	push rdx
	inc r9
	cmp rax, 0
	jnz _n2s_loop
	
	mov rdx, _n2s_out
_n2s_output:
	pop qword [rdx]
	dec r9
	inc rdx
	cmp r9, 0
	jnz _n2s_output
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, _n2s_out
	mov rdx, 20
	syscall
	pop r9
	pop r8
	pop rsi
	pop rdi
	pop rdx
	pop rbx
	pop rax
	ret	

	section .bss
_n2s_out: resb 20 ; 18 digits max theoretically, we'll make it 20 bytes long
