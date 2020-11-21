// aの絶対値を求める。(aはコード内で指定)
@5
D=A
@a
M=-D
@abs
M=0
// ここから演算
@a
D=M
@POS
D;JGE // a >= 0 なら (POS)に移動
@NEG
D;JLT // a < 0 なら (NEG)に移動
(POS)
@abs
M=D
@END
0;JMP
(NEG)
@abs
M=-D
@END
0;JMP
(END)
@END
0;JMP