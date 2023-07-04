-- FUNÇÕES

SELECT VALOR, CONCAT('R$', VALOR) FROM PEDIDO

-- CASAS DÉCIMAIS

SELECT VALOR, CONCAT('R$', round(CAST(VALOR as numeric) ,2)) FROM PEDIDO

-- CRIANDO UMA FUNÇÃO

CREATE FUNCTION formata_moeda(valor float) RETURNS varchar(20) LANGUAGE plpgsql AS
$$
BEGIN
    RETURN CONCAT('R$', ROUND(CAST(valor AS numeric), 2));
END;
$$;

-- CHAMANDO FUNÇÃO
SELECT VALOR, FORMATA_MOEDA (VALOR) FROM PEDIDO
SELECT VALOR, FORMATA_MOEDA (VALOR) FROM PRODUTO

-- OUTRA FUNÇÃO

CREATE FUNCTION get_nome_by_id(idc integer) RETURNS varchar(50) LANGUAGE plpgsql AS
$$
DECLARE r varchar(50);
BEGIN
    SELECT nome INTO r FROM cliente WHERE idcliente = idc;
    RETURN r;
END;
$$;

SELECT DATA_PEDIDO, VALOR, idcliente, get_nome_by_id (idcliente) FROM PEDIDO

--Exercícios funções

--1. Crie uma função que receba como parâmetro o ID do pedido e retorne o valor total deste pedido
SELECT * FROM PEDIDO
CREATE OR REPLACE FUNCTION get_valor_pedido (idpdd integer) returns varchar (20) language plpgsql as 
$$
BEGIN
	RETURN (SELECT FORMATA_MOEDA(pdd.valor) FROM PEDIDO PDD WHERE PDD.IDPEDIDO = idpdd);
END
$$;

SELECT get_valor_pedido (idpedido) FROM PEDIDO

--2. Crie uma função chamada “maior”, que quando executada retorne o pedido com o maior valor

CREATE or replace FUNCTION get_maior_valor () returns integer language plpgsql as

$$
BEGIN
	return (select idpedido from pedido where valor = (select max (valor) from pedido));
END;
$$;

-- Stored procedures // PROCEDIMENTO ARMAZENADO

CREATE PROCEDURE insere_bairro (nome_bairro varchar (30)) language sql as
$$
	INSERT INTO BAIRRO (nome) values (nome_bairro);

$$;

-- INSERINDO BAIRROS
call insere_bairro ('TESTE PROCEDURA');

--1. Crie uma stored procedure que receba como parâmetro o ID do produto 
--e o percentual de aumento, e reajuste o preço somente deste produto de 
--acordo com o valor passado como parâmetro
CREATE OR REPLACE PROCEDURE REAJUSTA_PRODUTO (idp integer, percentual float) language sql as
$$
	update produto set valor = valor + ((valor * pErcentual) / 100) where idproduto = idp;
$$;

call reajusta_produto (1,10) 
SELECT * FROM PRODUTO
--2. Crie uma stored procedure que receba como parâmetro o ID do produto 
--e exclua da base de dados somente o produto com o ID correspondente

create or replace procedure EXCLUI_PRODUTO (IDPR FLOAT) language sql as
$$
	DELETE FROM PRODUTO WHERE IDPRODUTO = IDPR;
$$;

call EXCLUI_PRODUTO (10)
SELECT * FROM PRODUTO

--- TRIGGERS
-- VAMOS CRIAR UMA TABELA QUE ARMAZENE DATA E HORA QUE OS BAIRROS FORAM CRIADOS
CREATE TABLE BAIRRO_AUDITORIA (
	idbairro integer not null,
	data_criacao timestamp not null
);

-- CRIAÇÃO DA FUNÇÃO 
CREATE OR REPLACE  FUNCTION bairro_log () returns trigger language plpgsql as
$$
begin
	insert into bairro_auditoria (idbairro, data_criacao) values (new.idbairro, current_timestamp);
	return new;
end;
$$;

-- CRIAÇÃO DA TRIGGER
CREATE OR REPLACE TRIGGER log_bairro_trigger after insert on bairro 
for each row execute procedure bairro_log ();

-- INSERINDO NA TABELA BAIRRO

call insere_bairro ('TESTE10');
call insere_bairro ('TESTE20');
call insere_bairro ('TESTE30');

SELECT * FROM BAIRRO_AUDITORIA

-- Exercícios triggers
--1. Crie uma tabela chamada PEDIDOS_APAGADOS
SELECT * FROM PEDIDO
CREATE TABLE PEDIDOS_APAGADOR (
	IDPEDIDO INTEGER NOT NULL,
	DATA_APAGADO TIMESTAMP NOT NULL	
);

ALTER TABLE PEDIDOS_APAGADOS ADD COLUMN IDCLIENTE INTEGER NOT NULL, ADD COLUMN
IDTRANSPORTADORA INTEGER NOT NULL, ADD COLUMN IDVENVEDOR INTEGER NOT NULL, 
ADD COLUMN DATA_PEDIDO DATE NOT NULL, ADD COLUMN VALOR FLOAT NOT NULL,
ADD COLUMN DATA_APAGADO DATE NOT NULL;

ALTER TABLE PEDIDOS_APAGADOS RENAME COLUMN IDVENVEDOR TO IDVENDEDOR;
SELECT * FROM PEDIDOS_APAGADOS

--2. Faça uma trigger que quando um pedido for apagado, todos os seus dados 
--devem ser copiados para a tabela PEDIDOS_APAGADOS

CREATE OR REPLACE FUNCTION PEDIDO_LOG() RETURNS TRIGGER LANGUAGE PLPGSQL AS
$$
BEGIN
	INSERT INTO PEDIDOS_APAGADOS (IDPEDIDO, IDCLIENTE, IDTRANSPORTADORA, IDVENDEDOR, DATA_PEDIDO, VALOR, DATA_APAGADO) 
	VALUES (OLD.IDPEDIDO, OLD.IDCLIENTE, OLD.IDTRANSPORTADORA, OLD.IDVENDEDOR, OLD.DATA_PEDIDO, OLD.VALOR, CURRENT_TIMESTAMP);
	RETURN OLD;
END;
$$;


-- TRIGGER
CREATE OR REPLACE TRIGGER log_pedido_trigger BEFORE DELETE on pedido
for each row execute procedure PEDIDO_LOG();

DELETE FROM PEDIDO WHERE IDPEDIDO = 2

SELECT * FROM PEDIDOS_APAGADOS

-- DOMINIOS/DOMANS
-- https://www.postgresql.org/docs/current/datatype-numeric.html

-- CRIAÇÃO DOS DOMINIOS

--IDS
-- Ids
create domain idcurto as smallint;
create domain idmedio as integer;
create domain idlongo as bigint;

-- Caracteres
create domain sigla as char(3);
create domain codigo as varchar(10);
create domain nome_curto as varchar(15);
create domain nome_medio as varchar(50);
create domain nome_longo as varchar(70);
create domain documento as varchar(15);
create domain tipo as char(1);
create domain texto as text;

-- Data e hora
create domain data as date;
create domain hora as time;
create domain data_hora timestamp;

-- Numéricos
create domain moeda as numeric(10,2);
create domain float_curto as numeric(6,2);
create domain float_medio as numeric(10,2);
create domain float_longo as numeric(15,2);
create domain quantidade as smallint;

-- ALTERANDO UM TIPO DE DADO EXISTENTE
-- NÃO VAI DAR PQ JÁ TEM UMA VIEW
-- SERIA INTERESSANTE FAZER NO INICIO DA CRIAÇÃO DA TABELA:

ALTER TABLE BAIRRO ALTER COLUMN NOME TYPE NOME_MEDIO;

alter table bairro alter column nome type nome_medio;

alter table bairro_auditoria alter column data_criacao type data_hora;

drop view cliente_profissao


alter table cliente alter column nome type nome_longo;
alter table cliente alter column cpf type documento;
alter table cliente alter column rg type documento;
alter table cliente alter column data_nascimento type data;
alter table cliente alter column genero type tipo;
alter table cliente alter column logradouro type nome_longo;
alter table cliente alter column numero type nome_curto;
alter table cliente alter column idprofissao type idmedio;
alter table cliente alter column idnacionalidade type idmedio;
alter table cliente alter column idbairro type idmedio;
alter table cliente alter column idmunicipio type idmedio;
alter table cliente alter column idcomplemento type idmedio;

alter table complemento alter column nome type nome_medio;

drop view produto_fornecedor
drop view municipio_uf
drop view transportadora_uf

alter table fornecedor alter column nome type nome_medio;

alter table municipio alter column nome type nome_medio;
alter table municipio alter column iduf type idmedio;

alter table nacionalidade alter column nome type nome_medio;

alter table pedido alter column idpedido type bigint;
alter table pedido alter column idcliente type idmedio;
alter table pedido alter column idtransportadora type idmedio;
alter table pedido alter column idvendedor type idmedio;
alter table pedido alter column data_pedido type data;
alter table pedido alter column valor type moeda;

drop view produto_pedido

alter table pedido_produto alter column idpedido type idlongo;
alter table pedido_produto alter column idproduto type idmedio;
alter table pedido_produto alter column quantidade type quantidade;
alter table pedido_produto alter column valor_unitario type moeda;

alter table pedidos_apagados alter column idpedido type idlongo;
alter table pedidos_apagados alter column idcliente type idmedio;
alter table pedidos_apagados alter column idtransportadora type idmedio;
alter table pedidos_apagados alter column idvendedor type idmedio;
alter table pedidos_apagados alter column data_pedido type data;
alter table pedidos_apagados alter column valor type moeda;

alter table produto alter column idfornecedor type idmedio;
alter table produto alter column nome type nome_medio;
alter table produto alter column valor type moeda;

alter table profissao alter column nome type nome_medio;

alter table transportadora alter column idmunicipio type idmedio;
alter table transportadora alter column nome type nome_medio;
alter table transportadora alter column logradouro type nome_longo;
alter table transportadora alter column numero type nome_curto;

alter table uf alter column nome type nome_medio;
alter table uf alter column sigla type sigla;

alter table vendedor alter column nome type nome_medio;

-- PERMISSOES E USUARIOS
CREATE ROLE GERENTE;
CREATE ROLE ESTAGIARIO;

-- CRIANDO USUARIOS

CREATE ROLE MARIA login password '1234' in role gerente;
CREATE ROLE PEDRO login password '4321' in role estagiario;

-- DANDO PERMISSÕES PARA OS USUARIOS
grant select on cliente_dados, dados_pedidos to ESTAGIARIO

GRANT SELECT, INSERT, DELETE ON BAIRRO, CLIENTE,COMPLEMENTO, FORNECEDOR, MUNICIPIO,
NACIONALIDADE, PEDIDO, PEDIDO_PRODUTO, PEDIDOS_APAGADOS, PRODUTO, PROFISSAO, TRANSPORTADORA,
UF, VENDEDOR TO GERENTE WITH GRANT OPTION

--- DANDO PERMISSÃO PARA SEQUENCIAS
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO GERENTE;
-- DANDO TODAS PERMISSÕES
GRANT ALL ON ALL SEQUENCES IN SCHEMA public TO GERENTE;
-- RETIRANDO A PERMISSÃO USE REVOKE
REVOKE SELECT ON ALL (SEQUENCES) IN SCHEMA(nome da schema) public TO GERENTE


--- EXERCICIO

-- 1. CRIE UM PAPEL ATENDENTE

CREATE ROLE ATENDENTE

-- 2. 2. Defina somente permissões para o novo papel poder selecionar e 
--incluir novos pedidos (tabelas pedido e pedido_produto). O restante 
--do acesso deve estar bloqueado

GRANT SELECT, INSERT ON PEDIDO, PEDIDO_PRODUTO TO ATENDENTE WITH GRANT OPTION
GRANT ALL ON PEDIDO_ID_SEQ to atendente WITH GRANT OPTION

--3. Crie um novo usuário associado ao novo papel
CREATE ROLE DANIEL LOGIN PASSWORD '123123123' in role ATENDENTE

--4. Realize testes para verificar se as permissões foram aplicadas corretamente

SELECT * FROM PEDIDO
SELECT * FROM PEDIDO_PRODUTO


-- TRANSAÇÕES
--- CRIANDO UMA TABELA DE TRANSAÇÃO

CREATE TABLE CONTA (
	IDCONTA SERIAL NOT NULL,
	CLIENTE VARCHAR (30) NOT NULL,
	SALDO NUMERIC NOT NULL DEFAULT 0,
	
	CONSTRAINT PK_CNT_IDCONTA PRIMARY KEY (IDCONTA)	
);
	INSERT INTO CONTA (CLIENTE,SALDO) VALUES ('CLIENTE 1',1000)
	INSERT INTO CONTA (CLIENTE,SALDO) VALUES ('CLIENTE 2',500)

--- RETIRANDO -100 DO CLIENTE UM E DANDO PRO 2
	UPDATE CONTA SET SALDO = SALDO -100 WHERE IDCONTA = 1;
	UPDATE CONTA SET SALDO = SALDO +100 WHERE IDCONTA= 2;
	
SELECT * FROM CONTA
--- ROLLBACK
	BEGIN;
	UPDATE CONTA SET SALDO = SALDO -100 WHERE IDCONTA = 1;
	UPDATE CONTA SET SALDO = SALDO +100 WHERE IDCONTA= 2;
	ROLLBACK;
	
--- COMIT

	BEGIN;
	UPDATE CONTA SET SALDO = SALDO -100 WHERE IDCONTA = 1;
	UPDATE CONTA SET SALDO = SALDO +100 WHERE IDCONTA= 2;
	COMMIT;