/- # exists

`exists` は，「～という `x` が存在する」という命題を示すために，「この `x` を使え」と指示するコマンドです．

ゴールが `⊢ ∃ x, P x` のとき，`x: X` がローカルコンテキストにあれば，`exists x` によりゴールが `P x` に変わります．同時に，`P x` が自明な場合は証明が終了します．-/

namespace Exists --#

example : ∃ x : Nat, 3 * x + 1 = 7 := by
  exists 2

/- ## 内部処理についての補足
なお Lean での存在量化の定義は次のようになっています．-/

universe u

/--
info: inductive Exists.{u} : {α : Sort u} → (α → Prop) → Prop
number of parameters: 2
constructors:
Exists.intro : ∀ {α : Sort u} {p : α → Prop} (w : α), p w → Exists p
-/
#guard_msgs in #print Exists

-- `p : α → Prop` は `α` 上の述語とする．
-- このとき `w : α` と `h : p w` が与えられたとき `∃ x : α, p x` が成り立つ.
#check (Exists.intro : ∀ {α : Sort u} {p : α → Prop} (w : α) (h : p w), Exists p)

/- したがって `Exists` は単一のコンストラクタを持つ帰納型，つまり構造体なので，上記の `exists` は `exact` と無名コンストラクタで次のように書き直すことができます．-/

example : ∃ x : Nat, 3 * x + 1 = 7 := by
  exact ⟨2, show 3 * 2 + 1 = 7 from by rfl⟩

/- 一般に `exists e₁, e₂, ..` は `refine ⟨e₁, e₂, ..⟩; try trivial` の糖衣構文です．-/

end Exists --#