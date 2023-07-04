--1. Crie um banco de dados chamado BIBLIOTECA.
CREATE DATABASE BIBLIOTECA

-- 2. Crie uma tabela chamada EDITORA, de acordo com os dados abaixo:

CREATE TABLE EDITORA (
    IDEDITORA SERIAL NOT NULL,
    NOME VARCHAR (50) NOT NULL,

    CONSTRAINT PK_EDT_IDEDITORA PRIMARY KEY (IDEDITORA),
    CONSTRAINT UN_EDT_NOME UNIQUE (NOME)
)

-- 3. Insira os dados abaixo na tabela EDITORA.

INSERT INTO EDITORA (NOME) VALUES ('Bookman');
INSERT INTO EDITORA (NOME) VALUES ('Edgard Blusher');
INSERT INTO EDITORA (NOME) VALUES ('Nova Terra');
INSERT INTO EDITORA (NOME) VALUES ('Brasport');

-- Crie uma tabela chamada CATEGORIA, de acordo com os dados abaixo:

CREATE TABLE CATEGORIA (
    IDCATEGORIA SERIAL NOT NULL,
    NOME VARCHAR (50) NOT NULL,

    CONSTRAINT PK_CTG_IDCATEGORIA PRIMARY KEY (IDCATEGORIA),
    CONSTRAINT UN_CTG_NOME UNIQUE (NOME)
	)
    
--5. Insira os dados abaixo na tabela CATEGORIA.

INSERT INTO CATEGORIA (NOME) VALUES ('Banco de Dados');
INSERT INTO CATEGORIA (NOME) VALUES ('HTML');
INSERT INTO CATEGORIA (NOME) VALUES ('Java');
INSERT INTO CATEGORIA (NOME) VALUES ('PHP');

SELECT * FROM CATEGORIA

-- 6. Crie uma tabela chamada AUTOR, de acordo com os dados abaixo:

CREATE TABLE AUTOR (
    IDAUTOR SERIAL NOT NULL,
    NOME VARCHAR (50) NOT NULL,

    CONSTRAINT PK_ATR_IDAUTOR PRIMARY KEY (IDAUTOR),
    CONSTRAINT UN_AUT_NOME UNIQUE (NOME)

)

--7. Insira os dados abaixo na tabela AUTOR.
INSERT INTO AUTOR (NOME) VALUES ('Waldemar Setzer');
INSERT INTO AUTOR (NOME) VALUES ('Flávio Soaresr');
INSERT INTO AUTOR (NOME) VALUES ('John Watson');
INSERT INTO AUTOR (NOME) VALUES ('Rui Rossi dos Santos');
INSERT INTO AUTOR (NOME) VALUES ('Antonio Pereira de Resende');
INSERT INTO AUTOR (NOME) VALUES ('Claudiney Calixto Lima');
INSERT INTO AUTOR (NOME) VALUES ('Evandro Carlos Teruel');
INSERT INTO AUTOR (NOME) VALUES ('Ian Graham');
INSERT INTO AUTOR (NOME) VALUES ('Fabrício Xavier');
INSERT INTO AUTOR (NOME) VALUES ('Pablo Dalloglio');

SELECT IDAUTOR, NOME FROM AUTOR


--8. Crie uma tabela chamada LIVRO, de acordo com os dados abaixo:

CREATE TABLE LIVRO (
    IDLIVRO SERIAL NOT NULL,
    IDEDITORA INTEGER NOT NULL,
    IDCATEGORIA INTEGER NOT NULL,
    NOME VARCHAR (50) NOT NULL,
    
    CONSTRAINT PK_LVR_IDLIVRO PRIMARY KEY (IDLIVRO),
    CONSTRAINT FK_LVR_IDEDITORA FOREIGN KEY (IDEDITORA) REFERENCES EDITORA (IDEDITORA),
    CONSTRAINT FK_LVR_IDCATEGORIA FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIA (IDCATEGORIA),
    CONSTRAINT UN_LVR_NOME UNIQUE (NOME)
);

--9. Insira os dados abaixo na tabela LIVRO.

-- EDITORA
-- BOOKMAN 1, EDGAR 2, 3 NOVA TERRA, 4 BRASPORT
-- CATEGORIA 
-- BANCO DE DADOS 1, HTML 2, JAVA 3, PHP 4
SELECT * FROM LIVRO
ALTER TABLE LIVRO ALTER COLUMN NOME TYPE VARCHAR (70);
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (2,1,'Banco de Dados – 1 Edição');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (1,1, 'Oracle DataBase 11G');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (3,3,'Programação de Computadores em Java');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (4,3,'Programação Orientada a Aspectos em Java');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (4,2,'HTML5 – Guia Prático');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (3,2,'XHTML: Guia de Referência para Desenvolvimento na Web');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (1,4,'PHP para Desenvolvimento Profissional');
INSERT INTO LIVRO (IDEDITORA,IDCATEGORIA,NOME) VALUES (2,4,'PHP com Programação Orientada a Objetos');

ALTER TABLE LIVRO ALTER COLUMN NOME TYPE VARCHAR (70); -- PROBLEMA COM NOME DO LIVRO MUITO GRANDE
SELECT * FROM LIVRO

--10. Crie uma tabela chamada LIVRO_AUTOR, de acordo com os dados abaixo:

CREATE TABLE LIVRO_AUTOR (
    IDLIVRO INTEGER NOT NULL,
    IDAUTOR INTEGER NOT NULL,

    CONSTRAINT PK_LTR_IDLIVROAUTOR PRIMARY KEY (IDLIVRO,IDAUTOR),
    CONSTRAINT FK_LTR_IDLIVRO FOREIGN KEY (IDLIVRO) REFERENCES LIVRO (IDLIVRO),
    CONSTRAINT FK_LTR_IDAUTOR FOREIGN KEY (IDAUTOR) REFERENCES AUTOR (IDAUTOR)
);

--11. Insira os dados abaixo na tabela LIVRO_AUTOR. 
select idlivro, nome from livro
select idautor, nome from autor
SELECT * FROM LIVRO_AUTOR
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (1,1);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (1,2);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (2,10);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (4,4);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (4,5);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (8,6);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (9,7);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (10,8);
INSERT INTO LIVRO_AUTOR (IDLIVRO, IDAUTOR) VALUES (11,9);

-- ATUALIZADO DIA 31/05 POR ERRO NAS PK.

--12.Crie uma tabela chamada ALUNO, de acordo com os dados abaixo:
CREATE TABLE ALUNO (
    IDALUNO SERIAL NOT NULL,
    NOME VARCHAR (50) NOT NULL,

    CONSTRAINT PK_ALN_IDALUNO PRIMARY KEY (IDALUNO)
);
SELECT * FROM ALUNO -- VERIFICAÇÃO SE ESTÁ TUDO CERTO
ALTER TABLE ALUNO ADD CONSTRAINT UN_ALN_NOME UNIQUE (NOME); -- NÃO COLOQUEI UNIQUE NO NOME
INSERT INTO ALUNO (NOME) VALUES ('Mario');
INSERT INTO ALUNO (NOME) VALUES ('João');
INSERT INTO ALUNO (NOME) VALUES ('Pedro');
INSERT INTO ALUNO (NOME) VALUES ('Paulo');
INSERT INTO ALUNO (NOME) VALUES ('Maria');


--14. Crie uma tabela chamada EMPRESTIMO, de acordo com os dados abaixo:
CREATE TABLE EMPRESTIMO (
    IDEMPRESTIMO SERIAL NOT NULL,
    IDALUNO INTEGER NOT NULL,
    DATA_EMPRESTIMO DATE NOT NULL DEFAULT CURRENT_DATE,
    DATA_DEVOLUÇÃO DATE NOT NULL, 
    VALOR FLOAT  NOT NULL,
    DEVOLVIDO CHAR (1) NOT NULL,

    CONSTRAINT PK_EMP_IDEMPRESTIMO PRIMARY KEY (IDEMPRESTIMO),
    CONSTRAINT FK_EMP_IDALUNO FOREIGN KEY (IDALUNO) REFERENCES ALUNO (IDALUNO)
	
 -- CORRIGINDO O AO
ALTER TABLE emprestimo RENAME COLUMN DATA_DEVOLUÇÃO TO DATA_DEVOLUCAO;

);

--15. Insira os dados abaixo na tabela EMPRESTIMO.
-- 1.Mario 2.João 3.Pedro 4.Paulo 5.Maria

INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(1,'2012-05-02','2012-05-12',10,'S');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(1,'2012-04-23','2012-05-03',5,'N');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(2,'2012-05-10','2012-05-20',12,'N');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(4,'2012-05-10','2012-05-20',8,'S');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(3,'2012-05-05','2012-05-15',15,'N');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(3,'2012-05-07','2012-05-17',20,'S');
INSERT INTO EMPRESTIMO (IdAluno, DATA_EMPRESTIMO, DATA_DEVOLUCAO,VALOR ,DEVOLVIDO) VALUES 
(3,'2012-05-08','2012-05-18',5,'S');

--16. Crie uma tabela chamada EMPRESTIMO_LIVRO, de acordo com os dados abaixo:

CREATE TABLE EMPRESTIMO_LIVRO (
    IDEMPRESTIMO INTEGER NOT NULL,
    IDLIVRO INTEGER NOT NULL,

    CONSTRAINT PK_ELV_IDEMPRESTIMOLIVRO PRIMARY KEY (IDEMPRESTIMO,IDLIVRO),
    CONSTRAINT FK_ELV_IDEMPRESTIMO FOREIGN KEY (IDEMPRESTIMO) REFERENCES EMPRESTIMO (IDEMPRESTIMO),
    CONSTRAINT FK_ELV_IDLIVRO FOREIGN KEY (IDLIVRO) REFERENCES LIVRO (IDLIVRO)
);

--17. Insira os dados abaixo na tabela EMPRESTIMO_LIVRO.
select * from aluno -- DESCOBRIR O IDALUNO
SELECT * FROM LIVRO -- O IDLIVRO
select * from emprestimo -- DIA DO EMPRESTIMO

INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (1,1);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (2,4);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (2,3);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (3,2);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (3,10);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (4,8);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (5,4);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (6,9);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (6,1);
INSERT INTO EMPRESTIMO_LIVRO (IDEMPRESTIMO,IDLIVRO) VALUES (7,11);
-- 18. Crie os seguintes índices:

--DATA EMPRESTIMO NA TABELA EMPRESTIMO
CREATE INDEX IDX_EMP_DATA_EMPRESTIMO ON EMPRESTIMO (DATA_EMPRESTIMO);
-- DATA DEVOLUÇÃO MA TABELA EMPRESTIMO
CREATE INDEX IDX_EMP_DATA_DEVOLUCAO ON EMPRESTIMO (DATA_DEVOLUCAO);

--CONSULTAS SIMPLES--
--19. O nome dos autores em ordem alfabética.
SELECT * FROM AUTOR ORDER BY NOME ; 
--20. O nome dos alunos que começam com a letra P.
SELECT * FROM AUTOR WHERE NOME LIKE 'P%';
--21. O nome dos livros da categoria Banco de Dados ou Java.
SELECT * FROM LIVRO WHERE IDCATEGORIA = 1 OR IDCATEGORIA = 2;
--22. O nome dos livros da editora Bookman.
SELECT * FROM LIVRO WHERE IDEDITORA = 1;
--23. Os empréstimos realizados entre 05/05/2012 e 10/05/2012.
SELECT * FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-05' AND '2012-05-10'
--24. Os empréstimos que não foram feitos entre 05/05/2012 e 10/05/2012
SELECT * FROM EMPRESTIMO WHERE DATA_EMPRESTIMO NOT BETWEEN '2012-05-05' AND '2012-05-10'
-- 25.Os empréstimos que os livros já foram devolvidos.
SELECT * FROM EMPRESTIMO WHERE DEVOLVIDO = 'S'

--CONSULTAS COM AGRUPAMENTO SIMPLES-- 

--26. A quantidade de livros.
SELECT COUNT (IDLIVRO) FROM LIVRO;
--27. O somatório do valor dos empréstimos.
SELECT SUM(valor) FROM EMPRESTIMO;
--28. A média do valor dos empréstimos.
SELECT AVG (valor) FROM EMPRESTIMO;
--29. O maior valor dos empréstimos
SELECT MAX(VALOR) FROM EMPRESTIMO;
--30. O menor valor dos empréstimos.
SELECT MIN (VALOR) FROM EMPRESTIMO;
--31. O somatório do valor do empréstimo que estão entre 05/05/2012 e 10/05/2012.
SELECT SUM(VALOR) FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-05' AND '2012-05-10';
--32. A quantidade de empréstimos que estão entre 01/05/2012 e 05/05/2012.
SELECT COUNT (IDEMPRESTIMO) FROM EMPRESTIMO WHERE DATA_EMPRESTIMO BETWEEN '2012-05-01' AND '2012-05-10';

--CONSULTAS COM JOIN #CRIAÇÃO DE VIEWS#--


--33.O nome do livro, a categoria e a editora (LIVRO) – fazer uma view
create view dados_livros as
SELECT
lvr.nome as LIVRO,
ctr.nome as CATEGORIA,
edt.nome as EDITORA
FROM
livro lvr
LEFT OUTER JOIN
categoria as ctr on lvr.idcategoria = ctr.idcategoria
LEFT OUTER JOIN
editora as edt on lvr.ideditora = edt.ideditora;

--34. O nome do livro e o nome do autor (LIVRO_AUTOR) – fazer uma view.
--select * from livro_autor
--select * from livro

create view livros_dados as
SELECT
livro.nome as NOME_LIVRO,
autor.nome as AUTOR

FROM
livro_autor
LEFT outer JOIN
livro on livro_autor.idautor = livro.idlivro
LEFT OUTER JOIN
autor on livro_autor.idautor = autor.idautor
--35. O nome dos livros do autor Ian Graham (LIVRO_AUTOR).
--select * from livro
--select * from autor where idautor = '7'

SELECT livro.nome

FROM livro_autor

LEFT OUTER JOIN livro ON livro_autor.idlivro = livro.idlivro

WHERE livro_autor.idautor = 7;

--36. O nome do aluno, a data do empréstimo e a data de devolução (EMPRESTIMO).
--select * from aluno
--select * from emprestimo

select 
aluno.nome,
emprestimo.data_emprestimo,
emprestimo.data_devolucao

from aluno

left outer join
emprestimo on aluno.idaluno = emprestimo.idaluno

--37. O nome de todos os livros que foram emprestados (EMPRESTIMO_LIVRO).
--select * from livro
--select * from emprestimo_livro

select 
distinct (livro.nome) -- é utilizado para retornar apenas uma ocorrência de campos que contenham dados repetidos.
from
emprestimo_livro
left outer join
livro on emprestimo_livro.idlivro = livro.idlivro
-- CONSULTAS COM AGRUPAMENTO + JOIN --
--38. O nome da editora e a quantidade de livros de cada editora (LIVRO).

SELECT 
      editora.nome AS LIVRO,
      count (livro.idlivro) as QUANTIDADE

FROM 
       livro
left outer join
        editora on livro.ideditora = editora.ideditora
GROUP BY 
         editora.nome
-- 39. O nome da categoria e a quantidade de livros de cada categoria (LIVRO).
select * from livro
SELECT 
      categoria.nome AS CATEGORIA,
	  count (livro.idcategoria) AS QUANTIDADE
FROM 
       CATEGORIA
LEFT OUTER JOIN
       LIVRO ON CATEGORIA.idcategoria = LIVRO.idcategoria
-- 40. O nome do autor e a quantidade de livros de cada autor (LIVRO_AUTOR).
SELECT * FROM autor

SELECT
      autor.nome as AUTOR,
      count (livro_autor.idlivro) AS QUANTIDADE_LIVROS
FROM 
       livro_autor
left outer join
       autor on livro_autor.idautor = autor.idautor
group by
       autor.nome

-- 41. O nome do aluno e a quantidade de empréstimo de cada aluno (EMPRESTIMO_LIVRO).
SELECT 
aluno.nome,
count (emprestimo_livro.idemprestimo)
FROM 
     EMPRESTIMO_LIVRO
inner join
aluno on emprestimo_LIVRO.idemprestimo = aluno.idaluno
group by
aluno.nome
-- 42. O nome do aluno e o somatório do valor total dos empréstimos de cada aluno (EMPRESTIMO).
select * from emprestimo
SELECT
     aluno.nome as ALUNO,
SUM (emprestimo.valor) as VALOR_TOTAL
FROM 
     emprestimo
LEFT OUTER JOIN
     aluno on emprestimo.idaluno = aluno.idaluno
GROUP BY
     aluno.nome
-- 43. o somatório do valor total dos empréstimos de cada aluno somente daqueles que o somatório for maior do que 7,00 (EMPRESTIMO).
SELECT
     aluno.nome as ALUNO,
SUM (emprestimo.valor) as VALOR_TOTAL
FROM 
     emprestimo
LEFT OUTER JOIN
     aluno on emprestimo.idaluno = aluno.idaluno
GROUP BY
     aluno.nome
having sum(emprestimo.valor) > 7

-- CONSULTAS COMANDOS DIVERSOS

--44. O nome de todos os alunos em ordem decrescente e em letra maiúscula.
SELECT UPPER (NOME) FROM ALUNO ORDER BY NOME DESC;

--45. Os empréstimos que foram feitos no mês 04 de 2012.

SELECT * from emprestimo
WHERE EXTRACT (month from data_emprestimo) = 4 AND EXTRACT (year from data_emprestimo) = 2012

-- 46. Todos os campos do empréstimo. Caso já tenha sido devolvido, mostrar a mensagem “Devolução completa”, senão “Em atraso”.
SELECT *,
CASE DEVOLVIDO
WHEN 'S' THEN 'DEVOLUÇÃO COMPLETA'
WHEN 'N' THEN 'EM ATRASO'
END as STATUS
FROM
   EMPRESTIMO
-- 47. Somente o caractere 5 até o caractere 10 do nome dos autores.
select nome ,
substring (nome from 5 for 10) 
from autor

--48. O valor do empréstimo e somente o mês da data de empréstimo. Escreva “Janeiro”, “Fevereiro”, etc
SELECT * FROM EMPRESTIMO

SELECT 
    valor,
    data_emprestimo,
    CASE EXTRACT(MONTH FROM data_emprestimo)
        WHEN 1 THEN 'JANEIRO'
        WHEN 2 THEN 'FEVEREIRO'
        WHEN 3 THEN 'MARÇO'
        WHEN 4 THEN 'ABRIL'
        WHEN 5 THEN 'MAIO'
        WHEN 6 THEN 'JUNHO'
        WHEN 7 THEN 'JULHO'
        WHEN 8 THEN 'AGOSTO'
        WHEN 9 THEN 'SETEMBRO'
        WHEN 10 THEN 'OUTUBRO'
        WHEN 11 THEN 'NOVEMBRO'
        WHEN 12 THEN 'DEZEMBRO'
    END AS mes
FROM emprestimo;

-- SUBCONSULTAS

--49. A data do empréstimo e o valor dos empréstimos que o valor seja maior que a média de todos os empréstimos.
SELECT 
     DATA_EMPRESTIMO,
	 VALOR
FROM EMPRESTIMO
WHERE VALOR > (SELECT AVG (VALOR) FROM EMPRESTIMO)
--50. A data do empréstimo e o valor dos empréstimos que possuem mais de um livro.
SELECT 
emp.DATA_EMPRESTIMO,
emp.VALOR,
 (select count (elv.idemprestimo) from emprestimo_livro elv where elv.idemprestimo = emp.idemprestimo) 
FROM EMPRESTIMO emp
--51. A data do empréstimo e o valor dos empréstimos que o valor seja menor que a soma de todos os empréstimos.
SELECT
DATA_EMPRESTIMO,
VALOR
FROM EMPRESTIMO
WHERE VALOR < (SELECT SUM (VALOR) FROM EMPRESTIMO)