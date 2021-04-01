;nasm -f elf64 -o <name>.o <name>.asm
;ld <name>.o -o <name>

section .data
	text db "Hello, World!",10
section .text
	global _start
_start:
	mov rax,1		
	mov rdi,1
	mov rsi,text
	mov rdx,14
	syscall

	mov rax,60
	mov rdi,0
	syscall


;Argument	Register
;ID		rax
;1		rdi
;2		rsi
;3		rdx
;4		r10
;5		r8
;6		r9


;syscall	ID	ARG1		ARG2		ARG3	...
;read		0	#file desc	$buffer	#count
;write		1	#file desc	$buffer	#count
;open		2	#file desc	#flags		#mode
;close		3	#file desc
;exit		60	#error code
...

;Argument type		Argument description
;file descriptor	0(std input), 1(std output), 2(std error)


;Pointer name	Meaning		Description
;rip		index 		points to next address to be executed
;rsp		stack		points to the top address of the stack
;rbp		stack base	points to the botton of the stack

;File permission (octal values)
;1 = execute
;2 = write
;4 = read 
;else the sum of previous values


