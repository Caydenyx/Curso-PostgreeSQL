CREATE TABLE CLIENTE (
	IDCLIENTE INTEGER NOT NULL, -- NOT NULL NÃO PODE ESTAR VAZIO
	NOME VARCHAR(50) NOT NULL, -- VARCHAR THIAGO 44 - 5O ENTÃO NÃO OCUPA ESPAÇO D,C
	CPF CHAR(11), -- CARACTERES OBRIGATÓRIAS
	DATA_NASCIMENTO date,
	GENERO CHAR (1),
	PROFISSAO VARCHAR (30),
	NACIONALIDADE VARCHAR (30),
	LOGRADOURO VARCHAR (30),
	NUMERO VARCHAR (30),
	COMPLEMENTO VARCHAR (30),
	BAIRRO VARCHAR (30),
	UF VARCHAR (30),
	OBSERVAÇOES TEXT,
	RG VARCHAR (15),
	MUNICIPIO VARCHAR (30),
	--PRIMARY KEY
	CONSTRAINT pk_cln_idcliente primary key (idcliente); -- cln tabela cliente> relacionada com idcliente
);

insert into cliente (idcliente, NOME, CPF, DATA_NASCIMENTO, GENERO, PROFISSAO, NACIONALIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, UF, RG, MUNICIPIO )    
VALUES (1,'manuel', '88828383821', '2002-12-08', 'M', 'ESTUDANTE', 'BRASILEIRA', 'VINICIUS DE SOUZA LIMA', '553','CASA', 'PARQUE DEZ', 'AM', '29395', 'MANAUS');

insert into cliente (idcliente, NOME, CPF, DATA_NASCIMENTO, GENERO, PROFISSAO, NACIONALIDADE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, UF, RG, MUNICIPIO )    
VALUES (2,'adriano', '88828383823', '1987-11-08', 'M', 'ENGENHEIRO', 'BRASILEIRA', 'CIDADE NOVA', '554','CASA', 'TERRA NOVA', 'AM', '29396', 'MANAUS');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (3,'Carlos','87732323227','55463','1967-10-01','M','Pedreiro','Brasileira','Rua das Laranjeiras','300','Apart.','Cto.','Canoinhas','SC');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (4,'Adriana','12321222122','98777','1989-09-10','F','Jornalista','Brasileira','Rua das Limas','240','Casa','São Pedro','General Carneiro','PR');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (5,'Amanda','99982838828','28382','1991-03-04','F','Jorn.','Italiana','Av. Central','100',null, 'São Pedro','General Carneiro','PR');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (6, 'Ângelo', '99982828181','12323','2000-01-01','M','Professor','Brasileiro','Av. Beira Mar','300',null, 'Ctr.','São Paulo','SP');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (7,'Anderson',null,null,null,'M','Prof.','Italiano', 'Av. Brasil','100','Apartamento','Santa Rosa','Rio de Janeiro','SP');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (8,'Camila','9998282828',null,'2001-10-10','F','Professora','Norte-Americana','Rua Central','4333',null,'Centro','Porto Alegre','RS');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (9,'Cristiano',null,null,null,'M','Estudante','Alemã','Rua do Centro','877','Casa','Centro','Porto Alegre','RS');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (10, 'Fabricio','8828282828','32323',null,'M','Estudante','Brasileiro',null,null,null,null, 'PU','SC');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (11,'Fernanda',null,null,null,'F',null,'Brasileira',null,null,null,null,'Porto União','SC');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (12,'Gilmar','88881818181','888','2000-02-10','M','Estud.',null,'Rua das Laranjeiras','200',null,'C. Nova','Canoinhas','SC');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (13,'Diego','1010191919','111939',null,'M','Professor','Alemão','Rua Central','455','Casa','Cidade N.','São Paulo','SP');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (14,'Jeferson',null,null,'1983-07-01','M',null,'Brasileiro',null,null, null,null,'União da Vitória','PR');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (15,'Jessica',null,null,null,'F','Estudante', null, null, null, null, null, 'União da Vitória','PR');

SELECT * FROM CLIENTE;

SELECT NOME, DATA_NASCIMENTO FROM CLIENTE;

SELECT NOME, data_nascimento as "DATA DE NASCIMENTO" FROM CLIENTE;

select cpf, rg from cliente;

select 'cpf: ' || CPF ||'RG: '||RG as "CPF e RG" FROM CLIENTE;

select * from cliente limit 3;

select nome, data_nascimento from cliente where data_nascimento > '2000-01-01';

select nome from cliente where nome like 'C%';

select nome from cliente where nome like '%C%';

select nome, data_nascimento from cliente where data_nascimento between '1990-01-01' and '1998-01-01';

select nome, rg from cliente where rg is null;

select nome from cliente order by nome;

select nome from cliente order by nome desc;


-- 1. O nome, o gênero e a profissão de todos os clientes, ordenado pelo nome em ordem decrescente
select nome, genero, profissao from cliente order by nome desc;

-- 2. Os clientes que tenham a letra “R” no nome
select nome from cliente where nome like '%r%';

--3. Os clientes que o nome inicia com a letra “C”
select nome from cliente where nome like '%C';

-- 4. Os clientes que o nome termina com a letra “A”
select nome from cliente where nome like 'A%'

-- 5. Os clientes que moram no bairro “Centro”
select nome, bairro from cliente where bairro = 'Centro' or bairro = 'Ctr.' or bairro= 'Cto.';

--6. Os clientes que moram em complementos que iniciam com a letra “A”
select nome, complemento from cliente where complemento like 'A%'; -- não sei

--7. Somente os clientes do sexo feminino
select nome, genero from cliente where genero like 'F';

--8. Os clientes que não informaram o CPF
select nome, cpf from cliente where cpf is null;

-- 9. O nome e a profissão dos clientes, ordenado em ordem crescente pelo nome da profissão
select nome, profissao from cliente order by profissao;

-- 10. Os clientes de nacionalidade “Brasileira”
select nome, nacionalidade from cliente where nacionalidade like 'Brasil%'; -- não sei (faltou % e B)

--11. Os clientes que informaram o número da residência
select nome, numero from cliente where numero is not null; -- incompleto (where numero is not null)

-- 12. Os clientes que moram em Santa Catarina
select nome, uf from cliente where uf ='SC'; -- caguei demais (pode ser uf like 'SC')

--13. Os clientes que nasceram entre 01/01/2000 e 01/01/2002
select nome, data_nascimento from cliente where data_nascimento between '2000-01-01' and '2002-01-01';

--14. O nome do cliente e o logradouro, número, complemento, bairro, município e UF concatenado de todos os clientes
select nome || ' - ' || logradouro || ' - ' || numero || ' - ' || complemento || ' - ' || bairro || ' - ' || municipio || ' - ' || uf from cliente;

select * from cliente;

update cliente set nome = 'teste' where idcliente = 1;

update cliente set nome = 'Adriano', genero = 'M', numero = '241' where idcliente = 4;

insert into cliente (idcliente,nome) values (16, 'João')

delete from cliente WHERE idcliente = 16;

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (16,'Maicon','12349596421','1234','1965-10-10','F','Empresario',null,null,null,null,null,'Florianopólis','PR');

insert into cliente(idcliente, nome, cpf, rg, data_nascimento, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, UF)
values (17,'Getúlio',null,'4631','null','F','Estudante','Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'SC');

insert into cliente(idcliente, nome, genero, profissao, nacionalidade, numero, complemento)
values (18,'Sandra','M','Professor', 'Italiana', '12', 'Bloco A');

-- 2.	Altere os dados do cliente Maicon
	-- a.	O CPF para 45390569432
	-- b.	O sexo para M
	-- c.	A nacionalidade para Brasileira
	-- d.	O UF para SC
	
select * from cliente
update cliente set cpf = '45390569432', genero = 'M', nacionalidade = 'Brasileira', uf = 'SC' where id cliente = 16

-- 3.	Altere os dados do cliente Getúlio
	-- a.	A data de nascimento para 01/04/1978
	-- b.	O sexo para M
update cliente set data_nascimento = '1978-04-01', genero = 'M' where idcliente = 17

-- 4.	Altere os dados da cliente Sandra
	-- a.	O sexo para F
	-- b.	A profissão para Professora
	-- c.	O número para 123
update cliente set genero = 'F', profissao = 'Professora', numero = '123' where idcliente = 18;

-- 5.	Apague o cliente Maicon
delete from cliente where idcliente = 16;

-- 6.	Apague a cliente Sandra
delete from cliente where idcliente = 18;

create table profissao (
  idprofissao integer not null,
  nome varchar(30) not null,
 
  constraint pk_prf_idprofissao primary key (idprofissao),
  constraint un_prf_nome unique (nome)
);

insert into profissao (idprofissao, nome) values (1, 'Estudante');
insert into profissao (idprofissao, nome) values (2, 'Engenheiro');
insert into profissao (idprofissao, nome) values (3, 'Pedreiro');
insert into profissao (idprofissao, nome) values (4, 'Jornalista');
insert into profissao (idprofissao, nome) values (5, 'Professor');

select * from profissao;

create table nacionalidade (
  idnacionalidade integer not null,
  nome varchar(30) not null,
 
  constraint pk_ncn_idnacionalidade primary key (idnacionalidade),
  constraint un_ncn_nome unique (nome)
);

insert into nacionalidade (idnacionalidade, nome) values (1, 'Brasileira');
insert into nacionalidade (idnacionalidade, nome) values (2, 'italiana');
insert into nacionalidade (idnacionalidade, nome) values (3, 'Norte-Americana');
insert into nacionalidade (idnacionalidade, nome) values (4, 'Alemã');

create table bairro (
	idbairro integer not null,
	nome varchar(30) not null,
	
	constraint pk_brr_idbairro primary key (idbairro),
	constraint un_brr_nome unique (nome)
);

insert into bairro (idbairro, nome) values (1, 'Cidade Nova');
insert into bairro (idbairro, nome) values (2, 'Centro');
insert into bairro (idbairro, nome) values (3, 'São Pedro');
insert into bairro (idbairro, nome) values (4, 'Santa Rosa');


select * from bairro

select * from cliente;

alter table cliente rename column profissao to idprofissao;
alter table cliente alter column idprofissao type integer;
-- Estudante -> 1, 9, 10, 12, 15, 17
-- Engenheiro -> 2
-- Pedreiro -> 3
-- Jornalista -> 4, 5
-- Professor -> 6, 7, 8, 13
-- Null -> 11,14
alter table cliente drop idprofissao;
alter table cliente add idprofissao integer; -- foreign key
alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao);

update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17);
update cliente set idprofissao = 2 where idcliente = 2;
update cliente set idprofissao = 3 where idcliente = 3;
update cliente set idprofissao = 4 where idcliente in (4, 5);
update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13);

select * from cliente;
select * from profissao;

alter table cliente drop nacionalidade;


alter table cliente add constraint fk_cln_idnacionalidade foreign key  (idnacionalidade) references nacionalidade (idnacionalidade);
select * from nacionalidade;

update cliente set idnacionalidade = 1 where idcliente in (1,2,3,4,6,10,11,14);
update cliente set idnacionalidade = 2 where idcliente in (5,7);
update cliente set idnacionalidade = 3 where idcliente = 8;
update cliente set idnacionalidade = 4 where idcliente in (9,13);

select * from cliente;
alter table cliente drop complemento;
alter table cliente add idcomplemento integer;
alter table cliente add constraint fk_cln_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);
select * from complemento;

update cliente set idcomplemento = 1 where idcliente in (1,4,9,13);
update cliente set idcomplemento = 2 where idcliente in (2,3,7);


select * from cliente
alter table cliente drop bairro;
alter table cliente add idbairro integer;
alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);
select * from bairro;
update cliente set idbairro = 1 where idcliente in (1, 12, 13);
update cliente set idbairro = 2 where idcliente in (2, 3, 6, 8, 9);
update cliente set idbairro = 3 where idcliente in (4,5);
update cliente set idbairro = 4 where idcliente = 7;

select * from cliente;

create table uf (
    iduf integer not null,
	nome varchar (30) not null,
	sigla char (2) not null,
	
	constraint pk_ufd_idunidade_federacao primary key (iduf),
	constraint un_ufd_nome unique (nome),
	constraint un_ufd_sigla unique (sigla)
	
);

insert into uf (iduf, nome, sigla) values (1, 'Santa Catarina', 'SC');
insert into uf (iduf, nome, sigla) values (2, 'Paraná', 'PR');
insert into uf (iduf, nome, sigla) values (3, 'São Paulo', 'SP');
insert into uf (iduf, nome, sigla) values (4, 'Minas Gerais', 'MG');
insert into uf (iduf, nome, sigla) values (5, 'Rio Grande do Sul', 'RS');
insert into uf (iduf, nome, sigla) values (6, 'Rio de Janeiro', 'RJ');

select * from uf;

create table municipio(
	idmunicipio integer not null,
	nome varchar (30) not null,
	iduf integer not null,
	
	constraint pk_mnc_idmunicipio primary key (idmunicipio),
	constraint un_mnc_nome unique (nome),
	constraint fk_mnc_iduf foreign key (iduf) references uf (iduf)
);

insert into municipio (idmunicipio, nome, iduf) values (1, 'Porto União', 1);
insert into municipio (idmunicipio, nome, iduf) values (2, 'Canoinhas', 1);
insert into municipio (idmunicipio, nome, iduf) values (3, 'Porto Vitória', 2);
insert into municipio (idmunicipio, nome, iduf) values (4, 'General Carneiro', 2);
insert into municipio (idmunicipio, nome, iduf) values (5, 'São Paulo', 3);
insert into municipio (idmunicipio, nome, iduf) values (6, 'Rio de Janeiro', 6);
insert into municipio (idmunicipio, nome, iduf) values (7, 'Uberlândia', 4);
insert into municipio (idmunicipio, nome, iduf) values (8, 'Porto Alegre', 5);
insert into municipio (idmunicipio, nome, iduf) values (9, 'União da Vitória', 2);

select * from municipio;

alter table cliente drop municipio;
alter table cliente drop uf;
select * from cliente;
alter table cliente add idmunicipio integer;
alter table cliente add constraint fk_cliente_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio);

update cliente set idmunicipio = 1 where idcliente in (1, 2, 10, 11);
update cliente set idmunicipio = 2 where idcliente in (3, 12);
update cliente set idmunicipio = 3 where idcliente = 4;
update cliente set idmunicipio = 4 where idcliente in (5);
update cliente set idmunicipio = 5 where idcliente in (6, 13);
update cliente set idmunicipio = 6 where idcliente in (7);
update cliente set idmunicipio = 7 where idcliente in (8);
update cliente set idmunicipio = 8 where idcliente in (9);
update cliente set idmunicipio = 9 where idcliente in (14, 15);

select * from cliente;

create table fornecedor (
	idfornecedor integer not null,
	nome varchar (50) not null,
	constraint pk_frn_idfornecedor primary key (idfornecedor),
	constraint uc_frn_nome unique (nome)
);
insert into fornecedor (idfornecedor, nome) values (1, 'Cap.Computadores');
insert into fornecedor (idfornecedor, nome) values (2, 'AA. Computadores');
insert into fornecedor (idfornecedor, nome) values (3, 'BB. Máquinas');	

create table vendedor (
	idvendedor integer not null,
	nome varchar (50) not null,
	constraint pk_vnd_idvendedor primary key (idvendedor),
	constraint uc_vnd_nome unique (nome)
);	
insert into vendedor (idvendedor, nome) values (1, 'André');
insert into vendedor (idvendedor, nome) values (2, 'Alisson');
insert into vendedor (idvendedor, nome) values (3, 'José');
insert into vendedor (idvendedor, nome) values (4, 'Ailton');
insert into vendedor (idvendedor, nome) values (5, 'Maria');
insert into vendedor (idvendedor, nome) values (6, 'Suelen');
insert into vendedor (idvendedor, nome) values (7, 'Aline');
insert into vendedor (idvendedor, nome) values (8, 'Silvana');	

select * from vendedor

create table transportadora (
	idtransportadora integer not null,
	idmunicipio integer,
	Nome varchar (50) not null,
	Logradouro varchar (50),
	Numero varchar (10),
	
	constraint pk_trn_idtransportadora primary key (idtransportadora),
	constraint fn_trn_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio),
	constraint un_trn_nome unique (nome)

);

insert into transportadora (idtransportadora, idmunicipio, Nome, Logradouro, Numero) values (1, 9, 'BS Transportes','Rua das Limas', '01');
insert into transportadora (idtransportadora, idmunicipio, Nome) values (2, 5, 'União Transportes');

select * from transportadora;

create table produto (
	idproduto integer not null,
	idfornecedor integer not null,
	nome varchar (50) not null,
	valor float not null,
	
	constraint pk_prd_idproduto primary key (idproduto),
	constraint fk_prd_idfornecedor foreign key (idfornecedor) references fornecedor (idfornecedor)
	);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (1, 1, 'Microcomputador', 800);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (2, 1, 'Monitor', 500);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (3, 2, 'Placa mãe', 200);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (4, 2, 'HD', 150);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (5, 2, 'Placa de vídeo', 200);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (6, 3, 'Memória RAM', 100);
insert into produto (idproduto, idfornecedor, nome, valor) 
values (7, 1, 'Gabinete', 35);

select * from produto;

create table pedido (
	idpedido integer not null,
	idcliente integer not null,
	idtransportadora integer,
	idvendedor integer not null,
	data_pedido date not null,
	valor float not null,
	
	constraint pk_pdd_idpedido primary key (idpedido),
	constraint fk_pdd_idcliente foreign key (idcliente) references cliente (idcliente),
	constraint fk_pdd_idtransportadora foreign key (idtransportadora) references transportadora (idtransportadora),
	constraint fk_pdd_idvendedor foreign key (idvendedor) references vendedor (idvendedor)	
);

insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (1, '2008-04-01', 1300, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (2, '2008-04-01', 500, 1, 1, 1);
insert into pedido (idpedido, data_pedido, valor, idcliente, idtransportadora, idvendedor)
values (3, '2008-04-02', 300, 11, 2, 5);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (4,'2008-04-05',1000,8,1,7);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (5,'2008-04-06',200,9,2,6);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (6,'2008-04-06',1985,10,1,6);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (7,'2008-04-06',800,3,1,7);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (8,'2008-04-06',175,3,null,7);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (9,'2008-04-07',1300,12,null,8);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (10,'2008-04-10',200,6,1,8);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (11,'2008-04-15',300,15,2,1);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (12,'2008-04-20',300,15,2,5);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (13,'2008-04-20',350,9,1 ,7);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (14,'2008-04-23',300,2,1,5);
Insert into pedido (idpedido, data_pedido, valor, idcliente,idtransportadora, idvendedor) values (15,'2008-04-25',200,11,null,5);

create table pedido_produto (
	idpedido integer not null,
	idproduto integer not null,
	quantidade integer not null,
	valor_unitario float not null,
	
	constraint pk_pdp_idpedidoproduto primary key (idpedido, idproduto),
	constraint fk_pdp_idpedido foreign key (idpedido) references pedido (idpedido),
	constraint fk_pdp_idproduto foreign key (idproduto) references produto (idproduto)
);

Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (3,4,2,150);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (4,1,1,800);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (4,3,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (5,3,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (6,1,2,800);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (6,7,1,35);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (6,5,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (6,4,1,150);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (7,1,1,800);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (8,7,5,35);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (9,1,1,800);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (9,2,1,500);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (10,5,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (11,5,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (11,6,1,100);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (12,2,1,500);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (13,3,1,200);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (13,4,1,150);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (14,6,3,100);
Insert into pedido_produto (idpedido,idproduto,quantidade,valor_unitario) values (15,3,1,200);

-- 1. Somente o nome de todos os vendedores em ordem alfabética.
select nome from vendedor order by nome asc

--2. Os produtos que o preço seja maior que R$200,00, em ordem crescente pelo preço.
select nome, valor from produto where valor > 200 order by valor

--3. O nome do produto, o preço e o preço reajustado em 10%, ordenado pelo nome do produto.
select nome, valor, valor + (valor * 10) / 100 as Reajuste from produto order by nome

--4. Os municípios do Rio Grande do Sul.
select * from uf
select * from municipio where iduf = 5

--5. Os pedidos feitos entre 10/04/2008 e 25/04/2008 ordenado pelo valor.
select * from pedido where data_pedido between '2008-04-10' and '2008-04-25' order by valor

--6. Os pedidos que o valor esteja entre R$1.000,00 e R$1.500,00.
select * from pedido where valor between 100 and 500

--7. Os pedidos que o valor não esteja entre R$100,00 e R$500,00.
select * from pedido where valor not between 100 and 500

--8. Os pedidos do vendedor André ordenado pelo valor em ordem decrescente.
select * from vendedor
select * from pedido where idvendedor = 1 order by valor desc

--9. Os pedidos do cliente Manoel ordenado pelo valor em ordem crescente.
select * from cliente
select * from pedido where idcliente = 1 order by valor

--10. Os pedidos da cliente Jéssica que foram feitos pelo vendedor André.
select * from pedido where idcliente = 15 and idvendedor = 1

--11. Os pedidos que foram transportados pela transportadora União Transportes.
select * from transportadora
select * from pedido where idtransportadora = 2

--12. Os pedidos feitos pela vendedora Maria ou pela vendedora Aline.
select * from vendedor
select * from pedido where idvendedor = 5 or idvendedor = 7

--13. Os clientes que moram em União da Vitória ou Porto União.
select * from municipio
select * from cliente where idmunicipio = 1 or idmunicipio = 9

--14. Os clientes que não moram em União da Vitória e nem em Porto União.
select * from cliente where idmunicipio <> 1 and idmunicipio <> 9

--15. Os clientes que não informaram o logradouro.
select * from cliente where logradouro is null

--16. Os clientes que moram em avenidas.
select * from cliente where logradouro like 'Av%'

--17. Os vendedores que o nome começa com a letra S.
select * from vendedor where nome like 'S%'

--18. Os vendedores que o nome termina com a letra A.
select * from vendedor where nome like '%a'

--19. Os vendedores que o nome não começa com a letra A.
select * from vendedor where nome not like 'A%'

--20. Os municípios que começam com a letra P e são de Santa Catarina.
select * from uf
select * from municipio where nome like 'P%' and iduf = 1

--21. As transportadoras que informaram o endereço.
select * from transportadora where logradouro is not null

--22. Os itens do pedido 01.
select * from pedido_produto where idpedido = 1

--23. Os itens do pedido 06 ou do pedido 10.
select * from pedido_produto where idpedido = 6 or idpedido = 10

-- funções agregadas


-- Funções agregadas

select avg(valor) from pedido -- a media dos valores dos pedidos

select count(idmunicipio) from municipio -- quantidade total de registros 

select count(*) from municipio -- mesma coisa que de cima mas simplidicado

select * from transportadora

select count(logradouro) from transportadora -- o not null nao veio

select count(idtransportadora) from transportadora

select * from municipio

select count(idmunicipio) from municipio where iduf = 2 -- quantos municipios relacionado ao uf = 3 municipios 

select max(valor) from pedido -- o pedido com valor mais caro

select min(valor), max(valor) from pedido -- valor minimo e mais caro

select sum(valor) from pedido -- somatorio de todos os pedidos

select idcliente, sum(valor) from pedido group by idcliente -- somatorio de todos os pedidos pedidos

select idcliente, sum(valor) from pedido group by idcliente having sum(valor) > 500 -- retorna somente os dpidos acima de 500$

-- 1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00.
select idvendedor, avg(valor) from pedido group by idvendedor having avg(valor) > 300
-- 2. Os vendedores que venderam mais que R$ 1500,00

select idvendedor, sum (valor) from pedido group by idvendedor having sum (valor) > 300
 --3. O somatório das vendas de cada vendedor.
 
select idvendedor, sum (valor) FROM pedido group by idvendedor 

-- 4. A quantidade de municípios.

select count (idmunicipio) from municipio

-- 5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
select * from uf
select count (idmunicipio) from municipio where iduf = 1 or iduf = 2

-- 6. quantidade de municípios por estado.

select iduf, count(idmunicipio) from municipio group by iduf

--7. A quantidade de clientes que informaram o logradouro.
select count (idcliente) from cliente where logradouro is not null

-- 8. A quantidade de clientes por município.
select idmunicipio, count (idcliente) from cliente group by idmunicipio

-- 9. A quantidade de fornecedores.
select count (idfornecedor) from fornecedor

-- 10. A quantidade de produtos por fornecedor.
select idfornecedor, count (idproduto) from fornecedor group by idfornecedor

-- 11. A média de preços dos produtos do fornecedor Cap. Computadores.

select * from fornecedor
select avg (valor) from produto where idfornecedor = 1
-- 12. O somatório dos preços de todos os produtos.

select sum (valor) from produto

-- 13. O nome do produto e o preço somente do produto mais caro.

select nome, valor from produto order by valor desc limit 1

-- 14. O nome do produto e o preço somente do produto mais barato.
select nome, valor from produto order by valor asc limit 1

-- 15. A média de preço de todos os produtos.

select avg (valor) from produto

-- 16. A quantidade de transportadoras.
select sum (idtransportadora) from transportadora

-- 17. A média do valor de todos os pedidos.

select avg (valor) from pedido

-- 18. O somatório do valor do pedido agrupado por cliente.

select * from pedido
select sum (valor) from pedido group by idcliente

-- 19. O somatório do valor do pedido agrupado por vendedor.
select sum (valor) from pedido group by idvendedor

-- 20. O somatório do valor do pedido agrupado por transportadora.
select sum (valor) from pedido group by idtransportadora

-- 21. O somatório do valor do pedido agrupado pela data.

select data_pedido, sum (valor) from pedido group by data_pedido

-- 22. O somatório do valor do pedido agrupado por cliente, vendedor e transportadora.

select idcliente, idvendedor, idtransportadora,
sum (valor) from pedido group by idcliente,idvendedor,idtransportadora

-- 23. O somatório do valor do pedido que esteja entre 01/04/2008 e 10/12/2009 e que seja maior que R$ 200,00. 

select sum (valor) from pedido where data_pedido between '2008-04-01' and '2009-12-10' and valor > 200

-- 24. A média do valor do pedido do vendedor André.
select * from vendedor, 
select avg (valor) from pedido where idvendedor = 1
-- 25. A média do valor do pedido da cliente Jéssica.
select * from cliente

select avg (valor) from pedido where idcliente = 15

-- 26. A quantidade de pedidos transportados pela transportadora BS.

select * from transportadora

select count (valor) from pedido where idtransportadora = 1

-- 27. A quantidade de pedidos agrupados por vendedor.

select idvendedor, count (idpedido) from pedido group by idvendedor

-- 28. A quantidade de pedidos agrupados por cliente.

select idcliente, count (idpedido) from pedido group by idcliente

-- 29. A quantidade de pedidos entre 15/04/2008 e 25/04/2008.

select count (idpedido) from pedido where data_pedido between '2008-04-15' and '2008-04-25'


-- 30. A quantidade de pedidos que o valor seja maior que R$ 1.000,00.

select count (idpedido) from pedido where valor > 1000

-- 31. A quantidade de microcomputadores vendida.

select * from produto

select sum (quantidade) from pedido_produto where idproduto = 1

-- 32. A quantidade de produtos vendida agrupado por produto.

select idproduto, sum (idproduto) from produto group by idproduto

-- 33. O somatório do valor dos produtos dos pedidos, agrupado por pedido.

select idpedido, sum (valor_unitario) from pedido_produto group by idpedido

-- 34. A quantidade de produtos agrupados por pedido

select idpedido, sum (quantidade) from pedido_produto group by idpedido

-- 35. O somatório do valor total de todos os produtos do pedido

select sum (valor_unitario) from pedido_produto 

-- 36. A média dos produtos do pedido 6.

select avg (valor_unitario) from pedido_produto where idpedido = 6

-- 37. O valor do maior produto do pedido.

select max (valor_unitario) from pedido_produto

-- 38. O valor do menor produto do pedido.

select min (valor_unitario) from pedido_produto

-- 39. O somatório da quantidade de produtos por pedido.

select idpedido, sum (quantidade) from pedido_produto group by idpedido

-- 40. O somatório da quantidade de todos os produtos do pedido.

select sum (valor_unitario) from pedido_produto

-- relacionamento com joins 
select
      cln.nome as nome,
	  prf.nome as profissão
from
      cliente as cln
left outer join
      profissao as prf on cln.idprofissao = prf.idprofissao
	  
select
      cln.nome as nome,
	  prf.nome as profissão
from
      cliente as cln
inner join
      profissao as prf on cln.idprofissao = prf.idprofissao
	  
--1. O nome do cliente, a profissão, a nacionalidade, o logradouro, o número, o complemento, o bairro, o município e a unidade de federação.
select 
	cln.nome as cliente, 
	prf.nome as profissao,
	ncn.nome as nacionalidade,
	cln.logradouro,
	cln.numero,
	cmp.nome as complemento,
	brr.nome as bairro,
	mnc.nome as municipio,
	uf.nome as estado,
	uf.sigla
from 
	cliente as cln
left outer join
	profissao as prf on cln.idprofissao = prf.idprofissao
left outer join
	nacionalidade ncn on cln.idnacionalidade = ncn.idnacionalidade
left outer join
	complemento cmp on cln.idcomplemento = cmp.idcomplemento
left outer join
	bairro brr on cln.idbairro = brr.idbairro
left outer join
	municipio mnc on cln.idmunicipio = mnc.idmunicipio
left outer join
	uf on mnc.iduf = uf.iduf
--2. O nome do produto, o valor e o nome do fornecedor.
select
	prd.nome as produto,
	prd.valor,
	frn.nome as fornecedor
from
	produto prd
left outer join
	fornecedor frn on prd.idfornecedor = frn.idfornecedor
--3. O nome da transportadora e o município.
elect
	trs.nome as transportadora,
	mnc.nome as municipio
from
	transportadora trs
left outer join
	municipio mnc on trs.idmunicipio = mnc.idmunicipio
--4. A data do pedido, o valor, o nome do cliente, o nome da transportadora e o nome do vendedor.
select
	pdd.data_pedido,
	pdd.valor,
	cln.nome as cliente,
	trn.nome as transportadora,
	vnd.nome as vendedor
from
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
left outer join
	transportadora trn on pdd.idtransportadora = trn.idtransportadora
left outer join
	vendedor vnd on pdd.idvendedor = vnd.idvendedor
--5. O nome do produto, a quantidade e o valor unitário dos produtos do pedido.
select 
	pdt.nome as produto,
	pdp.quantidade,
	pdp.valor_unitario
from 
	pedido_produto pdp
left outer join 
	produto pdt on pdp.idproduto = pdt.idproduto
--6. O nome dos clientes e a data do pedido dos clientes que fizeram algum pedido (ordenado pelo nome do cliente).
select * from pedido

SELECT 
cln.nome as NOME,
pdd.data_pedido as DATA_PEDIDO
FROM 
cliente cln
INNER JOIN 
pedido pdd ON cln.idcliente = pdd.idcliente order by cln.nome


--7. O nome dos clientes e a data do pedido de todos os clientes, independente se tenham feito pedido (ordenado pelo nome do cliente).
SELECT 
cln.nome as NOME,
pdd.data_pedido as DATA_PEDIDO
FROM 
cliente cln
LEFT OUTER JOIN
pedido pdd ON cln.idcliente = pdd.idcliente order by cln.nome
--8. O nome da cidade e a quantidade de clientes que moram naquela cidade.
elect 
	mnc.nome as municipio,
	count(cln.idcliente) as quantidade
from 
	cliente cln
inner join
	municipio mnc on cln.idmunicipio = mnc.idmunicipio
group by
	mnc.nome
--9. O nome do fornecedor e a quantidade de produtos de cada fornecedor.
select 
	frn.nome as fornecedor,
	count(pdd.idproduto)
from 
	produto pdd
left outer join
	fornecedor frn on pdd.idfornecedor = frn.idfornecedor
group by
	frn.nome
--10.O nome do cliente e o somatório do valor do pedido (agrupado por cliente).
select 
	cln.nome as cliente,
	sum(pdd.valor) as total
from 
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
group by
	cln.nome
--11.O nome do vendedor e o somatório do valor do pedido (agrupado por vendedor).
select * from pedido

select
  vendedor.nome,
  sum (pedido.valor)
from pedido

left outer join
vendedor on pedido.idvendedor = vendedor.idvendedor
group by vendedor.nome

--12.O nome da transportadora e o somatório do valor do pedido (agrupado por transportadora).
select * from pedido

select
      transportadora.nome,
      sum (pedido.valor)
	  
   

from pedido

left outer join
transportadora on pedido.idtransportadora = transportadora.idtransportadora

group by transportadora.nome
--13.O nome do cliente e a quantidade de pedidos de cada um (agrupado por cliente).
select * from cliente

select
      cliente.nome,
	 count (pedido.valor)
from  
      cliente
left outer join
pedido on cliente.idcliente = pedido.idcliente

group by cliente.nome
--14.O nome do produto e a quantidade vendida (agrupado por produto).
select * from pedido_produto
select *from produto

select
     produto.nome,
	 sum (pedido_produto.quantidade)
	
from 
     produto
	 
left outer join
pedido_produto on produto.idproduto= pedido_produto.idproduto

group by produto.nome
--15.A data do pedido e o somatório do valor dos produtos do pedido (agrupado pela data do pedido).
select * from pedido

select
    pedido.data_pedido,
	   sum (pedido_produto.valor_unitario)
from 
       pedido
left outer join
pedido_produto on pedido.idpedido = pedido_produto.idpedido

group by pedido.data_pedido
--16.A data do pedido e a quantidade de produtos do pedido (agrupado pela data do pedido).	  

select * from pedido_produto

select
      pedido.data_pedido,
	  sum (pedido_produto.quantidade)
      

from pedido

inner join 
pedido_produto on pedido.idpedido = pedido_produto.idpedido

group by pedido.data_pedido

--- comandos adicionais

select data_pedido, 
extract (day from data_pedido), -- PUXA A DATA
extract (month from data_pedido),-- PUXA O MES
extract (year from data_pedido) -- PUXA O ANO
from pedido

-- SUBSTRING

select nome ,
substring (nome from 1 for 5), -- PEGA OS CARACT DO PRIMEIRO AO 5
substring (nome, 2) -- PEGA OS A PARTIRDO 2
from cliente

--- DEIXAR A COLUNA DO NOME MAIUSUCULA

SELECT NOME, UPPER (NOME) FROM CLIENTE

-- COLOCAR TEXTO EM UMA COLUNA NUM

select nome, cpf, coalesce (cpf, 'NÃO INFORMADO') from cliente

--- NOME DAS SIGLAS OU PALAVRAS POR EXTENSO
SELECT
     CASE SIGLA -- caso a sigla
     WHEN 'PR' THEN 'PARANÁ' -- for pr seja parana...
	 WHEN 'SC' THEN 'SANTA CATARINA'
else 'OUTROS'-- o resto outros
END AS UF -- ENCERRAR O CASE
from uf

-- 1. O nome do cliente e somente o mês de nascimento
--Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.
select * from cliente

select nome, 
coalesce (extract (month from data_nascimento), 0) -- não pode colocar não informado pois a extração é de numeros e
                                                    -- e não de strings
from cliente

-- 2. O nome do cliente e somente o nome do mês de nascimento (Janeiro, Fevereiro etc). 
--Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”.

select nome,
case extract(month from data_nascimento)
        when 1 then 'Janeiro'
		when 2 then 'Fevereiro'
		when 3 then 'Março'
		when 4 then 'Abril'
		when 5 then 'Maio'
		when 6 then 'Junho'
		when 7 then 'Julho'
		when 8 then 'Agosto'
		when 9 then 'Setembro'
		when 10 then 'Outubro'
		when 11 then 'Novembro'
		when 12 then 'Dezembro'
ELSE 'NÃO INFORMADO'
END AS MES
from cliente

-- 3. O nome do cliente e somente o ano de nascimento. 
--Caso a data de nascimento não esteja preenchida mostrar a mensagem “Não informado”
SELECT nome,
coalesce (extract (years from data_nascimento), 0)

from cliente

-- -- 4. O caractere 5 até o caractere 10 de todos os municípios.
select nome from municipio

select nome,
substring (nome from 1 for 5) as MUNICI15
from municipio

-- 5. O nome de todos os municípios em letras maiúsculas.

select nome, upper (nome) from municipio


-- 6. O nome do cliente e o gênero. Caso seja M mostrar “Masculino”,
select *from cliente
select nome,
case genero 
when 'M' THEN 'MASCULINO'
when 'F' THEN 'FEMININO'
end genero 
from cliente


-- 7. O nome do produto e o valor. Caso o valor seja maior do que 
--R$ 500,00 mostrar a mensagem “Acima de 500”, caso contrário, mostrar a mensagem “Abaixo de 500”.

select* from produto

select nome,
case 
when valor >= 500 then 'Acima de 500'
else 'Abaixo de 500'
end as faixas
from produto

-- Subconsultas

-- Selecionar a data do pedido e o valor onde o valor seja maior que a média dos 
-- valores de todos os pedidos

select 
data_pedido,
valor
from pedido
where valor >(select avg (valor) from pedido)

-- Exemplo com count

select
	pdd.data_pedido,
	pdd.valor,
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido) as total
from
	pedido pdd
	
select * from pedido_produto

-- exemplo update
update pedido set valor = valor + ((valor * 5) / 100) 
where valor > (select avg(valor) from pedido)

--1. O nome dos clientes que moram na mesma cidade do Manoel. Não deve ser mostrado o Manoel.
select
	nome,
	idmunicipio
from
	cliente
where
	idmunicipio = (select idmunicipio from cliente where nome = 'Manoel')
and
	idcliente <> 1
	
select * from cliente
--2. A data e o valor dos pedidos que o valor do pedido seja menor que a média de todos os pedidos.

select
data_pedido,
valor

from pedido
where valor < (select avg(valor) from pedido) -- o valor do pedido seja menor que a media
--3. A data,o valor, o cliente e o vendedor dos pedidos que possuem 2 ou mais produtos.
select
	pdd.data_pedido,
	pdd.valor,
	cln.nome as cliente,
	vnd.nome as vendedor,
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido)
from
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
left outer join
	vendedor vnd on pdd.idvendedor = vnd.idvendedor
where
	(select sum(quantidade) from pedido_produto pdp where pdp.idpedido = pdd.idpedido) >= 2
--4. O nome dos clientes que moram na mesma cidade da transportadora BSTransportes.
select
nome,
idmunicipio
from cliente
where idmunicipio = (select idmunicipio from transportadora where idtransportadora = '1')
--5. O nome do cliente e o município dos clientes que estão localizados no mesmo município de qualquer uma das transportadoras.
select 
nome,
idmunicipio
from cliente
where idmunicipio in
(select distinct (idmunicipio) from transportadora)
--6. Atualizar o valor do pedido em 5% para os pedidos que o somatório do valor total dos produtos 
--daquele pedido seja maior que a média do valor total de todos os produtos de todos os pedidos.
update 
	pedido 
set 
	valor = valor + ((valor * 5) / 100)
where 
	(select sum(pdp.valor_unitario) from pedido_produto pdp where pdp.idpedido = pedido.idpedido) > (select avg(valor_unitario) from pedido_produto)


select
	pdd.idpedido,
	(select sum(valor_unitario) from pedido_produto pdp where pdp.idpedido = pdd.idpedido)
from 
	pedido pdd

select avg(valor_unitario) from pedido_produto
--7. O nome do cliente e a quantidade de pedidos feitos pelo cliente.
select 
     cliente.nome,
      (select count (idpedido) from pedido where pedido.idcliente = cliente.idcliente) as pedidos
from
      cliente
--8. Para revisar, refaça o exercício anterior (número 07) utilizando group by e mostrando somente os clientes que fizeram pelo menos um pedido.
select
	cln.nome as cliente,
	count(pdd.idpedido) as total
from
	pedido pdd
left outer join
	cliente cln on pdd.idcliente = cln.idcliente
group by
	cln.nome
	
-- views -- CRIAÇÃO DA VIEW
create  view cliente_profissao as
select 
	cln.nome as cliente,
	cln.cpf,
	prf.nome as profissao
from 
	cliente cln
left outer join
	profissao prf on cln.idprofissao = prf.idprofissao

-- RETORNANDO DADOS DE UMA VIEW
SELECT * FROM cliente_profissao;
--- APLICANDO FILTROS COM WHERE
SELECT * FROM cliente_profissao where profissao = 'Estudante' -- PUXA SÓ OS ESTUDANTES
-- ALTERÇÃO DA VIEW = É MELHOR APAGAR
DROP VIEW cliente_profissao

--1. O nome, a profissão, a nacionalidade, o complemento, o município, a unidade de federação, o bairro, o CPF,o RG, a data de nascimento, o gênero (mostrar “Masculino” ou “Feminino”), o logradouro, o número e as observações dos clientes.
create view cliente_dados as
select
cliente.nome,
profissao.nome as PROFISSAO,
nacionalidade.nome as NACIONALIDADE,
complemento.nome AS COMPLEMENTO,
municipio.nome AS MUNICIPIO,
uf.nome AS UF,
bairro.nome AS BAIRRO,
cliente.cpf as CPF,
cliente.rg as RG,
cliente.data_nascimento AS DATA_NASCIMENTO,
case cliente.genero 
when 'M' then 'MASCULINO' 
when 'F' then 'FEMININO'
end as genero,
cliente.logradouro as LOGRADOURO,
cliente.numero AS NUMERO,
cliente.observaçoes AS OBSERVACOES

from cliente
left outer join
profissao on cliente.idprofissao = profissao.idprofissao
left outer join
nacionalidade on cliente.idnacionalidade = nacionalidade.idnacionalidade
left outer join
complemento on cliente.idcomplemento = complemento.idcomplemento
left outer join
municipio on cliente.idmunicipio = municipio.idmunicipio
left outer join
uf on municipio.iduf = uf.iduf
left outer join
bairro on cliente.idbairro = bairro.idbairro
--2. O nome do município e o nome e a sigla da unidade da federação.
create VIEW MUNICIPIO_UF AS

select
municipio.nome as municipio,
uf.nome as UN_FEDERATIVA,
uf.sigla
from municipio
left outer join
uf on municipio.iduf = uf.iduf
--3. O nome do produto, o valor e o nome do fornecedor dos produtos.

select
produto.nome as PRODUTO,
produto.valor,
fornecedor.nome as FORNECEDOR

from produto
left outer join
fornecedor on produto.idfornecedor = fornecedor.idfornecedor

--4. O nome da transportadora, o logradouro, o número, o nome da unidade de federação e a sigla da unidade de federação das transportadoras.
select * from transportadora
select * from municipio

CREATE VIEW transportadora_uf as
select
      transportadora.nome as TRANSPORTADORA,
	  transportadora.logradouro,
	  transportadora.numero,
	  uf.nome AS UNIDADE_FEDERACÃO,
	  uf.sigla
from 
       transportadora
left outer join
        municipio on transportadora.idmunicipio = municipio.idmunicipio
left outer join
        uf on municipio.iduf = uf.iduf
--5. A data do pedido, o valor, o nome da transportadora, o nome do cliente e o nome do vendedor dos pedidos.
select* from pedido
select* from transportadora

create view dados_pedidos as
select 
      pedido.data_pedido,
	  pedido.valor,
	  transportadora.nome as TRABSPORTADORA,
	  cliente.nome as CLIENTE,
	  vendedor.nome as vendedor
from pedido
left outer join
      transportadora on pedido.idtransportadora = transportadora.idtransportadora
left outer join
      cliente on pedido.idcliente = cliente.idcliente
left outer join
      vendedor on pedido.idvendedor = vendedor.idvendedor

--6. O nome do produto, a quantidade, o valor unitário e o valor total dos produtos do pedido.

select * from produto
select * from pedido_produto

create view produto_pedido as
select
      produto.nome as produto,
	  pedido_produto.quantidade as quantidade,
	  produto.valor as valor,
	  pedido_produto.valor_unitario
	  

from produto
left outer join
     pedido_produto on produto.idproduto= pedido_produto.idproduto
	 
-- CAMPOS AUTOINCREMENTO

create table exemplo (
	idexemplo serial not null,
	nome varchar(50) not null,
	
	constraint pk_exemplo_idexemplo primary key (idexemplo)
);
select * from exemplo
INSERT INTO EXEMPLO (NOME) VALUES ('Exemplo 1');
INSERT INTO EXEMPLO (NOME) VALUES ('Exemplo 2');
INSERT INTO EXEMPLO (NOME) VALUES ('Exemplo 3');
INSERT INTO EXEMPLO (NOME) VALUES ('Exemplo 4');
INSERT INTO EXEMPLO (NOME) VALUES ('Exemplo 5');

-- DESCOBRIR O ULTIMO E PROXIMO NUMERO DO PK
-- ULTIMO INSERT
SELECT MAX(IDBAIRRO) FROM BAIRRO
-- proximo insert sqncial
SELECT MAX(IDBAIRRO) +1 FROM BAIRRO
-- criação da sequencia
create sequence bairro_id_seq minvalue 5

-- SETAR A TABELA PARA SEQUENCIA CRIADA
ALTER TABLE BAIRRO alter idbairro SET DEFAULT NEXTVAL ('bairro_id_seq')
-- ALTERAR A SEQUENCIA
ALTER SEQUENCE bairro_id_seq owned by bairro.idbairro
-- testando
INSERT INTO BAIRRO (NOME) VALUES ('teste1');

INSERT INTO BAIRRO (NOME) VALUES ('teste2');

select * from bairro

--1. Criar sequências para todas as outras tabelas da base de dados

--a. Cliente
SELECT MAX(IDCLIENTE) +1 FROM CLIENTE
CREATE SEQUENCE CLIENTE_ID_SEQ minvalue 18
ALTER TABLE Cliente alter IDCLIENTE set default NEXTVAL ('CLIENTE_ID_SEQ')
ALTER SEQUENCE CLIENTE_ID_SEQ OWNED BY cliente.idcliente
insert into cliente (nome) values ('TesteSEQ')
select * from cliente

--b. Complemento
SELECT MAX(IDCOMPLEMENTO) +1 FROM COMPLEMENTO;
CREATE SEQUENCE COMPLEMENTO_ID_SEQ minvalue 3;
ALTER TABLE COMPLEMENTO alter IDCOMPLEMENTO set default NEXTVAL ('COMPLEMENTO_ID_SEQ');
ALTER SEQUENCE COMPLEMENTO_ID_SEQ OWNED BY COMPLEMENTO.IDCOMPLEMENTO;
insert into COMPLEMENTO (nome) values ('TesteSEQ');
select * from COMPLEMENTO
--c. Fornecedor

SELECT MAX (IDFORNECEDOR) +1 FROM FORNECEDOR;
CREATE SEQUENCE FORNECEDOR_ID_SEQ MINVALUE 4;
ALTER TABLE FORNECEDOR ALTER IDFORNECEDOR SET DEFAULT NEXTVAL ('FORNECEDOR_ID_SEQ');
ALTER SEQUENCE FORNECEDOR_ID_SEQ OWNED BY FORNECEDOR.IDFORNECEDOR;
INSERT INTO FORNECEDOR (NOME) VALUES ('TESTESEQ');
SELECT * FROM FORNECEDOR

--d. Município

SELECT MAX (IDMUNICIPIO) +1 FROM MUNICIPIO;

CREATE SEQUENCE MUNICIPIO_ID_SEQ MINVALUE 10;

ALTER TABLE MUNICIPIO ALTER IDMUNICIPIO SET DEFAULT NEXTVAL ('MUNICIPIO_ID_SEQ');

ALTER SEQUENCE MUNICIPIO_ID_SEQ OWNED BY MUNICIPIO.IDMUNICIPIO;

INSERT INTO MUNICIPIO (NOME,IDUF) VALUES ('TESTESEQ',1); -- IDUF OBRIGATORIO 

SELECT * FROM MUNICIPIO
--e. Nacionalidade

SELECT MAX (IDNACIONALIDADE +1) FROM NACIONALIDADE
CREATE SEQUENCE NACIONALIDADE_ID_SEQ MINVALUE 4;
ALTER TABLE NACIONALIDADE ALTER IDNACIONALIDADE SET DEFAULT NEXTVAL ('NACIONALIDADE_ID_SEQ')
ALTER SEQUENCE NACIONALIDADE_ID_SEQ OWNED BY NACIONALIDADE.IDNACIONALIDADE
INSERT INTO NACIONALIDADE (NOME) VALUES ('testseq')
select * from nacionalidade
--f. Pedido
SELECT MAX (IDPEDIDO) +1 FROM PEDIDO

CREATE SEQUENCE PEDIDO_ID_SEQ MINVALUE 15;

ALTER TABLE PEDIDO ALTER IDPEDIDO SET DEFAULT NEXTVAL ('PEDIDO_ID_SEQ')

ALTER SEQUENCE PEDIDO_ID_SEQ OWNED BY PEDIDO.IDPEDIDO

INSERT INTO PEDIDO (DATA_PEDIDO,VALOR,IDVENDEDOR,IDCLIENTE) VALUES (CURRENT_DATE,130,4,4)

SELECT * FROM PEDIDO


--g. Pedido produto (verificar se é necessário)

--h. Profissão
Select max(idprofissao) + 1 from profissao;
create sequence profissao_id_seq minvalue 6;
alter table profissao alter idprofissao set default nextval('profissao_id_seq');
alter sequence profissao_id_seq owned by profissao.idprofissao;
INSERT INTO PROFISSAO (NOME) VALUES ('TESTSEQ1')
SELECT * FROM PROFISSAO

--i. Transportadora

SELECT MAX (IDTRANSPORTADORA) +1 FROM TRANSPORTADORA;
CREATE SEQUENCE TRANSPORTADORA_ID_SEQ MINVALUE 3;
ALTER TABLE TRANSPORTADORA ALTER IDTRANSPORTADORA SET DEFAULT NEXTVAL ('TRANSPORTADORA_ID_SEQ');
ALTER SEQUENCE TRANSPORTADORA_ID_SEQ OWNED BY TRANSPORTADORA.IDTRANSPORTADORA;
INSERT INTO TRANSPORTADORA (NOME) VALUES ('TESTESEQ');
SELECT * FROM TRANSPORTADORA

--j. UF
SELECT MAX (IDUF) +1 FROM UF;
CREATE SEQUENCE  UF_ID_SEQ MINVALUE 7;
ALTER TABLE UF ALTER IDUF SET DEFAULT NEXTVAL ('UF_ID_SEQ');
ALTER SEQUENCE UF_ID_SEQ OWNED BY UF.IDUF;
INSERT INTO UF (NOME,SIGLA) VALUES ('TESTESEQ','AM'); -- É OBRIGATORIO A SIGLA POIS É CHAVE PRIMAIRIA COMPOSTTA 
SELECT * FROM UF

--k. Vendedor
select max(idvendedor) + 1 from vendedor;
create sequence vendedor_id_seq minvalue 9;
alter table vendedor alter idvendedor set default nextval('vendedor_id_seq');;
alter sequence vendedor_id_seq owned by vendedor.idvendedor;
insert into vendedor (nome) values ('Teste sequência');
select * from vendedor;
--PRODUTO
Select max(idproduto) + 1 from produto;
create sequence produto_id_seq minvalue 8;
alter table produto alter idproduto set default nextval('produto_id_seq');
alter sequence produto_id_seq owned by produto.idproduto;

-- CAMPOS DEFAULT

ALTER TABLE PEDIDO ALTER COLUMN DATA_PEDIDO SET DEFAULT CURRENT_DATE; -- SETANDO DATA ATUAL
ALTER TABLE PEDIDO ALTER COLUMN VALOR SET DEFAULT 0; -- TODOS VALORES NULL SERÃO 0

INSERT INTO PEDIDO (IDCLIENTE,IDVENDEDOR) VALUES (1,1) -- TESTANDO
SELECT * FROM PEDIDO -- VERIFICANDO 

-- EXERCICIOS DEFAULT
--1. Adicione valores default na tabela de produtos do pedido
SELECT * FROM PEDIDO_PRODUTO

--a. Quantidade com o valor 1
ALTER TABLE PEDIDO_PRODUTO ALTER COLUMN QUANTIDADE SET DEFAULT 1;
--b. Valor unitário com o valor 0
ALTER TABLE PEDIDO_PRODUTO ALTER COLUMN valor_unitario SET DEFAULT 0;

-- TESTANDO SE FUNCIONOU

insert into pedido_produto (idpedido,idproduto) values (1,3)
select * from pedido_produto


--2. Adicione valor default na tabela de produtos
select * from produto
--a. Valor com o valor 0
alter table produto alter column valor set default 0;
insert into produto (nome, idfornecedor) values ('Teste default 1', 1)
insert into produto (nome, idfornecedor, valor) values ('Teste default 1', 1, 50)
select * from produto
