-- A08 - Two Dimensional Sum

import qualified Data.ByteString.Char8 as B
import Data.Array
import Control.Monad

readInts :: IO [Int]
readInts = map (fst . fromJust . B.readInt) . B.words <$> B.getLine
  where
    fromJust (Just x) = x
    fromJust Nothing = error "readInts failed"

main :: IO ()
main = do
    [h, w] <- readInts
    x <- replicateM h $ readInts

    let flatx = concat x
        idxs = [(i, j) | i <- [1..h], j <- [1..w]]
        arr = accumArray (+) 0 ((0, 0), (h, w)) (zip idxs flatx)
        
        db = array ((0, 0), (h, w)) [((i, j), calc i j) | i <- [0..h], j <- [0..w]]
            where
                calc 0 _ = 0
                calc _ 0 = 0
                calc i j = arr!(i, j) + db!(i-1, j) + db!(i, j-1) - db!(i-1, j-1)

    q <- readLn
    replicateM_ q $ do 
        [a, b, c, d] <- readInts
        let s = db!(c, d) + db!(a-1, b-1) - db!(a-1, d) - db!(c, b-1)
        print s
