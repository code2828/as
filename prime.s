; calculate primes less than a hardcoded number (MUST <256!!!)
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
		
	mov r11, [rbx]
	and r11, 0xFF
	mov rax, r11
	mul r11					; squares the prime: if square > r8 then break
	cmp rax, r8
	jg isaprime


	;xor rdi, rdi
	;mov rdi, r8
	;call _num2str
		
	;xor rdi, rdi
	;mov rdi, r10
	;call _num2str
	
	;xor rdi, rdi
	;mov rdi, [rbx]
	;and rdi, 0xFF
	;call _num2str

	mov rax, r8				; dividend	
	xor rdx, rdx			; clear rdx to avoid problems
	mov r11, [rbx]
	and r11, 0xFF
	div r11

	;xor rdi, rdi
	;mov rdi, rdx
	;call _num2str
	;xor rdi, rdi			; repeat to avoid problems from _num2str
	;mov rdi, rdx
	;call _num2str
	
	cmp rdx, 0				; remainder = 0? if yes, then not a prime
	jz notaprime
	inc r10					; inc counter; next loop
	jmp checkprime
isaprime:
	lea rbx, [rel primes]
    add rbx, r9				; put it into the r9'th position in the array
	mov [rbx], r8
	;mov rdi, r8
	;call _num2str
	inc r9					; found another prime!
	;mov rax, 0x02000004		; output sys call
	;mov rdi, 1				; stdout
	;mov rsi, endl			; print a newline
	;mov rdx, 12				; bytes
	;syscall
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
	mov rsi, primesintotal	; print " primes in total:\n"
	mov rdx, pitlen			; bytes
	syscall

	lea rbx, [rel primes]
what: ; goes through the primes array, for dbg
	mov rdi, [rbx]
	and rdi, 0xFF
	call _num2str
	mov rax, 0x02000004		; output sys call
	mov rdi, 1				; stdout
	mov rsi, endl			; print a newline
	mov rdx, endllen		; bytes
	syscall
	inc rbx
	dec r9
	jnz what


	
	mov rax, 0x02000001		; return 0
	xor rdi, rdi    
	syscall

	section .data
thereare: db "There are "
therearelen: equ $-thereare
primesintotal: db " primes in total:", 10
pitlen: equ $-primesintotal
endl: db " is a prime.", 10
endllen: equ $-endl
	
	section .bss
max: equ 100
primes: resb 6464 ; stores the primes already found
