module TestBug where

import qualified Streamly.Data.Stream as Stream
import System.IO (Handle)


data MyParserName =
                      A | B | C | D | E |
                      F | G | H | I | J

type StreamOfUnit = Stream.Stream IO ()
type MyParser = Int -> Handle -> StreamOfUnit
