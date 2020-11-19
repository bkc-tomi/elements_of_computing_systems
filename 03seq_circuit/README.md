難しかったのはプログラムカウンターなのでそこだけ補足しておく。

```
code-1
/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */
```

load, reset, incの全てがtrueの場合もあるのでif-elseで処理するためにはcode-1の条件をしたから判定していくと上手くいく。
マルチプレクサーは2つの入力のうち一つを選択する回路なので、マルチプレクサーごとに出力を書き換えていく形になる。なのでcode-2のようにcode-1と同じ順番にするとcode-3と同じ処理に相当することになる。
```
code-2
Mux16(a=uu,b[0..15]=false,sel=reset,out=this);
Mux16(a=o,b=in,sel=load,out=uu);
Inc16(in=oo,out=incd);
Mux16(a=oo,b=incd,sel=inc,out=o);
Register(in=this,load=true,out=out,out=oo);

code-3
/**
 * A 16-bit counter with load and reset control bits.
 * if (reset[t] == 1) out[t+1] = 0
 * if (load[t] == 1)  out[t+1] = in[t]
 * if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else               out[t+1] = out[t]
 */
```
これを防ぐためにはcode-4のように下から評価する。
```
code-4
Inc16(in=oo,out=incd);
Mux16(a=oo,b=incd,sel=inc,out=o);
Mux16(a=o,b=in,sel=load,out=uu);
Mux16(a=uu,b[0..15]=false,sel=reset,out=this);
Register(in=this,load=true,out=out,out=oo);
```