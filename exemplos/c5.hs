module Exemplo5 where

filtrarPares :: [Int] -> [Int]
filtrarPares lista =
    case lista of
        [] -> []
        (x:xs) ->
            if x `mod` 2 == 0
                then x : filtrarPares xs
                else filtrarPares xs

maiorValor :: [Int] -> Int
maiorValor lista =
    case lista of
        [] -> 0
        [x] -> x
        (x:xs) ->
            let maiorResto = maiorValor xs
            in if x > maiorResto
                then x
                else maiorResto

main :: IO ()
main = do
    let numeros = [8, 3, 10, 5, 2, 7]
    let pares = filtrarPares numeros
    let maior = maiorValor numeros
    putStrLn ("Pares: " ++ show pares)
    putStrLn ("Maior valor: " ++ show maior)