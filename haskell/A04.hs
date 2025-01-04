-- A04 - Binary Representation 1
-- https://atcoder.jp/contests/tessoku-book/tasks/tessoku_book_d

main :: IO()
main = do
    n <- readLn :: IO Int
    putStrLn $ solve n

solve :: Int -> String
solve x = pad ++ bin
    where
        bin = toBin x
        pad = replicate (10 - length bin) '0'

toBin :: Int -> String
toBin 0 = ""
toBin x = reverse $ toBin' x
    where
        toBin' 0 = ""
        toBin' y = let (r, q) = divMod y 2 in  show q ++ toBin' r
