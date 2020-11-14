# basic_gate
基本論理ゲートは全てNandゲートの組み合わせで作成している。
## 改善
私が思いついたゲートより効率が良いゲートがあれば改善する。ファイルに残すのは改善した後なのでここに改善前のゲートを残す(場合によっては考察する)。
### Orゲート
```h
/* 改善前：良い回路が思いつかず先にXorをやってOrを作成したのでXorの回路構成を使っている。 */
// Not Xor(a, b)
Nand(a=a, b=a, out=nota);
Nand(a=nota, b=b, out=x);
Nand(a=b, b=b, out=notb);
Nand(a=a, b=notb, out=y);
Nand(a=x, b=y, out=xor);
Nand(a=xor, b=xor, out=notxor);
// Nand(a, b)
Nand(a=a, b=b, out=nand);
// Nand(notxor, nand)
Nand(a=notxor, b=nand, out=out);

/* 改善後 */
// Not(a)
Nand(a=a, b=a, out=nota);
// Not(b)
Nand(a=b, b=b, out=notb);
// Nand(nota, notb)
Nand(a=nota, b=notb, out=out);
```

# multi_gate
基本的にはbasic_gateで作った回路を組み合わせて作成する(厳密には用意されているビルトイン回路)。
\*\*Way\*\*.hdlに関しては工夫が必要なものがある。