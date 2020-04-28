import CleaningResults
import Lib (solve)

toCsvFilepath :: String -> String
toCsvFilepath name = "test/samples/" ++ name ++ ".csv"

testCases :: [String]
testCases = map (("sampleuk" ++) . show) [1..6]

files :: [String]
files = map toCsvFilepath testCases

printTestResult (testCase, result) =
  print $ "Testing " ++ testCase ++ ", result: " ++ (if result then "OK" else "FAILED")

main :: IO ()
main = do
  samples <- mapM readFile files
  let solutions = map solve samples
  mapM_ printTestResult $ zip testCases (zipWith (==) solutions expectedResuls)
