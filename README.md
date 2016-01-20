# GSAN Migrações
Projeto contendo a criação e evolução do banco de dados do GSAN

## Instalar o Java 6
		sudo apt-get install openjdk-6-jdk

## Instalar o PostgreSQL
* [Página da Wiki](https://github.com/prodigasistemas/gsan/wiki/Instala%C3%A7%C3%A3o-07-PostgreSQL)

## Instalar o mybatis-migrations
* [Página da Wiki](https://github.com/prodigasistemas/gsan/wiki/Criando-Migra%C3%A7%C3%B5es-na-Base-de-Dados)

## Fazer o download do projeto
    git clone git@github.com:prodigasistemas/gsan-migracoes.git

    cd gsan-migracoes/migracoes

## Configurar a conexão com o banco de dados
    cp enviroments/development.exemplo.properties enviroments/development.properties

    vim enviroments/development.properties
      script_char_set=LATIN1
      url=jdbc:postgresql://[endereço-do-servidor-de-banco-de-dados]:5432/gsan_comercial
      username=[USUARIO]
      password=[SENHA]

## Executar as migrações
    migrate status

    migrate up
