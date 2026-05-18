{- HLINT ignore "Eta reduce" -}
module Main where

import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)
import Data.List (sortBy)
import System.Environment (getArgs)
import System.Exit (exitFailure)

tokenize :: [Char] -> String -> [String]
tokenize seps texto =
    words textoComEspacos
  where
    textoComEspacos = map trocaSeparador texto

    trocaSeparador :: Char -> Char
    trocaSeparador c
        | c `elem` seps = ' '
        | otherwise     = c

countFreq :: [String] -> [String] -> Map String Int
countFreq reservadas tokens = foldl contar Map.empty tokens
  where
    contar mapa palavra =
        Map.insertWith (+) palavra peso mapa
      where
        peso =
            if palavra `elem` reservadas
                then 2
                else 1

similarity :: Map String Int -> Map String Int -> Double
similarity freq1 freq2
    | somaF1 == 0 = 0
    | otherwise  = fromIntegral m / fromIntegral somaF1
  where
    listaF1 = Map.toList freq1
    somaF1 = sum (Map.elems freq1)

    m = sum (map contribuicao listaF1)

    contribuicao :: (String, Int) -> Int
    contribuicao (palavra, f1) =
        if dentroDe10PorCento f1 f2
            then f1
            else 0
      where
        f2 = Map.findWithDefault 0 palavra freq2

    dentroDe10PorCento f1 f2 =
        abs (fromIntegral f1 - fromIntegral f2) <= 0.1 * fromIntegral f1

sortedReport :: Map String Int -> [(String, Int)]
sortedReport freq =
    sortBy comparar (Map.toList freq)
  where
    comparar (p1, f1) (p2, f2)
        | f1 /= f2  = compare f2 f1
        | otherwise = compare p1 p2

printReport :: [(String, Int)] -> Double -> IO ()
printReport relatorio sim = do
    putStrLn "Relatorio de frequencias de c1:"
    putStrLn "palavra frequencia"
    mapM_ imprimirLinha relatorio
    putStrLn ""
    putStrLn ("m/soma(f1) = " ++ show sim)
    putStrLn ("Similaridade = " ++ show (sim * 100) ++ "%")
  where
    imprimirLinha (palavra, freq) =
        putStrLn (palavra ++ " " ++ show freq)

main :: IO ()
main = do
    args <- getArgs

    case args of
        [resFile, sepFile, c1File, c2File] -> do
            resContent <- readFile resFile
            sepContent <- readFile sepFile
            c1Content  <- readFile c1File
            c2Content  <- readFile c2File

            let reservadas = words resContent

            let separadores =
        --Pode tirar filtro se nao quiser tratar espaco, quebra de linha, tabulacao, \r OU se separadores já estiverem no formato correto
                    filter (`notElem` [' ', '\n', '\t', '\r']) sepContent

            let tokens1 = tokenize separadores c1Content
            let tokens2 = tokenize separadores c2Content

            let freq1 = countFreq reservadas tokens1
            let freq2 = countFreq reservadas tokens2

            let relatorio = sortedReport freq1
            let sim = similarity freq1 freq2

            printReport relatorio sim
        --Mensagem para avisar que rodou incorretamente em relação aos parametros 
        _ -> do 
            putStrLn "Uso:"
            putStrLn "runghc Main.hs res.txt sep.txt cX.hs cY.hs"
            putStrLn ""
            putStrLn "Exemplo:"
            putStrLn "runghc Main.hs exemplos/res.txt exemplos/sep.txt exemplos/cX.hs exemplos/cY.hs"
            exitFailure