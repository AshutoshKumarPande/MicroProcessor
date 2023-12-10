.model SMALL
.stack 100H
.386
.data
ARRAY dw 20 DUP (?)  
DATA1 dw 0000H
NUMB dw 0000H
msg db 10,13,"Enter the size of the array: $"
msg2 db 10,13,"Enter the elements of array: $"
msg3 db 10,13,"The sorted array is: $"

.code
.startup

mov ah, 09h
mov dx, offset msg
int 21h

mov ah, 01h
int 21h

sub al, 30h
mov ah, 0
mov cx, ax
mov DATA1, ax
mov ah, 09h
mov dx, offset msg2
int 21h

mov ah, 0
mov si, 0
mov bx, offset ARRAY

l1: mov dl, 0ah
    mov ah, 02h
    int 21h
    mov dx, si
    mov ah, 01h
    int 21h
    sub al, 30h
    mov si, dx
    mov [bx + si], ax
    inc si
loop l1

mov cx, DATA1
mov bx, offset ARRAY
mov di, cx

l2: mov cx, DATA1
    mov NUMB, cx
    dec NUMB
    mov cx, NUMB
    mov si, 0

l3: mov al, [bx + si]
    cmp [bx + si + 1], al
    jl l4
    xchg al, [bx + si + 1]
    mov [bx + si], al

l4: inc si

loop l3

dec di
jnz l2

MOV CX, DATA1
MOV SI, 0
MOV BX, OFFSET ARRAY
	
MOV AH,09
MOV DX, OFFSET msg3
INT 21H

l5: mov dl, 0ah
    mov ah, 02h
    int 21h
   
    mov dx, [bx + si]
    inc si
    add dl, 30h
    
    mov ah, 02
    int 21h

loop l5

mov ah, 4ch
int 21h
end
    