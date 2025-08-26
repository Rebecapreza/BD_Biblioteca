create database biblioteca;
use biblioteca;

create table livro(
	id_livro int auto_increment primary key,
    titulo varchar(255) not null,
    isbn int not null,
    descricao varchar(255) not null
);

create table categoria(
	id_categoria int auto_increment primary key,
    nome_categoria varchar(255)
);

create table livro_categoria(
	id_livro_categoria int auto_increment primary key,
    id_livro int,
    id_categoria int,
    foreign key (id_livro) references livro (id_livro),
    foreign key (id_categoria) references categoria (id_categoria)
);

create table emprestimo (
	id_emprestimo int auto_increment primary key,
    dt_emprestimo date,
    dt_devolucao date,
    dt_limite date,
    dt_devolvida date
);

create table emprestimo_livro(
	id_emprestimo_livro int auto_increment primary key,
    id_emprestimo int,
    id_livro int,
    foreign key (id_emprestimo) references emprestimo (id_emprestimo),
    foreign key(id_livro) references livro (id_livro)
);

create table autor(
	id_autor int auto_increment primary key,
    nome_autor varchar(255),
    dt_nascimento date,
    bibliografia varchar(255)
);