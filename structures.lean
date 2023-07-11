structure Point where
  point::
  x : Float
  y : Float
deriving Repr

#check Point

def origin: Point := { x := 0, y := 0 }
#eval origin
#eval origin.x
#check origin.x
#check { x := 0, y := 0 : Point }

def addPoints (p1: Point) (p2: Point) : Point :=
  { x := p1.x + p2.x, y := p1.y + p2.y }

#eval addPoints origin { x := 1, y := 1 }

def distance (p1: Point) (p2: Point) : Float :=
  Float.sqrt ((p2.x - p1.x) ^ 2.0 + (p2.y - p1.y) ^ 2.0)

#eval distance { x := 1, y := 1 } { x := 2, y := 1 }

structure Point3D where
  x : Float
  y : Float
  z : Float
deriving Repr

def origin3D : Point3D := { x := 0, y := 0, z := 0 }

-- def zeroX (p: Point) : Point :=
--   {x := 0, y := p.y}

def zeroX (p: Point) : Point :=
  { p with x := 0 }

def fourAndThree : Point :=
  { x := 4.3, y := 3.4}

#eval fourAndThree
#eval zeroX fourAndThree
#eval fourAndThree

#check Point.point 1.5 2.8
#check (Point.point)
#check Point.x
#check (Point.x)

#eval "one string".append " and another"

def Point.modifyBoth (f: Float -> Float) (p: Point) : Point :=
  { x := f p.x, y := f p.y}

#eval fourAndThree.modifyBoth Float.floor

structure RectangularPrism where
  height : Float
  width : Float
  depth : Float
deriving Repr

def volume (rPrism : RectangularPrism) : Float :=
  rPrism.height * rPrism.width * rPrism.depth

def rPrism : RectangularPrism := { height := 2.0, width := 1.0, depth := 1.0 }

#eval volume rPrism

structure Segment where
  a : Float
  b : Float
deriving Repr

def length (segment : Segment) : Float :=
  if segment.a - segment.b < 0 then -(segment.a - segment.b) else segment.a - segment.b

#eval length { a := 4.0, b := 3.0}

