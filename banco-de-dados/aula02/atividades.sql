-- Lista de Exercícios: Chave Estrangeira e Consultas 

-- Crie a tabela alunos com id (chave primária com auto incremento), nome obrigatório e email único.

-- Crie a tabela cursos com id, titulo obrigatório e carga_horaria.

-- Crie a tabela professores com id, nome obrigatório e especialidade.

-- Insira pelo menos 3 registros em cada tabela.

-- Tente inserir dois alunos com o mesmo email. O que acontece?

-- Tente inserir um curso sem titulo. Qual erro aparece?




-- Parte 2: chave estrangeira

-- Crie a tabela matriculas com id, aluno_id, curso_id, data_matricula e nota. Declare aluno_id e curso_id como chaves estrangeiras.

-- Tente matricular um aluno que não existe. Explique o erro.

-- Insira uma matrícula válida e depois tente excluir o aluno dessa matrícula. O que acontece?

-- Crie a tabela disciplinas com professor_id como chave estrangeira para professores. Que tipo de relacionamento existe entre professor e disciplina?

-- Reflexão: por que matriculas guarda aluno_id em vez do nome do aluno?



-- Parte 3: ON DELETE e ON UPDATE

-- Crie a tabela avaliacoes ligada a matriculas com ON DELETE CASCADE. Exclua uma matrícula e observe o que acontece.

-- Crie a tabela anotacoes ligada a cursos com ON DELETE SET NULL, usando uma coluna que aceite NULL. Exclua um curso e observe.

-- Tente excluir um curso que tem matrículas usando a regra padrão (RESTRICT). O que acontece?

-- Crie uma chave estrangeira com ON UPDATE CASCADE e altere o id de um curso. Os registros filhos acompanham a mudança?



-- Parte 4: desafios de consultas

-- Liste o nome do aluno e o título do curso de cada matrícula.

-- Liste todos os alunos, inclusive os que não têm nenhuma matrícula.

-- Quantas matrículas existem em cada curso? Inclua os cursos sem matrícula.

-- Quais alunos estão matriculados em mais de um curso?

-- Qual a média de nota de cada curso? Mostre apenas os cursos com média acima de 7.

-- Liste todos os professores e as disciplinas que ministram, incluindo os professores sem disciplina.

-- Desafio: liste os alunos que nunca fizeram um curso com carga horária maior que 60.

-- Desafio: para cada curso, mostre o aluno com a maior nota. 
