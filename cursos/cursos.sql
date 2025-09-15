CREATE DATABASE cursos;
USE cursos;

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE papel_professor (
    id_papel_professor INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    papel_professor VARCHAR(255),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255)
);

CREATE TABLE professor_curso (
    id_professor_curso INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT,
    id_curso INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE modulo (
    id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT,
    titulo VARCHAR(255),
    ordem INT,
    cargaHoraria INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE perfil_aluno (
    id_perfil_aluno INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT UNIQUE,
    dt_nascimento DATE,
    biografia TEXT,
    foto BLOB,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE plano (
    id_plano INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT UNIQUE,
    plano VARCHAR(255),
    descricaoPlano TEXT,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

CREATE TABLE inscricao (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    dt_inscricao DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE situacao (
    id_situacao INT AUTO_INCREMENT PRIMARY KEY,
    id_inscricao INT,
    status VARCHAR(255),
    data_status DATE,
    FOREIGN KEY (id_inscricao) REFERENCES inscricao(id_inscricao)
);

INSERT INTO professor (id_professor, nome) VALUES 
(NULL, 'Márcia'), 
(NULL, 'Mariany'), 
(NULL, 'Israel');


INSERT INTO papel_professor VALUES 
(NULL, 1, 'Titular'),
(NULL, 1, 'Tutor'),
(NULL, 2, 'Assistente');

INSERT INTO curso (nome) VALUES 
('Programação Básica'),
('Banco de Dados Avançado'),
('Desenvolvimento Web');

INSERT INTO professor_curso VALUES
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 3);

INSERT INTO modulo (id_curso, titulo, ordem, cargaHoraria) VALUES
(1, 'Introdução à Programação', 1, 10),
(1, 'Estruturas de Controle', 2, 15),
(2, 'Modelagem de Dados', 1, 12);

INSERT INTO aluno (nome, email) VALUES
('Ana Silva', 'ana.silva@email.com'),
('Bruno Costa', 'bruno.costa@email.com'),
('Carla Dias', 'carla.dias@email.com');

INSERT INTO perfil_aluno (id_aluno, dt_nascimento, biografia, foto) VALUES
(1, '1990-05-15', 'Apaixonada por tecnologia.', NULL),
(2, '1985-10-30', 'Entusiasta de bancos de dados.', NULL),
(3, '1998-12-20', 'Fã de desenvolvimento web.', NULL);

INSERT INTO plano (id_aluno, plano, descricaoPlano) VALUES
(1, 'Premium', 'Acesso total a cursos e materiais.'),
(2, 'Básico', 'Acesso limitado a alguns cursos.'),
(3, 'Premium', 'Acesso total a cursos e materiais.');

INSERT INTO inscricao (id_aluno, id_curso, dt_inscricao) VALUES
(1, 1, '2025-09-12'),
(2, 2, '2025-09-13'),
(3, 3, '2025-09-14');

INSERT INTO situacao (id_inscricao, status, data_status) VALUES
(1, 'Ativa', '2025-09-12'),
(2, 'Concluída', '2025-09-30'),
(3, 'Trancada', '2025-09-20');

SELECT * FROM professor; 
SELECT * FROM papel_professor; 
SELECT * FROM curso; 
SELECT * FROM professor_curso; 
SELECT * FROM modulo; 
SELECT * FROM aluno; 
SELECT * FROM perfil_aluno; 
SELECT * FROM plano; 
SELECT * FROM inscricao; 
SELECT * FROM situacao; 