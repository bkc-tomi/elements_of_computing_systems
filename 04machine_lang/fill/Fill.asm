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
@0
M=-1
@1
M=0
(INIT)
@KBD
D=A
@pos
M=D-1
@KBD
D=M
@SCBRACK
D;JGT
@SCWHITE
D;JLE
(SCBRACK)
@pos
D=M
@0
A=D
M=-1
@pos
M=D-1
@pos
D=M
@SCREEN
D=D-A
@SCBRACK
D;JGE
@INIT
D;JLE
(SCWHITE)
@pos
D=M
@0
A=D
M=0
@pos
M=D-1
@pos
D=M
@SCREEN
D=D-A
@SCWHITE
D;JGE
@INIT
D;JLE
