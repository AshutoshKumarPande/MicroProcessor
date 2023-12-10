.model small
.stack 100h
.386
.data
        ARRAY dw 20 DUP (?)
        DATA1 dw 0000h
        DATA2 dw 0000h
        success db 10,13,"Element is present in the array $"
        fail db 10,13,"Element is not present in the array $"

        msg db 10,13,"Enter the size of the array: $"
        msg2 db 10,13,"Enter the element of array: $"
        msg3 db 10,13,"Enter the element to be searched: $"
        msg4 db 10,13,"at index  $"
        
.code
.startup
        mov ah,09h
        mov dx,offset msg
        int 21h

        mov ah,01
        int 21h

        sub al,30h
        mov ah,0
        mov cx,ax
        mov DATA1,ax

        mov ah,09
        mov dx,offset msg2
        int 21h

        mov ah,0
        mov si,0
        mov bx,offset ARRAY
        L1:
                mov dl,0ah
                mov ah,02h
                int 21h

                mov dx,si
                mov ah,01h
                int 21h

                sub al,30h

                mov [bx+si],ax
                inc si
                loop L1





        mov ah,09
        mov dx,offset msg3
        int 21h

        mov ah,01
        int 21h
        sub al,30h

	MOV DATA2,AX
	MOV CX,DATA1
	MOV SI,0
	MOV DI, DATA1
	MOV BP, 0
	MOV BX, OFFSET ARRAY
	MOV AX, DATA1
	L2: 	MOV SI, DI	
		ADD SI, BP
		MOV AX, SI
		MOV DL, 2
		DIV DL
		MOV AH,0
		MOV DX,0
		MOV SI,AX
		MOV DX,DATA2
		CMP [BX + SI],DL
		JZ L3
		CALL L4
		LOOP L2
	
	MOV AH, 09H
	MOV DX,OFFSET fail ; if the element is not found
	INT 21H
	
	MOV AH, 4CH ; to forcefully terminate the program
	INT 21H

	L3:	MOV AH, 09H 
		MOV DX,OFFSET success ; if the element is found
		INT 21H
		
		MOV AH, 09H
		MOV DX,OFFSET msg4
		INT 21H
		
		MOV DX,SI
		ADD DX,30H
		ADD DX,01
		
		MOV AH, 02
		INT 21H
		
		MOV AH, 4CH
		INT 21H
	
	L4 	PROC NEAR
		CMP [BX+SI], DL		
		JL L6
		MOV DI, SI
		RET
	L6: 	MOV BP,SI
		RET
	L4 	ENDP
		
		MOV AH, 4CH
		INT 21H
END