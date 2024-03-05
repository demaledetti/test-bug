module TestBug.Parser.Two where

import qualified Streamly.Data.Stream as Stream

import TestBug


parse1 :: MyParser
parse1 _x = Stream.unfoldrM (const (pure Nothing))
