.model small
.stack 100H
.386
.data
data1 dd 00H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"
.code		
.startup
	;initialising EBX with 0
	MOV EBX, 00000000
	;printing first string
	MOV AH,09
	MOV DX,OFFSET msg
	INT 21H
	;initialising counter
	MOV ECX, 8
	;running loop take input of the first  number
	AGAIN: MOV AH, 01
	INT 21H
	CMP AL, 'A'
	JGE P1
	SUB AL,30H
	JMP P4
	P1: SUB AL, 37H
	P4: SHL EBX, 4
	MOV AH,00
	ADD EBX, EAX
	LOOP AGAIN
	;moving first input to data1
	MOV data1, EBX
	;printing second string
	MOV AH,09
	MOV DX,OFFSET msg1
	INT 21H
	;setting counter again
	MOV ECX, 8
	;taking second number as input
	AGAIN2: MOV AH, 01
	INT 21H
	CMP AL, 'A'
	JGE P2
	SUB AL,30H
	JMP P3
	P2: SUB AL, 37H
	P3: SHL EBX, 4
	MOV AH,00
	ADD EBX,EAX
	LOOP AGAIN2
	;adding the two numbers
	ADD EBX, data1
	;printing output string
	MOV AH,09
	MOV DX,OFFSET msg2
	INT 21H
	
	MOV DX, 00
	
	MOV ECX, 8
	
	AGAIN3: ROL EBX, 4
	MOV EDX,EBX
	AND DX, 0FH
	CMP DX, 09
	JG L6
	ADD DX,30H
	JMP L7
	L6: ADD DX, 37H
	L7: MOV AH,02
	INT 21H
	LOOP AGAIN3
	
	MOV AH, 4CH
	INT 21H
end
