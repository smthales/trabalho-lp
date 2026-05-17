module Exemplo6 where

contarPositivos :: [Int] -> Int
contarPositivos lista =
    case lista of
        [] -> 0
        (x:xs) ->
            if x > 0
                then 1 + contarPositivos xs
                else contarPositivos xs

converterTemperatura :: Double -> Double
converterTemperatura celsius =
    let fahrenheit = celsius * 1.8 + 32
    in fahrenheit

calcularDesconto :: Double -> Double
calcularDesconto preco =
    if preco > 100
        then preco * 0.9
        else preco

main :: IO ()
main = do
    let valores = [-2, 5, 0, 12, -7, 3]
    let positivos = contarPositivos valores
    let temperatura = converterTemperatura 25.0
    let precoFinal = calcularDesconto 150.0
    putStrLn ("Positivos: " ++ show positivos)
    putStrLn ("Temperatura em Fahrenheit: " ++ show temperatura)
    putStrLn ("Preco final: " ++ show precoFinal)