structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

-- inductive Bool where
--   | false : Bool
--   | true : Bool

-- inductive Nat where
--   | zero : Nat
--   | succ (n : Nat) : Nat


def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ _ => false

#eval isZero Nat.zero
#eval isZero (Nat.succ Nat.zero)
#eval isZero (Nat.succ 1)
#eval isZero 5

def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => 0
  | Nat.succ k => k

#eval pred 3
#eval pred (Nat.succ 4)

def depth (p : Point3D) : Float :=
  match p with
  | {x := _, y := _, z := d} => d

#eval depth {x := 1, y := 2, z := 3}

def even (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => not (even k)

-- def evenLoops (n : Nat) : Bool :=
--   match n with
--   | Nat.zero => true
--   | Nat.succ k => not (evenLoops n)

#eval even 2

def plus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => Nat.succ (plus n k')
  -- | Nat.succ k' =>  k'

#eval plus 2 5

def times (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => Nat.zero
  | Nat.succ k' => plus n (times n k')

#eval times 2 3
-- times 2 Nat.succ(Nat.succ(Nat.succ Nat.zero))  
-- match Nat.succ(Nat.succ(Nat.succ Nat.zero)) with
--  | Nat.zero => Nat.zero
--  | Nat.succ Nat.succ(Nat.succ Nat.zero) => plus 2 (times 2 Nat.succ(Nat.succ Nat.zero))
-- plus 2 (times 2 Nat.succ(Nat.succ Nat.zero)) === plus 2 4 = 6
  -- times 2 Nat.succ(Nat.succ Nat.zero)
  -- match Nat.succ(Nat.succ Nat.zero) with
  --  | Nat.zero => Nat.zero
  --  | Nat.succ Nat.succ Nat.zero => plus 2 (times 2 Nat.succ Nat.zero)
  -- plus 2 (times 2 Nat.succ Nat.zero) === plus 2 2 = 4
    -- times 2 Nat.succ Nat.zero
    -- match Nat.succ Nat.zero with
    --  | Nat.zero => Nat.zero
    --  | Nat.succ Nat.zero => plus 2 (times 2 Nat.zero)
    -- plus 2 (times 2 Nat.zero) === plus 2 0 = 2
      -- times 2 Nat.zero
      -- match Nat.zero with
      --  | Nat.zero => Nat.zero
      --  | Nat.succ = ...
      -- Nat.zero
    -- plus 2 (Nat.zero) === 2
  -- plus 2 (2) === 4
-- plus 2 (plus 2 (plus 2 (Nat.zero)))
-- Nat.succ(Nat.succ(Nat.succ(Nat.succ(Nat.succ(Nat.succ Nat.zero)))))
-- plus 2 (plus 2 2))
-- plus 2 (Nat.succ(Nat.succ(2)))
-- ...


def minus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => pred (minus n k')

#eval minus 5 1

-- def div (n : Nat) (k : Nat) : Nat :=
  -- if n < k then
  --   0
  -- else Nat.succ (div (n - k) k)