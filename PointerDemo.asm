@n
M=0
(LOOP)
	@n
	D=M
	@R1
	D=D-M
	@END
	D;JEQ
	@SCREEN
	D=A
	@n
	A=D+M
	M=-1
	@n
	M=M+1
	@LOOP
	0;JMP
(END)
	@END
	0;JMP


