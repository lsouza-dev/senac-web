-- Lista de Exercícios: Chave Estrangeira e Consultas 
CREATE SCHEMA IF NOT EXISTS atividades_db;
USE atividades_db;

-- Crie a tabela alunos com 
-- id (chave primária com auto incremento), 
-- nome obrigatório 
-- email único.

CREATE TABLE IF NOT EXISTS alunos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Crie a tabela cursos 
-- id, 
-- titulo obrigatório
-- carga_horaria.

CREATE TABLE IF NOT EXISTS cursos (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL UNIQUE ,
    carga_horaria INT 
);

-- Crie a tabela professores 
-- id, 
-- nome obrigatório e 
-- especialidade.


CREATE TABLE IF NOT EXISTS professores (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(150) NOT NULL
);

-- Insira pelo menos 3 registros em cada tabela.
INSERT INTO alunos
(nome, email)
VALUES
("Marlon","marlon@gmail.com"),
("Maicon","maicon@gmail.com"),
("Anelize","anelize@gmail.com"),
("Fernando","fernando@gmail.com"),
("Matheus","matheus@gmail.com"),
("Thiago","thiago@gmail.com");

INSERT INTO cursos
(titulo,carga_horaria)
VALUES
("Programador WEB",300),
("Técnico em Desenvolvimento de Sistemas",1200),
("Engenharia de Software",3600);

INSERT INTO professores
(nome,especialidade)
VALUES
("Jefferson Mendes","Administração"),
("Helena Matos","Bio Medicina"),
("Daiana Castro","Finanças");

-- Tente inserir dois alunos com o mesmo email. O que acontece?

-- Tente inserir um curso sem titulo. Qual erro aparece?
INSERT INTO cursos
(carga_horaria)
VALUES
(20);

-- Parte 2: chave estrangeira

-- Crie a tabela matriculas 
-- id, 
-- aluno_id, 
-- curso_id, 
-- data_matricula 
-- nota. 
-- Declare aluno_id e curso_id como chaves estrangeiras.

SELECT * FROM alunos;

CREATE TABLE IF NOT EXISTS matriculas (
	id  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATETIME NOT NULL,
    nota FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT fk_matriculas_alunos
    FOREIGN KEY (aluno_id)
    REFERENCES alunos (id),
    CONSTRAINT fk_matriculas_cursos
    FOREIGN KEY (curso_id)
    REFERENCES cursos ( id )
);

-- Tente matricular um aluno que não existe. Explique o erro.





INSERT INTO matriculas
(aluno_id,curso_id,data_matricula,nota)
VALUES
(4,1,"2026-10-28 12:00",10);


SELECT * FROM matriculas;

DELETE FROM matriculas
WHERE id = 3;

DELETE FROM alunos
WHERE id = 6;

-- Insira uma matrícula válida e depois tente excluir o aluno dessa matrícula. O que acontece?

-- Crie a tabela disciplinas com 
-- professor_id como chave estrangeira para professores. Que tipo de relacionamento existe entre professor e disciplina?

CREATE TABLE IF NOT EXISTS disciplinas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    titulo VARCHAR(100) NOT NULL
);

INSERT INTO disciplinas 
(titulo)
VALUES
("Front-end"),
("Back-end"),
("Design");

CREATE TABLE IF NOT EXISTS professores_disciplinas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_disciplina INT NOT NULL,
    id_professor INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    
    -- CHAVE ESTRANGEIRA DE DISCIPLINA
    CONSTRAINT fk_professores_disciplinas_disciplina -- Nome da Chave
    FOREIGN KEY (id_disciplina) --  Campo nessa tabela que vai receber o Id da tabela de Disciplinas
    REFERENCES disciplinas (id), -- Tabela e chave que será usada
    
    -- CHAVE ESTRANGEIRA DE PROFESSOR
    CONSTRAINT fk_professores_disciplinas_professor
    FOREIGN KEY (id_professor)
    REFERENCES professores (id)
);


INSERT INTO professores_disciplinas
(id_disciplina,id_professor,data_inicio,data_fim)
VALUES
(1,1,"2026-10-01","2026-10-31"),
(2,1,"2026-09-01","2026-09-30"),
(3,1,"2026-08-01","2026-08-29"),
(1,2,"2026-10-01","2026-10-31"),
(2,2,"2026-09-01","2026-09-30"),
(3,2,"2026-08-01","2026-08-29");



-- Parte 3: ON DELETE e ON UPDATE

-- Crie a tabela avaliacoes ligada a matriculas 
-- com ON DELETE CASCADE. Exclua uma matrícula e observe o que acontece.


CREATE TABLE IF NOT EXISTS avaliacoes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50) NOT NULL,
    id_matricula INT NOT NULL,
    nota FLOAT NOT NULL DEFAULT 0,
    
    CONSTRAINT fk_avaliacoes_matriculas
    FOREIGN KEY (id_matricula)
    REFERENCES matriculas (id)
    ON UPDATE
    
);

INSERT INTO avaliacoes 
(titulo,id_matricula,nota)
VALUES
("Deploy de Aplicações",4,10),
("Desenvolvimento Front-end",4,6),
("Github",4,9),
("Desenvolvimento de API",4,10),
("Github",5,6),
("Desenvolvimento de API",5,3);


-- Crie a tabela anotacoes ligada a cursos 
-- com ON DELETE SET NULL, usando uma coluna que aceite NULL. Exclua um curso e observe.

-- Tente excluir um curso que tem matrículas usando a regra padrão (RESTRICT). O que acontece?

-- Crie uma chave estrangeira com ON UPDATE CASCADE 
-- e altere o id de um curso. 
-- Os registros filhos acompanham a mudança?



-- Parte 4: desafios de consultas

-- Liste o nome do aluno e o título do curso de cada matrícula.

SELECT
matriculas.id,
alunos.nome,
alunos.email,
cursos.titulo,
matriculas.nota
FROM matriculas -- CONSULTA NA TABELA DE MATRICULAS

INNER JOIN cursos  -- QUAL TABELA EU TAMBÉM QUERO CONSULTAR
ON matriculas.curso_id = cursos.id -- QUAIS COLUNAS SE RELACIONAM

INNER JOIN alunos
ON matriculas.aluno_id = alunos.id;


SELECT * FROM matriculas,cursos;

SELECT * FROM cursos
WHERE id = 1;



-- Liste todos os alunos, inclusive os que não têm nenhuma matrícula.

-- Quantas matrículas existem em cada curso? Inclua os cursos sem matrícula.

-- Quais alunos estão matriculados em mais de um curso?

-- Qual a média de nota de cada curso? Mostre apenas os cursos com média acima de 7.

-- Liste todos os professores e as disciplinas que ministram, incluindo os professores sem disciplina.

-- Desafio: liste os alunos que nunca fizeram um curso com carga horária maior que 60.

-- Desafio: para cada curso, mostre o aluno com a maior nota. 


SELECT
avaliacoes.id,
avaliacoes.titulo,
avaliacoes.nota,
matriculas.id,
alunos.*,
cursos.*
FROM avaliacoes
INNER JOIN matriculas
ON avaliacoes.id_matricula = matriculas.id
INNER JOIN alunos
ON alunos.id = matriculas.aluno_id
INNER JOIN cursos
ON cursos.id = matriculas.curso_id;




