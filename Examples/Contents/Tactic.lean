/- # タクティク
タクティクは，Lean において証明を対話的に行ったり自動化したりするためのツールです．

Lean において命題 `P : Prop` の証明とは，型 `P` を持つ項 `h : P` のことであり，証明は項です．たとえば `1 + 1 = 2` の証明は `1 + 1 = 2` という型を持つ項です．
-/

-- `1 + 1 = 2` を証明する
theorem foo : 1 + 1 = 2 := by rfl

-- `foo` の型を確認する
#check (foo : 1 + 1 = 2)

-- `rfl` は項を構成する
def bar := (by rfl : 1 + 1 = 2)

-- 証明項 `bar` は `foo` と同様に `1 + 1 = 2` の証明項として機能する
example : 1 + 1 = 2 := bar

/- Lean では証明項を直接構成する方法と，タクティクを使用する方法の両方で証明が可能です．-/

variable {P Q : Prop}

-- タクティクを使用する方法
example (hPQ : P → Q) (hP : P) : Q := by
  apply hPQ
  exact hP

-- 証明項を直接構成する方法
example (hPQ : P → Q) (hP : P) : Q := hPQ hP
