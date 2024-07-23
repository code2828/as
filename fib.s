; fizzbuzz
	global _main
	section .text
_main:
	xor r8, r8
loop:
	inc r8	
	; 3|r8?
	xor rdx, rdx
	mov rax, r8 ; dividend
	mov rbx, 3 ; divisor
	div rbx
	cmp rdx, 0
	jnz dontfizz
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, fizz
	mov rdx, 4
	syscall
dontfizz:
	; 5|r8?
	xor rdx, rdx	
	mov rax, r8 ; dividend
	mov rbx, 5 ; divisor
	div rbx
	cmp rdx, 0
	jnz dontbuzz
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, buzz
	mov rdx, 4
	syscall
dontbuzz:
	; 7|r8?
	xor rdx, rdx	
	mov rax, r8 ; dividend
	mov rbx, 7 ; divisor
	div rbx
	cmp rdx, 0
	jnz dontgazz
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, gazz
	mov rdx, 4
	syscall
dontgazz:
	; 11|r8?
	xor rdx, rdx	
	mov rax, r8 ; dividend
	mov rbx, 11 ; divisor
	div rbx
	cmp rdx, 0
	jnz dontmezz
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, mezz
	mov rdx, 4
	syscall
dontmezz:
	mov rax, 0x02000004
	mov rdi, 1
	mov rsi, endl
	mov rdx, 2
	syscall
	cmp r8, 1000
	jne loop
	mov rax, 0x02000001
	xor rdi, rdi
	syscall
	
	section .data
fizz: db "Fizz"
buzz: db "Buzz"
gazz: db "Gazz"
mezz: db "Mezz"
endl: db '_', 10
