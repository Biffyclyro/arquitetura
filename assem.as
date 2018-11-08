	JMP start 

var_a:  DB 0
cont:	DB 0
b_: 	DB 100d

start:  MOV D, [var_a]
		MOV C, [cont]

.loop:  	CMP D, 255d
		JAE fora_loop
		INC D
		MOV A, D
		DIV 3
		MUL 3
		CMP A, D
		JE incrementa
		JMP .loop
incrementa:
		INC C		
		JMP .loop

fora_loop:
		MOV D, 232d	
		CALL printNum
		HLT

printNum:
		MOV B, [b_]
		MOV A, C
		DIV B
		MOV B, A
		DIV 10
		MUL 10
		SUB B, A
		ADD B, 48d

		MOV [D], B
		INC D
		MOV A, [b_]
		DIV 10
		MOV [b_], A
		CMP A, 1
		JAE printNum
		RET