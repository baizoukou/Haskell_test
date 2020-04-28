module Model where
import Data.List (sort, nub, group)

type Candidate = String
data Vote = Vote { _candidate :: Candidate, _order :: Int } deriving Show

-- Duplicates are eliminated by order
instance Eq Vote where
  (Vote _ n) == (Vote _ m) = n == m

instance Ord Vote where
  (Vote _ n) <= (Vote _ m) = n <= m

-- A vote is null if the order is zero
nullVote :: Vote -> Bool
nullVote (Vote _ n) = n == 0

-- Only consecutive elements are accepted
onlyConsecutives :: [Vote] -> [Vote]
onlyConsecutives =
    map snd 
  . filter (\(n, v) -> n == _order v)
  . zip [1..]

-- Only not blank votes are accepted
onlyNotBlankVotes :: [Vote] -> [Vote]
onlyNotBlankVotes = filter (not . nullVote)

-- Only non-duplicates orders are accepted
removeDuplicates :: [Vote] -> [Vote]
removeDuplicates = concat . filter ((== 1) . length) . group

orderByVotes :: [Candidate] -> [Int] -> [Candidate]
orderByVotes candidates orders =
    map _candidate -- get only candidates names
  . onlyConsecutives -- remove non-consecutive vote orders
  . removeDuplicates -- remove duplicated vote orders
  . onlyNotBlankVotes -- remove blank vote orders
  . sort -- order by the input's ordering
  . zipWith Vote candidates -- possible candidates
  $ orders -- votes

-- given a list of votes and a list of candidates
-- returns a list of those candidates ordered by the votes
computeVotes :: [[Int]] -> [Candidate] -> [[Candidate]]
computeVotes votes candidates = map (orderByVotes candidates) votes
