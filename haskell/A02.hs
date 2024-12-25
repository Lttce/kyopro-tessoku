-- A02 - Linear Search
-- https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_b
main :: IO()
main = do
    [_, x] <- map read . words <$> getLine :: IO [Int]
    a <- map read . words <$> getLine :: IO [Int]
    putStrLn $ solve x a

solve :: Int -> [Int] -> String
solve x ys
    | x `elem` ys = "Yes"
    | otherwise   = "No"
