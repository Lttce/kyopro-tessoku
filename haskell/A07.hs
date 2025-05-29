-- A07 - Event Attendance 

import Control.Monad
import Data.Array

readInts :: IO [Int]
readInts = map read . words <$> getLine

solve :: Int -> [[Int]] -> [Int]
solve d lrs =
    let update = concatMap (\[l, r] -> [(l, 1), (r+1, -1)]) lrs
        imos = accumArray (+) 0 (1, d+1) update
        cumSum = scanl1 (+) (elems imos)
    in take d cumSum

main :: IO ()
main = do
    d <- readLn
    n <- readLn
    lr <- replicateM n $ readInts
    mapM_ print $ solve d lr
