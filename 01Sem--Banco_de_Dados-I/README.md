# ATIVIDADE DE BANCO DE DADOS I - PRIMEIRO SEMESTRE

Esta atividade foi composta por três etapas principais:
1. Construção do modelo conceitual e lógico.
2. Normalização do modelo.
3. Criação do modelo físico utilizando MySQL.

# Foi considerado o seguinte cenário: 
Uma biblioteca de uma faculdade deseja manter informações sobre seus livros. Inicialmente, quer armazenar para os livros as seguintes características: ISBN, titulo, ano editora e autores deste livro. Para os autores, deseja manter: código, nome e nacionalidade. Cabe salientar que um autor pode ter vários livros, assim como um livro pode ser escrito por vários autores. Cada livro da biblioteca pertence a uma categoria. A biblioteca deseja manter um cadastro de todas as categorias existentes, com informações como: código da categoria e descrição. Uma categoria pode ter vários livros associados a ela.  A biblioteca também que manter a relação de usuário com as informações: matricula, nome, telefone. E também registrar as locações de livros dos usuários indicando a data de locação e data de devolução. Um usuário pode pegar vários livros ao mesmo tempo, não existe limite.

O modelo conceitual ficou dessa forma:
![Modelo conceitual](https://i.imgur.com/j9sKigc.png)

Ao executar o arquivo "run_script", será realizada a instalação do pacote Docker Engine. Em seguida, um docker-compose será iniciado para realizar o deploy de uma imagem do MySQL. Nessa imagem, será importado um script .sql contendo as informações referente a atividade "03 - Modelo Físico".
