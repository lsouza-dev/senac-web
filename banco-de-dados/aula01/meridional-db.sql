DROP DATABASE meridional_db;
CREATE SCHEMA meridional_db;
USE meridional_db; -- Definir que esse banco que estamos usando

-- Criação da tabela de funcionarios

CREATE TABLE IF NOT EXISTS login (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS turnos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    horaEntrada TIME NOT NULL,
    horaSaida TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS funcionarios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    funcao VARCHAR(50) NOT NULL ,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    genero VARCHAR(15) ,
    contato VARCHAR(18) NOT NULL,
    contatoEmergencia VARCHAR(18),
    idTurno INT NOT NULL,
    CONSTRAINT fk_funcionarios_turnos -- NOME DA CHAVE
    FOREIGN KEY (idTurno) -- CAMPO DA CHAVE NA TABELA ATUAL
    REFERENCES turnos (id)-- CAMPO NA TABELA DE ORIGEM
);


INSERT INTO turnos
(horaEntrada,horaSaida)
VALUES
("08:00","17:00");

SELECT * FROM turnos;

-- Inserimos 1 registro
INSERT INTO funcionarios 
(funcao,nome,documento,genero,contato,contatoEmergencia)
VALUES
("Socorrista","Matheus Thiago Manuel","123.456.789-10","Masc","(27) 99999-9999",""),
("Enfermeira","Maria","123.456.789-16","Feminino","(27) 99999-9999","(27) 88888-8888"),
("Médica","Joana","123.456.789-17","Feminino","(27) 12343-9823","");

