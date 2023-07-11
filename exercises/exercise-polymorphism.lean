-- Ex 1.
-- Write a function to find the last entry in a list. It should return an Option.

def someList : List Int := [1, 2, 3]

#eval someList
#check someList

def findLastEl {α : Type} (aList : List α) : Option α:=
  match aList with
  | List.nil => none
  | List.cons x List.nil => x
  | List.cons _ xs => findLastEl xs

def List.findLastEl2 {α : Type} (aList : List α) : Option α:=
  match aList with
  | [] => none
  | x :: List.nil => x
  | _ :: xs => findLastEl xs

#eval findLastEl someList
#eval someList.findLastEl2

-- Ex 2.
-- Write a function that finds the first entry in a list that satisfies a given predicate. 
-- Start the definition with 
-- def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=

def isTwo (n : Int) : Bool :=
  if n == 3 then true else false
#check List.head!
def List.findFirst? {α : Type} (xs : List α) (predicate : α → Bool) : Option α :=
  match xs with
  | [] => none
  | y :: ys => if predicate y then y else List.findFirst? ys predicate

#eval someList.findFirst? isTwo

-- Ex 3.
-- Write a function Prod.swap that swaps the two fields in a pair.
-- Start the definition with 
-- def Prod.swap {α β : Type} (pair : α × β) : β × α :=

def aPair : Nat × Int := (1, 2)
#eval aPair

def Prod.swap {α β : Type} (pair : α × β) : β × α :=
  {fst := pair.snd, snd := pair.fst}

#eval aPair.swap

-- Ex 4.
-- Rewrite the PetName example to use a custom datatype
-- and compare it to the version that uses Sum.

inductive dogOrCat (α : Type) where
  | dog : α → dogOrCat α
  | cat : α → dogOrCat α

def PetName : Type := dogOrCat String

def animals : List PetName :=
  [dogOrCat.dog "Spot", dogOrCat.cat "Tiger", dogOrCat.dog "Fifi", dogOrCat.dog "Rex", dogOrCat.cat "Floof"]

def howManyDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | dogOrCat.dog _ :: morePets => howManyDogs morePets + 1
  | dogOrCat.cat _ :: morePets => howManyDogs morePets

#eval howManyDogs animals

