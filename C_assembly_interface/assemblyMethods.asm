;System V AMD64 ABI calling convention used for c/c++ and assembly
;A combination of registers/stack to pass parameters to and/or from a function
;argument number	register
;1			rdi
;2			rsi
;3			rdx
;4			rcx
;5			r8
;6			r9


section .bss
userInput resb 64

section .text
global printS
global inputS
global writeS

printS:
	mov rax, rdi				;getting first argument into rax
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


inputS:
	mov rax,0			
	mov rdi,0				
	mov rsi,userInput
	mov rdx,64
	syscall
	
	mov rax, rsi
	ret

writeS:	
		
	mov r8, rsi
	mov r10,rdx
	mov rax, 2 			;system open 
	;mov rdi, filename		
	mov rsi, 64+1			;create and write only flags
	mov rdx, 0644o			; 0 + [r+w] + [r] + [r]  (#)o octal numbers
	syscall 
	
			 
	mov r9,rax			;file descriptor obtained from sysOpen is store in rax	
	mov rdi, rax
	mov rax, 1 			;system write
	mov rsi,r8			;text 
	mov rdx,r10			;length	
	syscall

	mov rax, 3 			;system close
	mov rax,r9
	syscall
	ret




