// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


// Note that there are 8192 16-bit words in a 256x512 screen


// n = 0
@n
M=0

(LOOP)
	// the following two conditionals make sure that we don't modify anything outside the Screen range
	// if n == -1, n == 0
	@n
	D=M
	A=-1
	D=D-A
	@FIRSTCOND
	D;JEQ
	// if n == 8192, n == 8191
	@n
	D=M
	@8192
	D=D-A
	@SECONDCOND
	D;JEQ

	(JUMPBACKAFTERSETTINGN)
	// if KBD != 0 (which means keys are pressed), goto BLACKEN
	@KBD
	D=M
	@BLACKEN
	D;JNE
		// if (n == -1), we have whiten the entire screen. GOto START b/c next n should start at 0, not -1
		@n
		D=M
		A=-1
		D=D-A
		@LOOP
		D;JEQ
		// *(SCREEN + n) = 0
		@SCREEN
		D=A
		@n
		A=D+M
		M=0
		// n = n - 1
		@n
		M=M-1
	@LOOP
	0;JMP

	(BLACKEN)
		// if (n == 8192), we have blacken the entire screen. Goto START
		@n
		D=M
		@8192
		D=D-A
		@LOOP
		D;JEQ
		// *(SCREEN + n) = -1
		@SCREEN
		D=A // Notice here we use D=A, instead of D=M. Since we want to assign @SCREEN (an address) to D, not the content at this address. (which should be zero b/c the screen is intially white)
		@n
		A=D+M // A now holds the right address, waiting for us to put -1 into it
		M=-1 // Put -1 into it
		// n = n + 1
		@n
		M=M+1
// goto LOOP
@LOOP
0;JMP

(FIRSTCOND)
@n
M=0
@JUMPBACKAFTERSETTINGN
0;JMP

(SECONDCOND)
@8191
D=A
@n
M=D
@JUMPBACKAFTERSETTINGN
0;JMP

