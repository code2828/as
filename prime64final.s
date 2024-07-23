; calculate primes less than a hardcoded number
    global _main
    section .text
_main:
	mov r8, 2				; r8 = counter, starts from 2
	xor r9, r9				; how many primes have we met?
loop:
	xor r10, r10	
checkprime:
	cmp r10, r9				; no more primes?
	jge isaprime
	lea rbx, [rel primes]
	add rbx, r10			; divisor: the r10'th prime in primes array
    add rbx, r10			; but it's a qword so we need to multiply it by 8
    add rbx, r10
    add rbx, r10
    add rbx, r10
    add rbx, r10
    add rbx, r10
    add rbx, r10
	mov r11, [rbx]
	mov rax, r11
	mul r11					; squares the prime: if square > r8 then break
	cmp rax, r8
	jg isaprime
	mov rax, r8				; dividend	
	xor rdx, rdx			; clear rdx to avoid problems
	mov r11, [rbx]			; divisor
	div r11
	cmp rdx, 0				; remainder = 0? if yes, then not a prime
	jz notaprime
	inc r10					; inc counter; next loop
	jmp checkprime
isaprime:
	lea rbx, [rel primes]
    add rbx, r9				; put it into the r9'th position in the array
	add rbx, r9				; qword so 8x
    add rbx, r9
    add rbx, r9
    add rbx, r9
    add rbx, r9
    add rbx, r9
    add rbx, r9
	mov [rbx], r8
	inc r9					; found another prime!
notaprime:
	inc r8
	cmp r8, max
	jne loop
	mov rax, 0x02000004		; output sys call
	mov rdi, 1				; stdout
	mov rsi, thereare		; print "There are "
	mov rdx, therearelen	; bytes
	syscall
	mov rdi, r9
	call _num2str
	mov rax, 0x02000004		; output sys call
	mov rdi, 1				; stdout
	mov rsi, 32				; print a space
	mov rdx, 1				; bytes
	syscall
	lea rbx, [rel primes]
what:
	mov rdi, [rbx]
	call _num2str
	mov rax, 0x02000004		; output sys call
	mov rdi, 1				; stdout
	mov rsi, endl			; print a newline
	mov rdx, endllen		; bytes
	syscall
	add rbx, 8				; qword, so +=8
	dec r9
	jnz what

	
	mov rax, 0x02000001		; return 0
	xor rdi, rdi    
	syscall

	section .data
thereare: db "There are "
therearelen: equ $-thereare
endl: db 32
endllen: equ $-endl
	
	section .bss
max: equ 182712
primes: resb 564646464; stores the primes already found
