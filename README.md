# Trabalho LP - similaridade de código (Haskell)

Trabalho da disciplina de Linguagens de Programação: comparar dois arquivos
de código com uma ideia parecida com Bag-of-Words, usando Haskell.

O `Main.hs` por enquanto só declara o que vamos precisar e o programa já abre
os quatro arquivos da linha de comando.

## Pastas

- `Main.hs` - programa
- `Makefile` - pra compilar sem ter que decorar o comando do ghc
- `exemplos/` - `res.txt`, `sep.txt`, `c1.hs`, `c2.hs` pra testar

## Compilar

Precisa do GHC instalado. No Linux (ou WSL):

```
make build
```

Se não tiver `make`:

```
ghc --make Main.hs -o sim
```

## Rodar

```
./sim exemplos/res.txt exemplos/sep.txt exemplos/c1.hs exemplos/c2.hs
```

Ordem dos argumentos: reservadas, separadores, código 1, código 2.

## O que o enunciado pede no fim

Frequência das palavras do `c1` (ordenado), reservadas com peso 2, ignorar o
que estiver em `sep`, e um número de similaridade entre os dois códigos
(regra do 10% e divisão pela soma das frequências do `c1`).
