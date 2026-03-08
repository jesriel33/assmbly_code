# Task: Ask start char and end char, print all chars in range

Steps:

Read start char
Read end char
Loop from start to end:
Print char each iteration
Optionally print spaces/newlines for formatting

Final Laboratory Exam
General Instructions (Applies to ALL Projects)

 

Objectives:

Create a working Assembly program using Turbo Assembler (TASM) that demonstrates:

Proper input and output using DOS interrupts (INT 21h)
Correct logic/looping/comparisons
Clean screen prompts and clear results
Allowed Inputs

Unless stated, inputs are single-digit (0–9) or single characters.
For string programs, use buffered input (INT 21h, AH=0Ah).
Minimum Program Requirements

Your program must include:

DATA segment
Prompt messages
Output labels (e.g., “Result: ”)
Buffers (for string input)
CODE segment
Initialize DS (MOV AX,@DATA / MOV DS,AX)
Show prompts
Read input
Process
Display output
Exit properly (INT 21h, AH=4Ch)
User-friendly prompts
Tell the user what to enter
Validation (basic)
If input is invalid, show “Invalid input” and return to menu or end
Common DOS Interrupts You May Use

Display string: AH=09h (string ends with $)
Read 1 character: AH=01h (echoed)
Read 1 character (no echo): AH=08h (good for masked password)
Buffered string input: AH=0Ah
Print character: AH=02h
Exit: AH=4Ch
Output Formatting Rules

Always print a label before the answer (example: Result: )
Add newline after results (CR/LF)
