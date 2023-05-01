# Projeto final - Administrador de Banco de Dados - SENAC

## Sobre o projeto
### :game_die: Banco de dados para um aplicativo de marcação e organização de filmes :clapper:
Para entrar no aplicativo, primeiro é necessário fazer o cadastro, que será usado para fazer o login na conta. Feito isso, é possível escolher os filmes que você já assistiu e guardar em sua biblioteca para ter a organização do que foi ou não assistido. Há, também, uma opção de marcar o filme para assistir depois, caso não tenha visto. No aplicativo será possível buscar todos os filmes em que um ator ou atriz participou, ou seja, além da base de dados dos filmes, terá também uma tabela somente das pessoas envolvidas, como diretor e elenco. Há uma tabela só para armazenar comentários dos usuários nos filmes, que funciona como um fórum.
- Um login só está atrelado a uma conta, e uma conta está em um login só. 
- Nas listas de assistido, favorito e assistir depois podem ter vários filmes como nenhum. 
- Um filme possui somente um diretor, mas um diretor possui de um a vários filmes. 
- Um filme possui de um a vários gêneros, e um gênero está em um a vários filmes, assim acontece com os idiomas presentes no filme. 
- Há uma tabela somente de países, no qual pode-se escolher o país de origem do filme como o local de nascença do elenco. 
- Tabelas de log do login e conta, para armazenar mudanças de senha do login e de inserts na tabela conta.

## Dados do banco:
Foram criados:
- 2 procedures;
- 2 triggers;
- 2 views;
- 2 functions;

Estão armazenados:
- 9 diretores;
- 10 filmes;
- 74 atores/atrizes;

## Modelo conceitual:
![projetoFinalConceitual](https://user-images.githubusercontent.com/81472166/235458764-d509af0a-6f3f-4db7-8210-364654aebbba.PNG)

## Modelo lógico:
![projetoFinalLogico](https://user-images.githubusercontent.com/81472166/235458777-7a76ed8a-62f6-4592-92ca-e64ed1222c34.PNG)
