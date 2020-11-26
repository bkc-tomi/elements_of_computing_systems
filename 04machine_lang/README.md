４章の課題はHack機械語(アセンブリ言語)を使ってみて理解を深めることが目的である。
@value, @argで値または変数(の値を格納するメモリーアドレス)を指定する(CPUエミュレーターで読み込まれるとどちらも数値になり、値, 変数のアドレスを表す)。
@XXXはまずAレジスタに格納される。以下のような場合は値を扱うDレジスタに格納したので値として振舞う。
```
@5
D=A
```
また以下のようにMを使うとAレジスタの値はメモリーアドレスとして振舞うので@XXXは変数を指定したことになる。
```
@a
M=D
```
@数値と書いた場合はMemory\[数値\]を直接指定したことになる
```
@13
M=D // Memory[13]にDの値を格納
```
以下のようにプログラムカウンターのXXX行目に飛ぶことができる(つまりコードのXXX行目)。これによってループ処理や分岐処理ができる。
```
@XXX
0;JMP
```
これでDの値を元にジャンプ先を決めることもできる。必ず０と比較することになる。
```
@XXX
D;JEQ // Jump XXX if D = 0
@YYY
D;JGT // Jump YYY if D > 0
```
以下のように@value, @argの指定の後に複数の操作を行うこともできる。これでアクセスしたいメモリーアドレスを指定できる。
```
@0
A=D
M=0
```

```asm:fill.asm
@SCREEN
D=A
@scstart
M=D
@24575
D=A
@scend
M=D
(START)
// キー入力判定
@24576
D=M
@NOPRESSED
D;JEQ
(PRESSED)
// スクリーンを黒に
@scend
D=M
@i
M=D
(LOOPB)
@i
M
@1
M=A
@i
M=M-1
@scstart
D=M
@i
D=D-A
@LOOPB
D;JEQ
@END
0;JMP
(NOPRESSED)
// スクリーンを白に
@SCREEN
M=0
(END)
@START
0;JMP
```