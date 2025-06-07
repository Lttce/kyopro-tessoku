-- A09 - Winter in ALGO Kingdom

import Control.Monad
import Data.Array
import qualified Data.ByteString.Char8 as B

readInts :: IO [Int]
readInts = map (fst . fromJust . B.readInt) . B.words <$> B.getLine
  where
    fromJust (Just x) = x
    fromJust Nothing = error "readInts failed"

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

main :: IO ()
main = do
    [h, w, n] <- readInts
    as <- replicateM n $ do
        [a, b, c, d] <- readInts
        return (a, b, c, d)
    let updates = concatMap (\(a, b, c, d) -> [((a, b), 1::Int),((a, d+1), -1), ((c+1, b), -1), ((c+1, d+1), 1)]) as
        q = accumArray (+) 0 ((1, 1), (h+1, w+1)) updates
        q' = chunksOf (w+1) (elems q)
        z = scanl1 (zipWith (+)) $ map (scanl1 (+)) q'
        z' = map (take w) (take h z)
    mapM_ (putStrLn . unwords . map show) z'
    
