.MODEL SMALL
.STACK 100h

.DATA
prompt1     DB 13,10,'Enter start character: $'
prompt2     DB 13,10,'Enter end character: $'
resultMsg   DB 13,10,'Result: $'
invalidMsg  DB 13,10,'Invalid Input',13,10,'$'
newline     DB 13,10,'$'

startChar   DB ?
endChar     DB ?

.CODE
MAIN PROC

    ; Initialize DS
    MOV AX, @data
    MOV DS, AX

    ; ----- Prompt for start character -----
    LEA DX, prompt1
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    MOV startChar, AL

    ; flush enter
    MOV AH, 08h
    INT 21h

    ; ----- Prompt for end character -----
    LEA DX, prompt2
    MOV AH, 09h
    INT 21h

    MOV AH, 01h
    INT 21h
    MOV endChar, AL

    ; flush enter
    MOV AH, 08h
    INT 21h

    ; ----- Validation -----
    MOV AL, startChar
    CMP AL, 32
    JB INVALID_INPUT
    CMP AL, 126
    JA INVALID_INPUT

    MOV AL, endChar
    CMP AL, 32
    JB INVALID_INPUT
    CMP AL, 126
    JA INVALID_INPUT

    ; check start <= end
    MOV AL, startChar
    CMP AL, endChar
    JA INVALID_INPUT

    ; ----- Display Result -----
    LEA DX, resultMsg
    MOV AH, 09h
    INT 21h

    ; ----- Loop characters -----
    MOV BL, startChar

PRINT_LOOP:
    CMP BL, endChar
    JA DONE

    MOV DL, BL
    MOV AH, 02h
    INT 21h

    ; print space
    MOV DL, ' '
    MOV AH, 02h
    INT 21h

    INC BL
    JMP PRINT_LOOP

; ----- Invalid Input -----
INVALID_INPUT:
    LEA DX, invalidMsg
    MOV AH, 09h
    INT 21h
    JMP EXIT_PROGRAM

; ----- After loop -----
DONE:
    LEA DX, newline
    MOV AH, 09h
    INT 21h

; ----- Exit program -----
EXIT_PROGRAM:
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN