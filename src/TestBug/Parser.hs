module TestBug.Parser where

-- import Debug.Trace (trace)
-- tracing the parser name as commented below
-- makes the bug go away (making it a Heisenbug)

import TestBug

import qualified TestBug.Parser.One
import qualified TestBug.Parser.Two


getParser :: MyParserName -> MyParser
-- getParser name = case trace (showParserName name) name of
getParser name = case name of
    -- uncommenting the next line makes the bug disappear
    -- A -> TestBug.Parser.Two.parse1
    B -> TestBug.Parser.One.parse1
    C -> TestBug.Parser.Two.parse1
    D -> TestBug.Parser.Two.parse1
    E -> TestBug.Parser.Two.parse1
    F -> TestBug.Parser.Two.parse1
    G -> undefined
    H -> TestBug.Parser.Two.parse1
    I -> TestBug.Parser.Two.parse1
    -- uncommenting the next line makes the bug disappear
    -- J -> TestBug.Parser.Two.parse1

showParserName :: MyParserName -> String
showParserName A = "A"
showParserName B = "B"
showParserName C = "C"
showParserName D = "D"
showParserName E = "E"
showParserName F = "F"
showParserName G = "G"
showParserName H = "H"
showParserName I = "I"
showParserName J = "J"
