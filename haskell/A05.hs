-- A05 - Three Cards
-- https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_e

main :: IO()
main = do
    [n, k] <- map read . words <$> getLine
    print $ length $ solve n k

solve :: Int -> Int -> [(Int, Int, Int)]
solve n k = cs
    where
        cs = [(r, b, w) | r <- [1..n], b <- [1..n], let w = k-r-b, 1 <= w, w <=n]
