module Main where

import Lib

main :: IO ()
main = startApp

lol :: [Int]
lol = concat $ map (*2) [1, 2]
