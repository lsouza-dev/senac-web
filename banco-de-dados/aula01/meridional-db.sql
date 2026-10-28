CREATE SCHEMA meridional_db; -- Criação do banco de dados
USE meridional_db; -- Definir que esse banco que estamos usando

-- Criação da tabela de funcionarios
CREATE TABLE IF NOT EXISTS funcionarios(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    funcao VARCHAR(50) NOT NULL ,
    nome VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL,
    genero VARCHAR(15) ,
    contato VARCHAR(18) NOT NULL,
    contatoEmergencia VARCHAR(18)
);

-- Inserimos 1 registro
INSERT INTO funcionarios 
(funcao,nome,documento,genero,contato,contatoEmergencia)
VALUES
("Socorrista","Matheus Thiago Manuel","123.456.789-10","Masc","(27) 99999-9999","");

-- CREATE =  Criação
-- SELECT = Consultas de dados

-- SELECT [ O QUE VOCÊ QUER VER]
-- FROM [ TABELA ]
-- CONDIÇÕES DE PESQUISA

-- Selecionando todos os usuários e colunas
SELECT id,nome,documento 
FROM funcionarios;


INSERT INTO funcionarios
(funcao,nome,documento,genero,contato,contatoEmergencia)
VALUES
("Enfermeira","Maria","123.456.789-16","Feminino","(27) 99999-9999","(27) 88888-8888"),
("Médica","Joana","123.456.789-17","Feminino","(27) 12343-9823","");

-- Reset da tabela
TRUNCATE funcionarios;

-- Alteração de 1 campo específico da tabela
ALTER TABLE funcionarios
MODIFY COLUMN documento VARCHAR(20) NOT NULL UNIQUE;


-- Atualização de um funcionário
UPDATE funcionarios
SET nome = "Usuário de teste" , funcao = "Testezinho 123";
-- WHERE id = 3
-- WHERE documento = "123.456.789-10"


-- Deleção de um funcionário
DELETE FROM funcionarios
WHERE id = 3;





-- CRIAR UMA TABELA DE USUÁRIOS PARA FAZER UM LOGIN

/*
	CREATE TABLE ...... (
		atributo CARACTERISTICAS,
        atributo2 CARACTERISTICAS
    );
*/

-- DROP TABLE funcionarios;

SELECT *
FROM login
WHERE email = "..." AND senha = "...";


