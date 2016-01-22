# GSAN Migrações
Projeto contendo a criação e evolução do banco de dados do GSAN

## Instalar o Java 6
    sudo apt-get -y install openjdk-6-jdk

## Instalar Git e Unzip
    sudo apt-get -y install git unzip 

## Instalar o PostgreSQL
* [Página da Wiki](https://github.com/prodigasistemas/gsan/wiki/Instala%C3%A7%C3%A3o-07-PostgreSQL)

## Instalar o mybatis-migrations
* [Página da Wiki](https://github.com/prodigasistemas/gsan/wiki/Criando-Migra%C3%A7%C3%B5es-na-Base-de-Dados#instalar-pelo-console-do-linux)

## Fazer o download do projeto
    git clone https://github.com/prodigasistemas/gsan-migracoes.git
    
**Obs.:** A primeira migração deve ser feita para o banco de dados gsan_comercial

## Configurar a conexão com o banco de dados gsan_comercial
    cd gsan-migracoes/comercial
    
    cp environments/development.exemplo.properties environments/development.properties

    vim environments/development.properties
      script_char_set=LATIN1
      url=jdbc:postgresql://[endereço-do-servidor-de-banco-de-dados]:5432/gsan_comercial
      username=[USUARIO]
      password=[SENHA]

## Executar as migrações para o banco de dados gsan_comercial
    migrate status

    migrate up

## Configurar a conexão com o banco de dados gsan_gerencial
    cd gsan-migracoes/gerencial
    
    cp environments/development.exemplo.properties environments/development.properties

    vim environments/development.properties
      script_char_set=LATIN1
      url=jdbc:postgresql://[endereço-do-servidor-de-banco-de-dados]:5432/gsan_gerencial
      username=[USUARIO]
      password=[SENHA]

## Executar as migrações para o banco de dados gsan_gerencial
    migrate status

    migrate up
