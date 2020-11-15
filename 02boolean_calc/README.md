ここでは01boolean_gateで作成した回路を用いて算術演算回路を作成する(厳密にはビルトインの基本回路)。

## もっと良い方法があるのではと思う回路
**Inc16**
著書ではnビット加算器(Add16)を用いれば簡単にできると書いてあったがやり方が解らず別の方法で作成した。
改善前
```h
    // generate 1
    Xor(a=in[0], b=in[0], out=zero);
    Not(in=zero, out=one);

    // add(in[16], one);
    HalfAdder(a=in[0], b=one, sum=out[0], carry=c1);
    HalfAdder(a=in[1], b=c1, sum=out[1], carry=c2);
    HalfAdder(a=in[2], b=c2, sum=out[2], carry=c3);
    HalfAdder(a=in[3], b=c3, sum=out[3], carry=c4);
    HalfAdder(a=in[4], b=c4, sum=out[4], carry=c5);
    HalfAdder(a=in[5], b=c5, sum=out[5], carry=c6);
    HalfAdder(a=in[6], b=c6, sum=out[6], carry=c7);
    HalfAdder(a=in[7], b=c7, sum=out[7], carry=c8);
    HalfAdder(a=in[8], b=c8, sum=out[8], carry=c9);
    HalfAdder(a=in[9], b=c9, sum=out[9], carry=c10);
    HalfAdder(a=in[10], b=c10, sum=out[10], carry=c11);
    HalfAdder(a=in[11], b=c11, sum=out[11], carry=c12);
    HalfAdder(a=in[12], b=c12, sum=out[12], carry=c13);
    HalfAdder(a=in[13], b=c13, sum=out[13], carry=c14);
    HalfAdder(a=in[14], b=c14, sum=out[14], carry=c15);
    HalfAdder(a=in[15], b=c15, sum=out[15], carry=c16);
```
改善後
```h
PARTS:
Add16(a=in, b[0]=true, b[1..15]=false, out=out);
```

ALUは[ひとりNand2Tetris(2) - ALUまで](http://blog.tojiru.net/article/426464326.html)を参考にした