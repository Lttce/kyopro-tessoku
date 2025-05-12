-- A06 - How Many Guests?

import Control.Monad
import Data.Array (Array, listArray, (!))
import Data.List (scanl')

readInts = map read . words <$> getLine

main :: IO()
main = do
    [n, q] <- readInts
    a <- readInts
    let acm = listArray (0, n) (scanl' (+) 0 a)
    replicateM_ q $ do
        [l, r] <- readInts
        print $ solve acm l r

solve :: Array Int Int -> Int -> Int -> Int
solve acm l r = acm ! r - acm ! (l-1)
