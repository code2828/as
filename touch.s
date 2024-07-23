; echo stdin to stdout
	global _main
	section .text
_main:
	mov rax, 0x02000055	; system call create file
	mov rdi, filename		; argv[1]
	mov rsi, 0777o
	syscall
	
	mov rax, 0x02000001	; system call for exiting
	xor rdi, rdi		; return 0
	syscall
	
	section .data
filename: db "file.name", 0h
