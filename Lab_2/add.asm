.MODEL SMALL
.STACK 100H
.DATA

    newline db 0dh,0ah,'$'
    num1 db 5
    num2 db 4
    sum db ?

.CODE
    MAIN PROC
        MOV AX , @DATA ;initialize
        MOV DS , AX

        MOV AL , num1
        ADD AL , num2 ; sum
        MOV sum , AL

        MOV AH, 9
        LEA DX , newline ; sting output print with new line
        INT 21H

        MOV DL,sum
        ADD DL,30H
        MOV AH , 2
        INT 21H 

        MOV AH,4Ch
        INT 21H

    MAIN ENDP
    END MAIN
    