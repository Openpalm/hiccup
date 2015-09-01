-- what does this shit do.
-- SHOWS HOW SIMILAR TWO FUNCTIONS ARE RELATIVE TO IIDENTICAL INPUT - HEURISTICAL TOOL. DOES NOT GIVE RIGHT/WRONG RESULTS - ONLY TEXTUAL REPRESENTATION.
--
-- usage(after loading): mainf "==" 10
--
--if your task changes, make sure you change these two functions:
-- lhsf = left hand side function
-- rhsf = right hand side function
--
--
-- the whole purpose of this little piece of code is to "visualize" results for heuristical reasons for those of us who would benefit from it. beats doing it by hand.


-- functions from exercise sheet 2 (u2 prefix) - can be ignored.

u2sumside k = [(n+1)*2^n | n <- [1..k]]
u2funside k = (k+1)*2^(k+2) - (k+2)*2^(k+1) +1
sumk k = sum . u2sumside $ k


-- functions to induce on

lhsf n = 2^n
rhsf n = n^3



-- the work
induceResult f n = (show (lhsf n)) ++ " " ++ f ++ " " ++ (show (rhsf n))

induceResultIS f n = (show (lhsf n)) ++ " " ++ f ++ " " ++ (show (2* rhsfIS))
    where
        rhsfIS = rhsf (n-1)


mainf f n = do
  putStrLn $ "step for n: " ++ "\t" ++ (induceResult f n)
  putStrLn $ "step for n-1: " ++ "\t" ++ (induceResultIS f n)
