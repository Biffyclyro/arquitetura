	JMP start
	

vetor: 	DB 1
	DB 2
	DB 3
	DB 4

varb:   DB 5
x:	DB 0
i: 	DB 0 
b_: 	DB 100d

tmp:
 
	

start:
	MOV D, [i]

inicio_for:

	CMP D, 4d   ; d = decimal
	JAE fora_for
        ADD D, vetor
	MOV D, [D]
	MOV A, [varb]
	MUL D
	ADD A, [x]
	MOV [x], A
	MOV D, [i]
	INC D
	MOV [i], D
	JMP inicio_for
fora_for:	
	MOV C, x ;ponteiro para variavel
	MOV D, 232
	
	CALL printNum
	HLT

printNum:
	PUSH A
	PUSH B
	
	
.do:
	MOV B, [b_]
	MOV A, [C] ; carrega num
	DIV B
	MOV B, A ; moveu para dentro do b pois iria zoar o A
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
	JAE .do
	POP B
	POP A
	RET 