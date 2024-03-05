module TestBug.Data where

import qualified Streamly.Data.Stream as Stream

import TestBug


getParsedStream :: MyParser -> Int -> StreamOfUnit
getParsedStream parser howmany = buffer (parser 1 undefined)
  where
    -- we pass 0 to this function, but manually
    -- simplifying it away makes the bug disappear
    buffer s = if howmany > 0 then Stream.take howmany s else s
    -- buffer s = s
