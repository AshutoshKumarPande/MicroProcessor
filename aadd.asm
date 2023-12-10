.model small
.stack 100h
.386
.data
    A1 DB 20 DUP (?)
    A2 DB 20 DUP (?)
    DATA1 DW 0000H
    DATA2 DW 0000H
    MSG DB 10,13,"ENTER THE SIZE OF THE ARRAY: $"
    MSG2 DB 10,13,"ENTER THE ELEMENT FOR THE FIRST ARRAY $"
    MSG3 DB 10,13,"ENTER THE ELEMENT FOR THE SECOND ARRAY $"
    MSG4 DB 10,13,"THE SUM OF BOTH ARRAY IS $"

.CODE
.STARTUP
    MOV AH,09
    MOV DX,OFFSET MSG
    INT 21H

    MOV CX,2
    L4: MOV AH,01
    INT 21H
    CMP AL,'A'
    JGE L9
    SUB AL,30H
    JMP L8
    L9: SUB AL,37H
    L8: SHL BX,4
    ADD BL,AL
    LOOP L4

    MOV AL,BL
    MOV CL,AL
    MOV AH,0
    MOV DATA1,AX
    MOV CX,DATA1

    MOV AH,09
    MOV DX,OFFSET MSG2
    INT 21H

    MOV AH,0

    MOV CX, DATA1 
    LEA SI, A1 
    L1: MOV DL, 0AH ; jump onto next line
    MOV AH, 02H
    INT 21H
    MOV AH, 01H
    INT 21H
    SUB AL,30H
    MOV [SI], AL
    INC SI
    LOOP L1

    MOV CX, DATA1 
    MOV AH,09
    MOV DX,OFFSET msg3
    INT 21H
    MOV AH,0
    LEA DI, A2 
    L3: MOV DL, 0AH ; jump onto next line
    MOV AH, 02H
    INT 21H
    MOV AH, 01H
    INT 21H
    SUB AL,30H
    MOV [DI], AL
    INC DI
    LOOP L3

    LEA SI, A1 
    LEA DI, A2 
    MOV CX, DATA1 
    ADDA: MOV AL, [SI] 
    ADD AL, [DI] 
    MOV [SI], AL
    INC DI
    INC SI
    LOOP ADDA

    MOV AH, 09H
    MOV DX, OFFSET MSG4
    INT 21H
    
    MOV CX, DATA1 
    LEA SI, A1 
    L5:mov ah, 02h
    mov dl, 0ah
    int 21h
    MOV DATA2, CX
    MOV CX, 2
    MOV BL, [SI] 
    ADDA1: ROL BL, 4
    MOV DL, BL
    AND DL, 0FH
    CMP Dl, 9
    JA L6 
    ADD DL, 30h
    JMP L7 
    L6: ADD DL, 37H
    L7: MOV AH, 02
    INT 21H
    LOOP ADDA1 
    MOV CX, DATA2 
    INC SI
    LOOP L5 

    MOV AH,4CH
    INT 21H
END