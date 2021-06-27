-- Database: dbkopp

-- DROP DATABASE dbkopp;

CREATE DATABASE dbkopp
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- SCHEMA: kopp

-- DROP SCHEMA kopp ;

CREATE SCHEMA kopp
    AUTHORIZATION postgres;


-- Criação das Tabelas
CREATE TABLE kopp.Situacao(
	situacao_id INT GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(255) NOT NULL,
	PRIMARY KEY(situacao_id)
);

CREATE TABLE kopp.Equipamento(
	equipamento_id INT GENERATED ALWAYS AS IDENTITY,
	descricao VARCHAR(255) NOT NULL,
	latitude float,
	longitude float,
	PRIMARY KEY(equipamento_id)
);


CREATE TABLE kopp.RemessaInfracao(
	remessa_id INT GENERATED ALWAYS AS IDENTITY,
	total_infracao INT NOT NULL,
	situacao_id INT NOT NULL,
	PRIMARY KEY(remessa_id),
	CONSTRAINT fk_situacao
      FOREIGN KEY(situacao_id) 
	  	REFERENCES kopp.Situacao(situacao_id)
);

CREATE TABLE kopp.Infracao(
   	infracao_id INT GENERATED ALWAYS AS IDENTITY,
	remessa_id INT NOT NULL,
   	numero INT NOT NULL,
   	datahora TIMESTAMP NOT NULL, 
   	equipamento_ID INT NOT NULL,
   	velocidade_permitida float NOT NULL,
	velocidade_medida float NOT NULL,
	infracao_valida BIT NOT NULL,
   	PRIMARY KEY(infracao_id),
	CONSTRAINT fk_remessa
      FOREIGN KEY(remessa_id) 
	  	REFERENCES kopp.RemessaInfracao(remessa_id),
	CONSTRAINT fk_equipamento
      FOREIGN KEY(equipamento_id) 
	  	REFERENCES kopp.Equipamento(equipamento_id)
);

-- Situações
INSERT INTO  kopp.Situacao(Descricao) VALUES ('Criada');
INSERT INTO  kopp.Situacao(Descricao) VALUES ('Expedida');
INSERT INTO  kopp.Situacao(Descricao) VALUES ('Aceita');
INSERT INTO  kopp.Situacao(Descricao) VALUES ('Não Aceita');

-- Equipamentos
INSERT INTO  kopp.equipamento(Descricao, latitude, longitude) VALUES ('Equipamento 1', 41.51251, 3.12314);
INSERT INTO  kopp.equipamento(Descricao, latitude, longitude) VALUES ('Equipamento 2', 27.54321, 2.16531);
INSERT INTO  kopp.equipamento(Descricao, latitude, longitude) VALUES ('Equipamento 3', 32.51235, 1.51251);
INSERT INTO  kopp.equipamento(Descricao, latitude, longitude) VALUES ('Equipamento 4', 46.32158, 5.42143);
INSERT INTO  kopp.equipamento(Descricao, latitude, longitude) VALUES ('Equipamento 5', 17.14238, 8.17403);

-- Remessas
INSERT INTO  kopp.RemessaInfracao(total_infracao, situacao_ID) VALUES (0, 1);
INSERT INTO  kopp.RemessaInfracao(total_infracao, situacao_ID) VALUES (0, 1);
INSERT INTO  kopp.RemessaInfracao(total_infracao, situacao_ID) VALUES (0, 3);
INSERT INTO  kopp.RemessaInfracao(total_infracao, situacao_ID) VALUES (0, 4);
INSERT INTO  kopp.RemessaInfracao(total_infracao, situacao_ID) VALUES (0, 2);

-- Infrações
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(1, 2627, '2016-06-22 19:10:25', 1, 80.0, 100.0, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(1, 4675, '2017-04-18 14:57:25', 1, 60.0, 120.0, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(1, 6570, '2017-06-22 08:10:25', 3, 80.0, 97.4, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(1, 3072, '2018-06-22 14:10:25', 3, 60.0, 61.0, B'0');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(1, 2175, '2016-04-28 15:10:25', 4, 80.0, 80.1, B'0');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(2, 8908, '2019-07-22 07:10:25', 4, 110.0, 112.2, B'0');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(2, 1626, '2019-01-22 17:10:25', 2, 80.0, 150.0, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(2, 6552, '2020-04-02 09:10:25', 5, 110.0, 237.0, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(3, 7626, '2020-12-25 12:10:25', 5, 60.0, 74.5, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(3, 5661, '2021-03-15 11:10:25', 2, 80.0, 96.4, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(3, 5430, '2019-05-13 22:10:25', 3, 80.0, 85.2, B'1');
INSERT INTO  kopp.Infracao(remessa_id, numero, datahora, equipamento_id, velocidade_permitida, velocidade_medida, infracao_valida)
VALUES 	(4, 1422, '2020-02-15 22:10:25', 1, 80.0, 80.3, B'0');

-- Atualizar total de infrações presentes em cada remessa (informação pode ser obtida também através de um select exterior com count de infracoes vinculadas pela remessa_id, não necessitando a existência deste campo)
UPDATE kopp.remessainfracao
	set total_infracao = (SELECT COUNT(*) FROM kopp.infracao infracao where infracao.remessa_id = 1)
WHERE
	kopp.remessainfracao.remessa_id = 1;
	
UPDATE kopp.remessainfracao
	set total_infracao = (SELECT COUNT(*) FROM kopp.infracao infracao where infracao.remessa_id = 2)
WHERE
	kopp.remessainfracao.remessa_id = 2;
	
UPDATE kopp.remessainfracao
	set total_infracao = (SELECT COUNT(*) FROM kopp.infracao infracao where infracao.remessa_id = 3)
WHERE
	kopp.remessainfracao.remessa_id = 3;
	
UPDATE kopp.remessainfracao
	set total_infracao = (SELECT COUNT(*) FROM kopp.infracao infracao where infracao.remessa_id = 4)
WHERE
	kopp.remessainfracao.remessa_id = 4;
	
UPDATE kopp.remessainfracao
	set total_infracao = (SELECT COUNT(*) FROM kopp.infracao infracao where infracao.remessa_id = 5)
WHERE
	kopp.remessainfracao.remessa_id = 5;
	
-- SELECTS

-- Infrações com velocidade medida acima de 20% da máxima permitida
SELECT * FROM kopp.Infracao WHERE (velocidade_permitida * 120 / 100) < velocidade_medida ORDER BY datahora asc

-- Remessas com identificador, situacao, totais de infrações, total válidas, total inválidas
SELECT remessa.remessa_id, situacao.descricao situacao, remessa.total_infracao, 
count(infracao.infracao_valida) filter (where infracao.infracao_valida = B'1') infracao_valida,
count(infracao.infracao_valida) filter (where infracao.infracao_valida = B'0') infracao_invalida
FROM kopp.RemessaInfracao Remessa
left join kopp.situacao situacao on situacao.situacao_id = remessa.situacao_id 
left join kopp.Infracao infracao on remessa.remessa_id = infracao.remessa_id
GROUP BY
remessa.remessa_id, situacao.descricao, remessa.total_infracao
ORDER BY 
situacao.descricao

-- VERSÃO PREFERIDA: Remessas com identificador, situacao, totais de infrações, total válidas, total inválidas utilizando APENAS counts para total de infrações!
SELECT remessa.remessa_id, situacao.descricao situacao, 
count(infracao.infracao_id) total_infracao,
count(infracao.infracao_valida) filter (where infracao.infracao_valida = B'1') infracao_valida,
count(infracao.infracao_valida) filter (where infracao.infracao_valida = B'0') infracao_invalida
FROM kopp.RemessaInfracao Remessa
left join kopp.situacao situacao on situacao.situacao_id = remessa.situacao_id 
left join kopp.Infracao infracao on remessa.remessa_id = infracao.remessa_id
GROUP BY
remessa.remessa_id, situacao.descricao
ORDER BY 
situacao.descricao

