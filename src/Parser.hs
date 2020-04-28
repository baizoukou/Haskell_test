module Parser where

import Model (Candidate)

-- given a char, split the string into sublists
split :: Char -> String -> [String]
split sep [] = []
split sep [c] = [[c]]
split sep (c:cs) =
  if sep == c
     then [] : split sep cs
     else add c (split sep cs)
  where add c [] = []
        add c (r:rs) = (c:r):rs

parseOrd :: String -> Int
parseOrd ""  = 0
parseOrd "*" = 0
parseOrd s   = read s :: Int

parseVotes :: [[String]] -> [[Int]]
parseVotes = map (map parseOrd) . tail

parseCandidates :: [[String]] -> [Candidate]
parseCandidates = filter (not . null) . head

splitRows :: [String] -> [[String]]
splitRows = map (drop 2 . split ',')

parseInput :: String -> ([[Int]], [Candidate])
parseInput input = (votes, candidates)
    where
      rows        = splitRows . lines $ input
      candidates  = parseCandidates rows
      votes       = filter (not . all (== 0)) (parseVotes rows)