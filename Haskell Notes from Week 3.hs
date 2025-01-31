{-
Video one - Defining Functions:

As in most programming languages, functions can be defined using conditional expressions:
if cond then e1 else e2

Note that e1 and e2 must be of the same type
else branch is ALWAYS present


-}

abs:: Int -> Int 
abs n = if n >=0 then n else -n 

max :: Int -> Int -> Int
max x y = if x <= y then y else x

myTake :: Eq a => Int -> [a] -> [a]
myTake n xs = if n <= 0 then []
              else if xs == [] then []
                else (head xs) : myTake (n-1) (tail xs)

{-
Guarded Equations - As an alternative to conditionals, functions can also be defined using guarded equations

Otherwise will always be TRUE

An underscore "_" will is a wildcard pattern that matches any argument value
-}

abs n | n>= 0 = n 
      | otherwise = -n 


{-
Pattern Matching - Many functions are defined using pattern matching on their arguments

Pattern can be a constant value or include one or more variable


Wildcard Pattern Mathching, basically tells the compiler that the value isn't needed. 
describeList :: [a] -> String
describeList []     = "The list is empty."
describeList (_:_)  = "The list is not empty."


Ignored Function Parameters:
constantFunction :: Int -> Int -> Int
constantFunction x _ = x
-}

not :: Bool -> Bool
not False = True 
not True = False 


{-
Totality of Functions

-Total Functions map every element in the function's domain to an element in its codomain
-Partial function - maps zero or more elements if the functions domain to an element in its codomain and can leave some elements undefined
-Haskell Functions CAN be partial:

head (x:_) = x
-}

{-
Lambda Expressions:
- Functions can be consturcted without naming the functions by using lambda expressions
-lambda is represented as the backslash \ 
-Lambda Expressions can be used to give a formal meaning to functions defined using currying 
- For example:
add x y = x + y
square x = x * x 

which is same as 

 add = \x -> (\y -> x + y)
 square = \x -> x * x






-}
