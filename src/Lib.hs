module Lib where

import Parser (parseInput)
import Model (Candidate, computeVotes)

-- Input: contents of a csv file
-- Output: results of the voting
solve :: String -> [[Candidate]]
solve input = uncurry computeVotes (parseInput input)