.model small
.stack 100h
.386
.data
	ARRAY dw 20 DUP (?)
	DATA1 dw 0000h
	success db 10,13,"Element is present in the array $"
	fail db 10,13,"Element is not present in the array $"
	
	msg db 10,13,"Enter the size of the array: $"
	msg2 db 10,13,"Enter the elements of array$"
	msg3 db 10,13,"Enter the element to be searched: $"
	msg4 db 10,13,"at index: $"
.code 
.startup
	mov ah,09
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
	
	mov cx,DATA1
	mov ah,09
	mov dx,offset msg3
	int 21h

	mov ah,01
	int 21h
	sub al,30h
	
	mov si,0
	mov bx,offset ARRAY

	L2:
		cmp [bx+si],al
		jz L3
		inc si
		loop L2
	mov ah,09
	mov dx,offset fail
	int 21h

	mov ah,4ch
	int 21h
	
	L3:
		mov ah,09
		mov dx,offset success
		int 21h
		
		mov ah,09
		mov dx,offset msg4
		int 21h

		inc si
		mov dx,si
		add dx,30h
		mov ah,02
		int 21h

		mov ah,4ch
		int 21h
end