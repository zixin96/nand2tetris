// D = RAM[0]
@R0
D=M
// D = D + RAM[1]
@R1
D=D+M
// D = D + 17
@17
D=D+A
// RAM[2] = D
@R2
M=D

(END)
    @END
    0;JMP