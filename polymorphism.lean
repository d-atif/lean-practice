structure Point where
  point::
  x : Float
  y : Float
deriving Repr

structure PPoint (α : Type) where
  x : α
  y : α
deriving Repr

#check PPoint

def natOrigin : PPoint Nat :=
  { x := Nat.zero, y := Nat.zero }

def replaceX (α : Type) (point : PPoint α) (newX : α) : PPoint α :=
  { point with x := newX}

#check (replaceX)
#check replaceX Nat
#check replaceX Nat natOrigin
#check replaceX Nat natOrigin 5
#eval replaceX Nat natOrigin 5

inductive Sign where
  | pos
  | neg

def posOrNegThree (s : Sign) : match s with | Sign.pos => Nat | Sign.neg => Int :=
  match s with
  | Sign.pos => (3 : Nat)
  | Sign.neg => (-3 : Int)

#check posOrNegThree Sign.pos
#eval posOrNegThree Sign.pos
#eval posOrNegThree Sign.neg

-- #eval length String ["Sourdough", "bread"]

-- Linked Lists

def primesUnder10 : List Nat := [2, 3, 5, 7]

-- inductive List (α : Type) where
--   | nil : List α
--   | cons : α -> List α -> List α

def explicitPrimesUnder10 : List Nat :=
  List.cons 2 (List.cons 3 (List.cons 5 (List.cons 7 List.nil)))

#eval primesUnder10
#eval explicitPrimesUnder10
#eval List.cons 1 (List.cons 2 List.nil)

def oneTwo : List Nat := [1, 2]

def length (α : Type) (xs : List α) : Nat :=
  match xs with
  | List.nil => Nat.zero
  | List.cons _ ys => Nat.succ (length α ys)

-- length Nat oneTwo
-- length α [1, 2]
-- ===
-- length α List.cons 1 (List.cons 2 List.nil)
-- match xs with y=List.cons 1, ys=(List.cons 2 List.nil) => Nat.succ (length Nat (ys=List.cons 2 List.nil))
-- Nat.succ (length Nat (ys=List.cons 2 List.nil)) === 1
--  length Nat (List.cons 2 List.nil)
--  match xs with List.cons y=2 ys=List.nil => Nat.succ (length Nat (ys=List.nil))
--  Nat.succ (length Nat (ys=List.nil)) === 2
--    length Nat (List.nil)
--    match xs with List.nil => Nat.zero
--    Nat.zero === 3
-- 1(2(3))
-- Nat.succ(Nat.succ(Nat.zero)) = 2

def length2 (α : Type) (xs : List α) : Nat :=
  match xs with
  | [] => Nat.zero
  | _ :: ys => Nat.succ (length α ys)

#eval length Nat primesUnder10
#eval length2 Nat primesUnder10
#eval primesUnder10.length

-- implicit as in infer the type of the provided arg
def implicitTypeLength {α : Type} (xs : List α) : Nat :=
  match xs with
  | [] => Nat.zero
  | _ :: ys => Nat.succ (length α ys)

#eval implicitTypeLength oneTwo

-- Instance of List.length that only works for integers can be specified by:
#check List.length (α := Int)

-- inductive Option (α : Type) : Type where
--  | none : Option α
--  | some (val : α) : Option α
 
-- def List.head? (α : Type) (xs : List α) : Option α :=
--   match xs with
--   | [] => none
--   | y :: _ => some y

#eval primesUnder10.head? -- for a version that returns an Option
#eval primesUnder10.head! -- crashes when provided with invalid input
-- primesUnder10.headD -- returns a default value when the operation would otherwise fail

-- #eval [].head? -- error
#eval [].head? (α := Int)
#eval ([] : List Int).head?

-- structure Prod (α : Type) (β : Type) where
--   fst : α
--   snd : β

-- def fives : String × Nat := {fst := "five", snd := 5}
def fives : String × Nat := ("five", 5)
#eval fives
-- def sevens : String × Int × Nat := ("VII", 7, 4+3)
def sevens : String × (Int × Nat) := ("VII", 7, 4+3)
#eval sevens

-- inductive Sum (α : Type) (β : Type) : Type where
--   | inl: α → Sum α β
--   | inr: β → Sum α β

def PetName : Type := String ⊕ String

def animals : List PetName :=
  [Sum.inl "Spot", Sum.inr "Tiger", Sum.inl "Fifi", Sum.inl "Rex", Sum.inr "Floof"]

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | Sum.inl _ :: morePets => howManyDogs morePets + 1
  | Sum.inr _ :: morePets => howManyDogs morePets

#eval howManyDogs animals