-- A01 - The First Problem
-- https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_a
main :: IO()
main = do
    n <- readLn :: IO Int
    print $ solve n

solve :: Int -> Int
solve x = x * x
