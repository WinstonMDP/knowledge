#show math.equation.where(block: true): set align(left)

Это примерный список аксиом, так как некоторые более мощные, чем требуется, и
некоторые сократимы.

Если не указано другое, то высказывание является определением.

*Соглашение:* переменные обозначаются одной буквой.

*Соглашение:* mono шрифт обозначает wff переменные.

*Соглашение:* serif шрифт английский алфавит обозначают setvar переменные.

*Соглашение:* serif шрифт греческий алфавит обозначают class переменные.

*Соглашение:* по умолчанию setvar переменные принадлежат disjs group.

*Соглашение:* если setvar переменная только по одну сторону от $<->$ (возможно,
скрытый), то она образует disj по умолчанию с class переменной с двух сторон.

*Соглашение:* по предикатам: "$forall x, y space x = y$", "$forall x > 0 space mono(A)$",
"$forall x, y = z space z tilde y$", "$forall w, z = y, i, j, x = z$".

$ x : "class" $
$
[y \/ x]mono(A) <-> forall z = y, x = z space mono(A) | "d:" {x, z}, {y, z}, {z, mono(A)}
$
$ x in {y | mono(A)} <-> [x \/ y] mono(A) $
$ alpha = beta <-> (forall x in alpha <-> x in beta) $
$ alpha in beta <-> (exists x = alpha space x in beta) $
$ {x in alpha | mono(A)} <-> {x mid(|) cases(x in alpha, mono(A))} $

*Аксиома выделения*
$ exists x = {y in z mid(|) mono(A)} $

*Аксиома равенства*
$ (forall z in x <-> z in y) -> x = y $

$ " " : "list" $
$ alpha L : "at_least_one" | L : "list" $
$ , S : "list" | S : "at_least_one" $
$ {S} : "class" | S : "at_least_one" $
$ alpha in {beta} <-> alpha = beta $
$ alpha in {beta, S} <-> cases(delim: "[", alpha = beta, alpha in {S}) |
S : "at_least_one" $

*Аксиома пары*
$ exists x = {y, z} $

*Соглашение:* по умолчанию скобки у операция групируются направо, а предикаты
разбиваются на части и формируют конъюнкцию.

$ union alpha = {x | exists y space x in y in alpha} $

*Аксиома объединения*
$ exists x = union y $

$ alpha subset.eq beta <-> forall x in alpha space x in beta $
$ cal(P) alpha = {x | x subset.eq alpha} $

*Аксиома степени*
$ exists x = cal(P) x $

$ emptyset = {x | bot} $
$ alpha - "индуктивное" <-> cases(emptyset in alpha, forall y union {y} in alpha) $

*Аксиома бесконечности*
$ exists x - "индуктивное" $

$ VV = {x | top} $
$ alpha union beta = union {alpha, beta} $
$ sect alpha = {x | forall z space x in z in alpha} $
$ alpha sect beta = sect {alpha, beta} $
$ alpha without beta = {x in alpha | x in.not beta} $
$ alpha triangle.stroked.t beta = (alpha without beta) union (beta without alpha) $
$ (alpha, beta) = {{alpha}, {alpha, beta}} $
$ {(x, y) | mono(A)} = {z mid(|) exists x, y cases(z = (x, y), mono(A))} $
$ {(x, y) in alpha | mono(A)} = {(x, y) mid(|) cases((x, y) in alpha, mono(A))} $
$ alpha times beta = {(x, y) mid(|) cases(x in alpha, y in beta)} $
$ "dom" alpha = {x | exists y space (x, y) in alpha} $
$ "rng" alpha = {y | exists x space (x, y) in alpha} $
$ "back" alpha = {(y, x) | (x, y) in alpha} $
$ alpha compose beta = {(x, y) mid(|) exists z cases((x, z) in beta, (z, y) in alpha)} $
$ alpha harpoon.tl beta = {(x, y) in alpha | x in beta} $
$ alpha harpoon.tr beta = {(x, y) in alpha | y in beta} $
$ alpha arrow.t beta = (alpha harpoon.tl beta) harpoon.tr beta $
$
alpha - "функциональное"
<->
cases(
exists x\, y space alpha subset.eq x times y,
forall x\, y\, z space (x, y) in alpha -> (x, z) in alpha -> y = z
)
$
$
alpha - "инъективное"
<->
cases(
exists x\, y space alpha subset.eq x times y,
forall x\, y\, z space (x, y) in alpha -> (z, y) in alpha -> x = z
)
$
$
alpha - "функция из" beta
<->
cases(
	exists y space alpha subset.eq beta times y,
	beta subset.eq "dom" alpha,
	alpha - "функциональное"
)
$
$ alpha_beta = union {y | (beta, y) in alpha} $
$ alpha^beta = {x in cal(P)(beta times alpha) | x - "функция из" beta} $
$
product alpha
=
{x in (union "rng" alpha)^("dom" alpha) | forall y in "dom" alpha space x_y in alpha_y}
$
$ product.co alpha = {(x, y) in "dom" alpha times union "rng" alpha | y in alpha_x} $
$
alpha - "инъекция из" beta <-> cases(alpha - "функция из" beta, alpha - "инъективное")
$
$
alpha - "сюръекция из" beta space "в" space gamma
<->
cases(alpha - "функция из" beta, gamma subset.eq "rng" alpha)
$
$
alpha - "биекция из" beta space "в" space gamma
<->
cases(alpha - "инъекция из" beta, alpha - "сюръекция из" beta space "в" space gamma)
$
$
alpha lt.tilde beta
<->
exists x cases(x subset.eq alpha times beta, x - "инъекция из" alpha)
$
$ alpha tilde beta <-> exists x - "биекция из" alpha space "в" space beta $

*Теорема Кантора-Бернштейна-Шрёдера*
$ x lt.tilde y -> y lt.tilde x -> x tilde y $
