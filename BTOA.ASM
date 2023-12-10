.model small
.stack 100h
.data
        msg db 10,13,"Enter the binary character: $"
        msg2 db 10,13,"The ASCII character is: $"
.code
.startup
        mov ah,09h
        mov dx,offset msg
        int 21h

        mov bl,0
        mov cl,8
        L1:
                mov ah,01h
                int 21h
                shl bl,1
                sub al,30h
                add bl,al
                LOOP L1

        mov ah,09h
        mov dx, offset msg2
        int 21h

        mov ah,02h
        mov dl,bl
        int 21h

        mov ah,4ch
        int 21h
end
