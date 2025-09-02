CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    isbn BIGINT NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(255)
);

CREATE TABLE livro_categoria (
    id_livro_categoria INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_categoria INT,
    FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    dt_emprestimo DATE,
    dt_devolucao DATE,
    dt_limite DATE,
    dt_devolvida DATE
);

CREATE TABLE emprestimo_livro (
    id_emprestimo_livro INT AUTO_INCREMENT PRIMARY KEY,
    id_emprestimo INT,
    id_livro INT,
    FOREIGN KEY (id_emprestimo) REFERENCES emprestimo (id_emprestimo),
    FOREIGN KEY (id_livro) REFERENCES livro (id_livro)
);

CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(255),
    dt_nascimento DATE,
    bibliografia VARCHAR(255)
);

CREATE TABLE livro_autor (
    id_livro_autor INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    id_autor INT,
    FOREIGN KEY (id_livro) REFERENCES livro (id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor (id_autor)
);

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    num_ident INT,
    endereco VARCHAR(255),
    email VARCHAR(255),
    dt_cadastro DATE
);

CREATE TABLE associacao (
    id_associacao INT AUTO_INCREMENT PRIMARY KEY,
    nome_associacao VARCHAR(255)
);

CREATE TABLE usuario_associacao (
    id_usuario_associacao INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_associacao INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_associacao) REFERENCES associacao(id_associacao)
);

-- Livros
INSERT INTO livro (titulo, isbn, descricao) VALUES
('Dom Quixote', 1234567890, 'Romance clássico espanhol'),
('1984', 2345678901, 'Distopia futurista'),
('O Senhor dos Anéis', 3456789012, 'Fantasia épica'),
('A Revolução dos Bichos', 4567890123, 'Fábula política'),
('O Pequeno Príncipe', 5678901234, 'Filosofia infantil'),
('Harry Potter', 6789012345, 'Fantasia juvenil'),
('O Código Da Vinci', 7890123456, 'Suspense e religião'),
('It: A Coisa', 8901234567, 'Terror psicológico'),
('A Metamorfose', 9012345678, 'Transformação existencial'),
('Capitães da Areia', 1122334455, 'Juventude marginalizada');

-- Categorias
INSERT INTO categoria (nome_categoria) VALUES
('Romance'), ('Ficção Científica'), ('Fantasia'), ('Política'),
('Infantil'), ('Suspense'), ('Terror'), ('Clássico'),
('Aventura'), ('Drama');

-- Livro-Categoria
INSERT INTO livro_categoria (id_livro, id_categoria) VALUES
(1,1), (1,8), (2,2), (2,4), (3,3), (4,4), (5,5), (6,3), (7,6), (8,7),
(9,8), (10,9);

-- Autores
INSERT INTO autor (nome_autor, dt_nascimento, bibliografia) VALUES
('Miguel de Cervantes', '1547-09-29', 'Escritor espanhol'),
('George Orwell', '1903-06-25', 'Autor britânico'),
('J.R.R. Tolkien', '1892-01-03', 'Filólogo e escritor inglês'),
('Antoine de Saint-Exupéry', '1900-06-29', 'Piloto e escritor francês'),
('J.K. Rowling', '1965-07-31', 'Autora britânica'),
('Dan Brown', '1964-06-22', 'Autor americano'),
('Stephen King', '1947-09-21', 'Mestre do terror'),
('Franz Kafka', '1883-07-03', 'Autor tcheco'),
('Jorge Amado', '1912-08-10', 'Autor brasileiro'),
('Clarice Lispector', '1920-12-10', 'Autora brasileira');

-- Livro-Autor
INSERT INTO livro_autor (id_livro, id_autor) VALUES
(1,1), (2,2), (3,3), (4,2), (5,4), (6,5), (7,6), (8,7), (9,8), (10,9);

-- Usuários
INSERT INTO usuario (nome, num_ident, endereco, email, dt_cadastro) VALUES
('Ana Souza', 1001, 'Rua A, 123', 'ana@gmail.com', '2022-01-10'),
('Bruno Lima', 1002, 'Rua B, 456', 'bruno@gmail.com', '2022-02-11'),
('Carlos Silva', 1003, 'Rua C, 789', 'carlos@gmail.com', '2022-03-12'),
('Daniela Rocha', 1004, 'Rua D, 101', 'daniela@gmail.com', '2022-04-13'),
('Eduardo Santos', 1005, 'Rua E, 202', 'eduardo@gmail.com', '2022-05-14'),
('Fernanda Oliveira', 1006, 'Rua F, 303', 'fernanda@gmail.com', '2022-06-15'),
('Gabriel Costa', 1007, 'Rua G, 404', 'gabriel@gmail.com', '2022-07-16'),
('Helena Pires', 1008, 'Rua H, 505', 'helena@gmail.com', '2022-08-17'),
('Igor Matos', 1009, 'Rua I, 606', 'igor@gmail.com', '2022-09-18'),
('Juliana Mendes', 1010, 'Rua J, 707', 'juliana@gmail.com', '2022-10-19');

-- Associações
INSERT INTO associacao (nome_associacao) VALUES
('Estudantes'), ('Professores'), ('Comunidade'), ('Pesquisadores'),
('Visitantes'), ('Funcionários'), ('Alumni'), ('Voluntários'),
('Bibliotecários'), ('Gestores');

-- Usuário-Associação
INSERT INTO usuario_associacao (id_usuario, id_associacao) VALUES
(1,1), (2,2), (3,3), (4,1), (5,4), (6,5), (7,6), (8,7), (9,8), (10,9);

-- Empréstimos
INSERT INTO emprestimo (dt_emprestimo, dt_devolucao, dt_limite, dt_devolvida) VALUES
('2023-01-10', '2023-01-17', '2023-01-20', '2023-01-15'),
('2023-02-05', '2023-02-12', '2023-02-15', '2023-02-14'),
('2023-03-01', '2023-03-08', '2023-03-10', '2023-03-09'),
('2023-04-10', NULL, '2023-04-17', NULL), -- Em aberto
('2023-05-20', NULL, '2023-05-27', NULL), -- Em aberto
('2023-06-15', '2023-06-22', '2023-06-25', '2023-06-23'),
('2023-07-01', '2023-07-08', '2023-07-10', '2023-07-09'),
('2023-08-03', NULL, '2023-08-10', NULL), -- Em aberto
('2023-09-10', '2023-09-17', '2023-09-20', '2023-09-18'),
('2023-10-12', NULL, '2023-10-19', NULL); -- Em aberto

-- Empréstimo-Livro
INSERT INTO emprestimo_livro (id_emprestimo, id_livro) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7), (8,8), (9,9), (10,10);

SELECT * FROM livro;
SELECT * FROM categoria;
SELECT * FROM livro_categoria;
SELECT * FROM autor;
SELECT * FROM livro_autor;
SELECT * FROM usuario;
SELECT * FROM associacao;
SELECT * FROM usuario_associacao;
SELECT * FROM emprestimo;
SELECT * FROM emprestimo_livro;
