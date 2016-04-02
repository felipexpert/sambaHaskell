module Samba where

import Data.Char (ord, isLetter, isUpper)
import Data.Maybe (fromJust)

dpass :: String -> String
dpass = password 3

password :: Int -> String -> String
password letters username = concat . map (show . fromJust . letterPos) $ initialLetters
  where initialLetters = take letters . filter isLetter $ username 

letterPos :: Char -> Maybe Int
letterPos c | isLetter c = Just $ code c
            | otherwise = Nothing
  where code c | isUpper c = n - 64
               | otherwise = n - 96
          where n = ord c
