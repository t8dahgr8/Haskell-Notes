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


{-
Let and Where 
-The let and where clasues are used to create a local scope within a function
-Let-in is a expression, but where block is a block
EX:
-}

let x = 3 in 2 * x {- Will return 6-}

y = 2 * x where x = 3 {-Valid but won't return anything, you need to call y-}
y {- Will print 6-}

let {a=2; b = 7} in a + b {- Will return 9-}
z = a + b where {a=2; b = 7} 
z {returns 9}

[let c = 5 in 5 * c, let d = 6 in d +9] {-Will return the list [10,9]-}
[let c = 5 in 5 * c, let d = 6 in c*3 + d] {-Will return an error, because we cannot use c out of scope-}





{-
Operator Sections
An operator written between its two arguments can be converted into a curried function written before its two argumetns by using parenthesis

The convention also allwos one of the arguments of the operator to be included in the parenthesis

-Sections can be used liked curried functions
-}

{-All will return 3-}
1 + 2 
(+) 1 2
(1+) 2





{-Video 2: List Comprehension

- Convenient syntax for defining lists
- Set comprehension - In math, the comprehension notation can be used to construct new sets from old sets 
- Generators: The expression " x <-[1...10] " is called a generator, as it states how to generate values for x
-Dependant Generators: Later generatros can depend on the variables that are introduced by earlier generators
[(x, y) | x <- [1..3], y <- [x..3]]


- Using a dependant generator, we can define the library function that concatenates a list of lists. 
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]



-List comprehensions can use guards to restruct the values produced by earlier generators
[x | x <- [1..10], even x] {-Only get the x's that are even-}

-}


{-
Zip Function:
A useful library function is zip, which maps two lists to a list of pairs of their corresponding elements
-Using zip we can define a function that returns the list of ALL positions of a value in a list (second code)
-}
zip :: [a] -> [b] -> [(a, b)]
zip ['a', 'b', 'c'] [1, 2, 3, 4] will produce [('a', 1), ('b', 2), ('c', 3)] 



positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..n], x == x']
                 where n = length xs - 1


 