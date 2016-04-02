import Samba

main = interact $ unlines . map dpass . (takeWhile (/="")) . lines
