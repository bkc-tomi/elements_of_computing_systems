// 1 ... 10の和を求める(練習用プログラムp.68)
@i
M=1
@sum
M=0
(LOOP)
@i
D=M
@10
D=D-A
@END
D;JGT
@i
D=M
@sum
M=M+D
@i
M=M+1
@LOOP
0;JMP
// 終了
(END)
@END
0;JMP