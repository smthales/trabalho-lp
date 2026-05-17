module Exemplo4 where

calcula :: Int -> Int
calcula n =
    if n > 10
        then dobro n
        else soma n 2

dobro :: Int -> Int
dobro y = y + y

soma :: Int -> Int -> Int
soma a b = a + b

triplo :: Int -> Int
triplo z = z + z + z

main :: IO ()
main = do
    let valor = calcula 10
    let final = soma valor 7
    putStrLn (show final)
