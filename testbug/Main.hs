module Main where

import qualified Streamly.Data.Stream as Stream

import TestBug.Data
import TestBug.Parser
import TestBug

import System.Environment (getArgs)


-- removing the strictness annotation
-- makes the bug go away
data App = App !MyParserName
-- data App = App MyParserName

main :: IO ()
main = do
    options <- parseCli
    putStrLn $ "parser: " ++ showParserName options
    run (App options)

run :: App -> IO ()
run (App parserName) = go
  where
    parser = getParser parserName
    howmany = 0
    aStream = getParsedStream parser howmany

    go = do
      result <- Stream.toList aStream
      putStrLn $ if length result == 0 then "OK" else "NO"

parseCli :: IO MyParserName
parseCli = parseParserName <$> getArgs
  where
    parseParserName ["A"] = A
    parseParserName ["B"] = B
    parseParserName ["C"] = C
    parseParserName ["D"] = D
    parseParserName ["E"] = E
    parseParserName ["F"] = F
    parseParserName ["G"] = G
    parseParserName ["H"] = H
    parseParserName ["I"] = I
    parseParserName ["J"] = J
    parseParserName _ = error "requires one arg: [A-J]"
