module Main where

import System.Environment
import Lib (solve)

main :: IO ()
main = do
  args <- getArgs
  if null args
     then print "Please give a valid csv filename"
     else do
       input <- readFile (args !! 0)
       mapM_ print (solve input)
