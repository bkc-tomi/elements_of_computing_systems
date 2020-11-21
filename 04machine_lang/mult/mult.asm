// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// 初期化
@0
D=M
@a
M=D
@1
D=M
@b
M=-D // b=-R[1]で代入
@2
M=0
// ここから演算
(LOOP)
@b
D=M
@END
D;JGE // if b >= 0 then (END)
@a
D=M
@2
M=M+D // mult = mult + a
@b
M=M+1 // b++
@LOOP
0;JMP
// 終了
(END)
@END
0;JMP
