module Exemplo3 where

calcula :: Int -> Int
calcula n =
    if n > 10
        then dobro n
        else soma n 1

dobro :: Int -> Int
dobro x = x + x

soma :: Int -> Int -> Int
soma a b = a + b

main :: IO ()
main = do
    let valor = calcula 10
    let outro = soma valor 5
    putStrLn (show outro)
