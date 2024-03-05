module TestBug.Parser.One where

import qualified Streamly.Data.Stream as Stream

import TestBug


parse1 :: MyParser
parse1 x _handle = Stream.nilM (if x == 0 then pure () else pure ())
