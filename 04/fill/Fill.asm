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

// Keyboard 24576 0x6000
// Screen 16384 0x4000

(LOOP)

@24576
D=M
@LOOP
D;JEQ

// 8192 words - 32 words a row - 512 rows
// 16bit words

@i
M=0
(FILL)
@i
D=M
@16384
A=A+D
M=0
M=!M

@i
M=M+1
D=M
@8192
D=D-A

@UNPRESS
D;JEQ
@FILL
0;JMP

(UNPRESS)
@24576
D=M
@UNFILL
D;JEQ
@UNPRESS
0;JMP

(UNFILL)
@fi
M=0
(LOOPUNFILL)
@fi
D=M
@16384
A=A+D
M=0

@fi
M=M+1
D=M
@8192
D=D-A
@LOOP
D;JEQ
@LOOPUNFILL
0;JMP

@LOOP
0;JMP

