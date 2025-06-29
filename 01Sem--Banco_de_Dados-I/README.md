# ATIVIDADE DE BANCO DE DADOS I - PRIMEIRO SEMESTRE

## Esta atividade foi composta por três etapas principais:
1. Construção do modelo conceitual e lógico.
2. Normalização do modelo.
3. Criação do modelo físico utilizando MySQL.

## Cenário da Atividade
Foi considerado o seguinte cenário:

Uma biblioteca de uma faculdade deseja manter informações sobre seus livros. Inicialmente, quer armazenar para os livros as seguintes características: ISBN, titulo, ano editora e autores deste livro. Para os autores, deseja manter: código, nome e nacionalidade. Cabe salientar que um autor pode ter vários livros, assim como um livro pode ser escrito por vários autores. Cada livro da biblioteca pertence a uma categoria. A biblioteca deseja manter um cadastro de todas as categorias existentes, com informações como: código da categoria e descrição. Uma categoria pode ter vários livros associados a ela.  A biblioteca também que manter a relação de usuário com as informações: matricula, nome, telefone. E também registrar as locações de livros dos usuários indicando a data de locação e data de devolução. Um usuário pode pegar vários livros ao mesmo tempo, não existe limite.

## Modelo Conceitual
O modelo conceitual desenvolvido para este cenário pode ser visualizado abaixo:

![Modelo conceitual](https://i.imgur.com/j9sKigc.png)

Para melhor visualização da atividade, criei um passo a passo logo a baixo: 

## Como Executar o Projeto (Com Docker)

Para facilitar a execução e replicação do ambiente de banco de dados, este projeto inclui um script que automatiza a instalação do Docker Engine e o deploy de uma instância MySQL com o esquema do banco de dados já importado.

**Recomendação:** É **altamente recomendado** executar este projeto dentro de uma VM com Ubuntu Server, especialmente devido à natureza do script de instalação do Docker. Isso garante um ambiente limpo e isolado, evitando potenciais conflitos com sua máquina host.

### Pré-requisitos:
* Um sistema operacional baseado em Ubuntu (o script de instalação do Docker segue a documentação oficial para Ubuntu Server).
* Docker (será instalado automaticamente pelo script).

### Passos para Configuração e Execução:

1.  **Instalar Docker e Iniciar o Contêiner:**
    Execute o script `run_script-instalacao-docker.sh` no terminal da sua VM. Este script irá:
    * Atualizar os pacotes do sistema.
    * Instalar o Docker Engine, Docker CLI e Docker Compose Plugin.
    * Adicionar seu usuário ao grupo `docker` (o script já irá execultar o comando `newgrp docker` para que as alterações de grupo tenham efeito imediato sem reiniciar).
    * Iniciar um contêiner MySQL usando o `docker-compose.yaml`, onde o script SQL (`Script_SQL_Atividade_Avaliativa_IV.sql`) será automaticamente importado para o banco de dados.

    ```bash
    ./run_script-instalacao-docker.sh
    ```

    *Obs.: O script de instalação do Docker segue fielmente os comandos da documentação oficial para a versão do Ubuntu Server. Talvez seja necessario alterar as permições do arquivo antes de execulta-lo*
    ```chmod +x run_script-instalacao-docker.sh
    ```

2.  **Acessar o Banco de Dados:**
    Após a execução do script e a inicialização do contêiner, o servidor MySQL estará disponível na porta `3306` dentro da sua VM. Você pode se conectar utilizando as seguintes credenciais:
    * **Host:** `localhost` (ou o IP da VM, se acessando de fora dela)
    * **Porta:** `3306`
    * **Usuário:** `root`
    * **Senha:** `root`

    Você pode verificar se o contêiner está em execução com o comando:
    ```bash
    docker ps
    ```

3.  **Parar e Remover o Contêiner (Opcional):**
    Quando terminar de usar o banco de dados, você pode parar e remover o contêiner com os seguintes comandos no diretório onde o `docker-compose.yaml` está localizado:
    ```bash
    docker compose down
    ```
