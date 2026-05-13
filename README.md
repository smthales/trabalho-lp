# Trabalho LP - similaridade de codigo (Haskell)

Trabalho da disciplina de Linguagens de Programacao: comparar dois arquivos
de codigo com uma ideia parecida com Bag-of-Words, usando Haskell.

O `Main.hs` por enquanto so declara o que vamos precisar e o programa ja abre
os quatro arquivos da linha de comando. O resto a gente vai codando aos poucos.

## Pastas

- `Main.hs` - programa
- `Makefile` - pra compilar sem ter que decorar o comando do ghc
- `exemplos/` - `res.txt`, `sep.txt`, `c1.hs`, `c2.hs` pra testar

## Compilar

Precisa do GHC instalado. No Linux (ou WSL):

```
make build
```

Se nao tiver `make`:

```
ghc --make Main.hs -o sim
```

## Rodar

```
./sim exemplos/res.txt exemplos/sep.txt exemplos/c1.hs exemplos/c2.hs
```

Ordem dos argumentos: reservadas, separadores, codigo 1, codigo 2.

## O que o enunciado pede no fim

Frequencia das palavras do `c1` (ordenado), reservadas com peso 2, ignorar o
que estiver em `sep`, e um numero de similaridade entre os dois codigos
(regra do 10% e divisao pela soma das frequencias do `c1`).
