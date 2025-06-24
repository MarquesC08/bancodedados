--criação da base de dados
CREATE database aula16;

--criação de tabelas
CREATE TABLE categoria (
categoria_id serial,
nome varchar(20) ,
ultima_atualização timestamp
);

CREATE TABLE filme_categoria (
filme_id int,
categoria_id int,
ultima_atualizacao timestamp
);

CREATE TABLE filme (
filme_id serial,
titulo varchar (35),
descricao text,
ano_lancamento char (4),
linguagem_id int,
duracao_aluguel int,
preco_aluguel numeric(4,2), 
duracao int, 
multa NUMERIC (4,2),
classificacao_indicativa int,
ultima_atualizacao timestamp,
ocasiao_especial text,
sinopse text
);

CREATE TABLE linguagem (
linguagem_id serial,
nome varchar (20),
ultima_atualizacao timestamp
);

CREATE TABLE ator_filme (
ator_id int,
filme_id int,
ultima_atualizacao timestamp
);

CREATE TABLE inventario (
inventario_id serial,
filme_id int,
loja_id int,
ultima_atualizacao timestamp
);

CREATE TABLE aluguel (
aluguel_id serial,
data_aluguel timestamp,
inventario_id int,
cliente_id int,
data_retorno timestamp,
funcionario_id int,
);

CREATE TABLE pagamento (
pagamento_id serial,
cliente_id int,
funcionario_id int,
aluguel_id int,
preco numeric(4,2),
data_pagamento timestmp
);

CREATE TABLE funcionario (
funcionario_id serial,
primeiro_nome varchar(20),
ultimo_nome varchar(20),
endereco_id int,
email varchar(60),
senha char(7),
usuario varchar(20),
loja_id int,
ativo bool,
ultima_atualizacao timestamp,
foto bytea
);

CREATE TABLE ator (
ator_id serial,
primeiro_nome varchar(20)
ultimo_nome varchar(20)
ultima_atualizacao timestamp
);

CREATE TABLE cliente (
cliente_id serial,
loja_id int,
primeiro_nome varchar(20),
ultimo_nome(20),
endereco_id int,
email varchar (60),
data_criacao timestamp,
ultima_atualizacao timestamp,
ativo bool
);

CREATE TABLE cidade (
cidade_id serial,
cidade varchar(30),
pais_id int,
ultima_atualizacao timestamp
);

CREATE TABLE pais (
pais_id serial,
pais varchar (20),
ultima_atualizacao timestamp
);

CREATE TABLE loja (
loja_id serial,
chefe_equipe_id int,
endereco_id int,
ultima_atualizacao timestamp
);

--remover coluna
ALTER TABLE loja DROP COLUMN ultima atualizacao;

--adicionar coluna
ALTER TABLE loja ADD dolumn ultima_atualizacao timestamp;

--renomear coluna
ALTER TABLE loja RENAME COLUMN ult_atual

--alterar o tipo de dado da coluna
ALTER TABLE loja ALTER COLUMN ultima_atualizacao
SET DATA TYPE timestamp;

--criacao de chaves primárias
ALTER TABLE categoria ADD PRIMARY KEY (categoria_id);
ALTER TABLE filme ADD PRIMARY KEY (filme_id);
ALTER TABLE linguagem ADD PRIMARY KEY (linguagem_id);
ALTER TABLE inventario ADD PRIMARY KEY (inventario_id);
ALTER TABLE pais ADD PRIMARY KEY (pais_id);
ALTER TABLE ator ADD PRIMARY KEY (ator_id);
ALTER TABLE cidade ADD PRIMARY KEY (cidade_id);
ALTER TABLE loja ADD PRIMARY KEY (loja_id);
ALTER TABLE pagamento ADD PRIMARY KEY (pagamento_id);
ALTER TABLE endereco ADD PRIMARY KEY (endereco_id);
ALTER TABLE cliente ADD PRIMARY KEY (cliente_id);
ALTER TABLE funcionario ADD PRIMARY KEY (funcionario_id);
ALTER TABLE aluguel ADD PRIMARY KEY (aluguel_id);

--criação de chaves estrangeiras
ALTER TABLE filme_categoria
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria_id)
REFERENCES categoria(categoria_id)

ALTER TABLE filme_categoria
ADD CONSTRAINT fk_filme
FOREIGN KEY (filme_id)
REFERENCES filme(filme_id);

ALTER TABLE filme 
ADD CONSTRAINT fk_linguagem
FOREIGN KEY (linguagem_id)
REFERENCES linguagem(linguagem_id);

ALTER TABLE ator_filme
ADD CONSTRAINT fk_ator
FOREIGN KEY (ator_id)
REFERENCES ator(ator_id);

ALTER TABLE ator_filme 
ADD CONSTRAINT fk_filme
FOREIGN KEY (filme_id)
REFERENCES filme(filme_id);

ALTER TABLE inventario --tabela que possui a chave estrangeira
ADD CONSTRAINT fk_filme --adiciona restrição na tabela a ser alterada
FOREIGN KEY (filme_id) --define chave estrangeira na tabela a ser alterada
REFERENCES filme(filme_id); --referencia a tabela que possui a chave primária

ALTER TABLE aluguel 
ADD CONSTRAINT fk_inventario
FOREIGN KEY (inventario_id)
REFERENCES inventario (inventario_id)

ALTER TABLE aluguel
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_id)
REFERENCES funcionario(funcionario_id);

ALTER TABLE pagamento
ADD CONSTRAINT fk_aluguel
FOREIGN KEY (aluguel_id)
REFERENCES aluguel(aluguel_id);

ALTER TABLE pagamento
ADD CONSTRAINT fk_funcionario
foreign KEY (funcionario_id)
REFERENCES funcionario(funcionario_id);

ALTER TABLE funcionario
ADD CONSTRAINT fk_loja
FOREIGN key
