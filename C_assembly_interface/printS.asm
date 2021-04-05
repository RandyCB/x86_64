;System V AMD64 ABI calling convention used for c/c++ and assembly
;A combination of registers/stack to pass parameters to and/or from a function
;argument number	register
;1			rdi
;2			rsi
;3			rdx
;4			rcx
;5			r8
;6			r9


section .text
global printS

printS:
	mov rax, rdi
	mov rbx,0
		
	printLoop:
		mov cl, [rax]			;move the first byte of the string into cl
		cmp cl,0			;check if it is a end of line character
		je endLoop
		add rax,1			;rax store in rax increase by 1, points to next symbol(byte)
		add rbx,1			;increase counter
		jne printLoop			
	
	endLoop:
		mov rax,1		
		mov rsi,rdi			;text
		mov rdi,1			;STDOUT 
		mov rdx,rbx			;counter
		syscall

	ret



