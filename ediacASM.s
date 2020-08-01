	.file	"main.c"
	.text
	.globl	bflag
	.bss
	.align 4
	.type	bflag, @object
	.size	bflag, 4
bflag:
	.zero	4
	.globl	hflag
	.align 4
	.type	hflag, @object
	.size	hflag, 4
hflag:
	.zero	4
	.globl	tflag
	.align 4
	.type	tflag, @object
	.size	tflag, 4
tflag:
	.zero	4
	.text
	.globl	filecheck
	.type	filecheck, @function
filecheck:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	movq	-24(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	access@PLT
	testl	%eax, %eax
	jne	.L2
	addl	$4, -4(%rbp)
.L2:
	movq	-24(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	access@PLT
	testl	%eax, %eax
	jne	.L3
	addl	$2, -4(%rbp)
.L3:
	movq	-24(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	access@PLT
	testl	%eax, %eax
	jne	.L4
	addl	$1, -4(%rbp)
.L4:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	filecheck, .-filecheck
	.section	.rodata
.LC0:
	.string	"%c"
.LC1:
	.string	"clear"
	.text
	.globl	tloop
	.type	tloop, @function
tloop:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	cmpl	$6, -28(%rbp)
	jbe	.L7
	movl	$0, -28(%rbp)
.L7:
	call	getchar@PLT
	movb	%al, -5(%rbp)
	cmpb	$104, -5(%rbp)
	jne	.L8
	movl	-28(%rbp), %edx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$48, (%rax)
.L8:
	cmpb	$106, -5(%rbp)
	jne	.L9
	movl	-28(%rbp), %edx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movb	$49, (%rax)
.L9:
	cmpb	$107, -5(%rbp)
	je	.L14
	addl	$1, -28(%rbp)
	cmpl	$7, -28(%rbp)
	jne	.L12
	movq	-40(%rbp), %rax
	movl	$2, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	strtol@PLT
	movl	%eax, -4(%rbp)
	cmpl	$127, -4(%rbp)
	ja	.L12
	movl	-4(%rbp), %edx
	movq	-24(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
.L12:
	movl	bflag(%rip), %eax
	testl	%eax, %eax
	je	.L13
	leaq	.LC1(%rip), %rdi
	call	system@PLT
.L13:
	movq	-40(%rbp), %rdx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	tloop
	jmp	.L6
.L14:
	nop
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	tloop, .-tloop
	.globl	wloop
	.type	wloop, @function
wloop:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	getchar@PLT
	movb	%al, -1(%rbp)
	cmpb	$104, -1(%rbp)
	jne	.L16
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$48, %edi
	call	fputc@PLT
.L16:
	cmpb	$106, -1(%rbp)
	jne	.L17
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$49, %edi
	call	fputc@PLT
.L17:
	cmpb	$107, -1(%rbp)
	je	.L21
	movl	bflag(%rip), %eax
	testl	%eax, %eax
	je	.L20
	leaq	.LC1(%rip), %rdi
	call	system@PLT
.L20:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	wloop
	jmp	.L15
.L21:
	nop
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	wloop, .-wloop
	.section	.rodata
	.align 8
.LC2:
	.ascii	"ediac stands for ed is a crutch,\n\rand looks towards the he"
	.ascii	"yday of \n\rENIAC and EDSAC, when men were \n\rmen and progr"
	.ascii	"ammers whispered \n\rswe"
	.string	"et nothings into the \n\rproverbial ears of machines \n\rbefore screwing the living \n\rdaylights out of them on the \n\rcold floor of the \n\rair-conditioned mainframe room. \n\rediac is obviously catered \n\rtowards the most elite \n\rprogrammers who write in binary.\n\n\r"
	.align 8
.LC3:
	.string	"'h' for 0, 'j' for 1, 'k' to \n\rexit. Backspaces not supported.\n\n\r"
	.align 8
.LC4:
	.string	"-b:\tbloat flag\n\n\rclears the screen after every \n\rkeypress. Although, this also \n\rrequires a system call, so tell \n\rme, which is more bloat?\n\n\r"
	.align 8
.LC5:
	.string	"-h:\thelp flag\n\n\rprints this help message and \n\rexits with contempt.\n\n\r"
	.align 8
.LC6:
	.string	"-t:\ttext flag\n\n\rallows less skilled people to \n\rtype text through binary ASCII\n\rinstead.\n\n\r"
	.align 8
.LC7:
	.string	"Exiting with error code 1 \n\rbecause your need for help is \n\rthe biggest error.\n\n\r"
	.text
	.globl	help
	.type	help, @function
help:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE9:
	.size	help, .-help
	.section	.rodata
.LC8:
	.string	"ediac <filename> <flags>\n\n\r"
	.align 8
.LC9:
	.string	"Type 'ediac dummy -h' if you \n\rreally need help.\n\n\r"
	.align 8
.LC10:
	.string	"Exiting with error code 1 \n\rbecause your lack of knowledge \n\rabout ediac is an error.\n\n\r"
	.text
	.globl	usage
	.type	usage, @function
usage:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE10:
	.size	usage, .-usage
	.section	.rodata
.LC11:
	.string	"-b"
.LC12:
	.string	"-h"
.LC13:
	.string	"-t"
.LC14:
	.string	"\rfile:\t%s\n\r"
.LC15:
	.string	"perm:\t%d\n\r"
.LC16:
	.string	"a"
.LC17:
	.string	"cannot open file\n"
.LC18:
	.string	"/bin/stty raw"
.LC19:
	.string	"/bin/stty cooked"
.LC20:
	.string	"\n\r"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$2, -44(%rbp)
	movl	$2, -44(%rbp)
	jmp	.L25
.L30:
	movl	-44(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L26
	movl	$1, bflag(%rip)
	jmp	.L27
.L26:
	movq	-8(%rbp), %rax
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L28
	movl	$1, hflag(%rip)
	jmp	.L27
.L28:
	movq	-8(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L29
	movl	$1, tflag(%rip)
	jmp	.L27
.L29:
	movl	$0, %eax
	call	usage
.L27:
	addl	$1, -44(%rbp)
.L25:
	movl	-52(%rbp), %eax
	cmpl	%eax, -44(%rbp)
	jb	.L30
	movl	hflag(%rip), %eax
	testl	%eax, %eax
	je	.L31
	movl	$0, %eax
	call	help
.L31:
	movq	-64(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	filecheck
	movl	%eax, -40(%rbp)
	movl	-40(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-32(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L32
	leaq	.LC17(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L32:
	leaq	.LC18(%rip), %rdi
	call	system@PLT
	movl	tflag(%rip), %eax
	testl	%eax, %eax
	je	.L33
	movl	$0, -36(%rbp)
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-36(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	tloop
	jmp	.L34
.L33:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	wloop
.L34:
	leaq	.LC19(%rip), %rdi
	call	system@PLT
	leaq	.LC20(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
