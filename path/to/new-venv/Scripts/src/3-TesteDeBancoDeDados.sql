-- Database: Contabilidade

-- DROP DATABASE IF EXISTS "Contabilidade";

CREATE DATABASE "Contabilidade"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt-BR'
    LC_CTYPE = 'pt-BR'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

-- Create a new database
CREATE DATABASE my_database;

-- Use the newly created database
USE my_database;

-- Create a new table within the database
CREATE TABLE Relatorio_cadop (
Registro_ANS serial PRIMARY KEY NOT NULL,
CNPJ bigint,
Razao_Social VARCHAR (255),
Nome_Fantasia VARCHAR (255),
Modalidade VARCHAR (50),
Logradouro VARCHAR (50),
Numero varchar (50),
Complemento VARCHAR (50),
Bairro VARCHAR (50),
Cidade VARCHAR (50),
UF VARCHAR (2),
CEP VARCHAR (8),
DDD INT,
Telefone VARCHAR (20),
Fax VARCHAR (20),
Endereco_eletrônico VARCHAR (255),
Representante VARCHAR (50),
Cargo_Representante VARCHAR (50),
Regiao_de_Comercializacao INT,
Data_Registro_ANS TIMESTAMP NOT NULL
);

CREATE TABLE "1T2023" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "2T2023" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "3T2023" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "4T2023" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "1T2024" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "2T2024" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "3T2024" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

CREATE TABLE "4T2024" (
T12023_ID serial PRIMARY KEY NOT NULL,
DATA_REGISTRO TIMESTAMP,
REG_ANS integer REFERENCES Relatorio_cadop(Registro_ANS),
CD_CONTA_CONTABIL integer,
DESCRICAO VARCHAR(255),
VL_SALDO_INICIAL FLOAT(15),
VL_SALDO_FINAL FLOAT(15)
);

COPY Relatorio_cadop FROM 'C:/Users/Public/Relatorio_cadop.csv' DELIMITER ';' CSV HEADER;

COPY temp_table FROM 'C:/Users/Public/1T2024.csv' DELIMITER ',' CSV HEADER;
CREATE TEMP TABLE temp_table (
    data_registro TIMESTAMP WITHOUT TIME ZONE,
    reg_ans INTEGER NOT NULL,
    cd_conta_contabil integer,
    descricao CHARACTER VARYING(255),
    vl_saldo_inicial REAL,
    vl_saldo_final REAL
);

INSERT INTO "1T2023" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "2T2023" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "3T2023" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "4T2023" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "1T2024" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "2T2024" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "3T2024" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

INSERT INTO "41T2024" (data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final)
SELECT data_registro, reg_ans, cd_conta_contabil, descricao, vl_saldo_inicial, vl_saldo_final
FROM temp_table
WHERE reg_ans IN (SELECT registro_ans FROM relatorio_cadop);

--Query analítica que busca as 10 empresas que tiveram as maiores despesas no último trimestre
SELECT 
    t42024.t42024_id, 
    relatorio_cadop.razao_social,
    t42024.descricao,
	SUM(t42024.vl_saldo_final - t42024.vl_saldo_inicial) AS "10_maiores_despesas"
FROM 
    "4T2024" t42024
INNER JOIN 
    Relatorio_cadop ON t42024.reg_ans = relatorio_cadop.registro_ans
WHERE 
    t42024.descricao LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR%'
GROUP BY 
    t42024.t42024_id, relatorio_cadop.razao_social, t42024.descricao
ORDER BY 
    "10_maiores_despesas" DESC
LIMIT 10;

--A consulta principal seleciona os campos desejados da subquery t e realiza a agregação usando SUM.