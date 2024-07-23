	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$16, %rsp
	movl	$0, -4(%rbp)
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
	cmpl	$1827, _i(%rip)         ## imm = 0x723
	jg	LBB0_11
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	movl	$0, _j(%rip)
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	xorl	%eax, %eax
	movb	%al, %cl
	movl	_j(%rip), %eax
	cmpl	_number_of_primes(%rip), %eax
	movb	%cl, -5(%rbp)           ## 1-byte Spill
	jge	LBB0_5
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	movslq	_j(%rip), %rax
	leaq	_primes(%rip), %rcx
	movl	(%rcx,%rax,4), %edx
	movslq	_j(%rip), %rax
	imull	(%rcx,%rax,4), %edx
	cmpl	_i(%rip), %edx
	setle	%sil
	movb	%sil, -5(%rbp)          ## 1-byte Spill
LBB0_5:                                 ##   in Loop: Header=BB0_3 Depth=2
	movb	-5(%rbp), %al           ## 1-byte Reload
	testb	$1, %al
	jne	LBB0_6
	jmp	LBB0_9
LBB0_6:                                 ##   in Loop: Header=BB0_3 Depth=2
	movl	_i(%rip), %eax
	movslq	_j(%rip), %rcx
	cltd
	leaq	_primes(%rip), %rsi
	idivl	(%rsi,%rcx,4)
	cmpl	$0, %edx
	jne	LBB0_8
## %bb.7:                               ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_10
LBB0_8:                                 ##   in Loop: Header=BB0_3 Depth=2
	movl	_j(%rip), %eax
	addl	$1, %eax
	movl	%eax, _j(%rip)
	jmp	LBB0_3
LBB0_9:                                 ##   in Loop: Header=BB0_1 Depth=1
	movl	_i(%rip), %eax
	movl	_j(%rip), %ecx
	movl	%ecx, %edx
	addl	$1, %edx
	movl	%edx, _j(%rip)
	movslq	%ecx, %rsi
	leaq	_primes(%rip), %rdi
	movl	%eax, (%rdi,%rsi,4)
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	movl	_i(%rip), %eax
	addl	$1, %eax
	movl	%eax, _i(%rip)
	jmp	LBB0_1
LBB0_11:
	movl	$0, _i(%rip)
LBB0_12:                                ## =>This Inner Loop Header: Depth=1
	movl	_i(%rip), %eax
	cmpl	_j(%rip), %eax
	jge	LBB0_14
## %bb.13:                              ##   in Loop: Header=BB0_12 Depth=1
	movslq	_j(%rip), %rax
	leaq	_primes(%rip), %rcx
	movl	(%rcx,%rax,4), %esi
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	%eax, -12(%rbp)         ## 4-byte Spill
	jmp	LBB0_12
LBB0_14:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_primes                 ## @primes
.zerofill __DATA,__common,_primes,4040,4
	.section	__TEXT,__const
	.globl	_maxx                   ## @maxx
	.p2align	2
_maxx:
	.long	1827                    ## 0x723

	.globl	_number_of_primes       ## @number_of_primes
.zerofill __DATA,__common,_number_of_primes,4,2
	.section	__DATA,__data
	.globl	_i                      ## @i
	.p2align	2
_i:
	.long	2                       ## 0x2

	.globl	_j                      ## @j
.zerofill __DATA,__common,_j,4,2
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d, "


.subsections_via_symbols
