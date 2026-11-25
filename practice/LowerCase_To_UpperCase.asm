.MODEL SMALL
.STACK 100H
.DATA

     msg1 db 'Enter a single lowercase Character: $'
     msg2 db 0ah,0dh,'Your entered Character in Uppercase: $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV Ds,AX


    MOV AH , 9
    LEA DX , msg1
    INT 21H

    MOV AH ,1
    INT 21H

    SUB AL , 20H
    MOV BL,AL

    MOV AH,9
    LEA DX, msg2
    INT 21H
    
  
    MOV DL,BL
    INT 21H

    MOV AH , 4Ch
    INT 21H

MAIN ENDP
END MAIN