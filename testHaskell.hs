main :: IO ()
main = putStrLn "Rodou programa Haskell!"

{-
Comandos úteis no terminal do VSCode:

1) Entrar na pasta do trabalho:
EXEMPLO
cd "D:\Documentos SSD\GitHubSSD\trabalho-lp"

2) Rodar direto, sem gerar .exe:
runghc testHaskell.hs

3) Rodar com parâmetros:
runghc Main.hs res.txt sep.txt c1.hs c2.hs

4) Compilar:
ghc Main.hs -o sim

4.1) Compilar e organizar em pasta
mkdir build //criar pasta build
ghc Main.hs -outputdir build -o build\sim

5) Rodar o executável:
.\sim.exe

5.1) Rodar o executável em pasta:
.\build\sim.exe

6) Rodar executável com parâmetros:
.\sim.exe res.txt sep.txt c1.hs c2.hs

Obs: se mudar o código, compile de novo com ghc.
-}