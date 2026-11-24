.MODEL SMALL
.STACK 100H
.DATA
    FunZ1 DB 'Enter First word: $'
    FunZ2 DB 0Dh,0ah,'Enter Second word: $'
    FunZ3 DB 0Dh,0ah,'Final Value is: $'

    A DW ?
    B DW ?

.CODE
MAIN PROC
    MOV AX,@DATA ; Initialize data segment
    MOV DS, AX
    
    ; Input A

    MOV AH,9
    LEA DX,FunZ1 
    INT 21H

    MOV AH , 1
    INT 21H
    SUB AL, 30H
    MOV AH, 0
    MOV A , AX
    
    ; Input B

    MOV AH , 9
    LEA DX , FunZ2
    INT 21H

    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV AH,0
    MOV B , AX

    ; Calculate A = -(A + 1 - 2B)
    
    MOV AX, A
    ADD AX , 1

    MOV BX , B
    SHL BX , 1

    SUB AX , BX
    NEG AX 

    MOV A , AX

    ; Display result message
    MOV AH , 9
    LEA DX , FunZ3
    INT 21H

    ; Display result

    MOV AX, A
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH,4Ch
    INT 21H

MAIN ENDP
END MAIN