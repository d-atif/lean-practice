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