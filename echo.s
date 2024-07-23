; echo stdin to stdout
	global _main
	section .text
_main:
	mov rax, 0x02000003	; system call read mode
	mov rdi, 0			; 0 is stdin
	lea rsi, [rsp+8]	; where's the buffer?
	mov rdx, 10			; number of bytes
	syscall
	
	mov rax, 0x02000004	; system call for write mode
	mov rdi, 1			; 1 is stdout
	lea rsi, [rsp+8]	; where's the stuff to output?
	mov rdx, 10			; number of bytes
	syscall	

	mov rax, 0x02000001	; system call for exiting
	xor rdi, rdi		; return 0
	syscall
