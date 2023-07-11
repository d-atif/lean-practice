#eval Lean.versionString
#eval 1 + 2 * 5
#eval String.append "Hello " (String.append "oak tree" " great")
#eval String.append "yessir " (if 1>2 then "yes" else "no")
#eval if 3==3 then "yes" else "nah"
#eval if 3==4 then "yes" else "nah"
#eval String.append "A" (String.append "B" "C")
#eval String.append (String.append "A" "B") "C"
#eval (1 + 2: Nat)
#eval (1 - 2: Nat)
#eval (1 - 2: Int)
#check (1 - 2: Int)

-- Definitions
def hello := "Hello"
def lean : String := "lean"
#eval String.append hello (String.append " " lean)

-- Functions
def add1 (n : Nat) : Nat := 1 + n

#eval add1 4
def maximum (n: Nat) (k: Nat) : Nat := if n > k then n else k
#eval maximum 3 5
#check add1
#check (add1)
#check maximum
#check (maximum)
#check String.append "hello"

def joinStringsWith (a: String) (b: String) (c: String) : String := 
String.append b (String.append a c)

#eval joinStringsWith ", " "one" "and another"
#check joinStringsWith
#check (joinStringsWith)

def volume (l: Nat) (w: Nat) (h: Nat) : Nat := l * w * h
#eval volume 1 2 3
#check volume
#check (volume)

-- Defining/abbreviating types
def Str : Type := String
def aStr : Str := "house"
#eval aStr
def NaturalNumber : Type := Nat
-- def thirtyEight : NaturalNumber := 38
def thirtyEight : NaturalNumber := (38 : Nat)
#eval thirtyEight
abbrev N : Type := Nat
def thirtyFive : N := 35
#eval thirtyFive

#check 1.2
#check 0
#check (0 : Float)