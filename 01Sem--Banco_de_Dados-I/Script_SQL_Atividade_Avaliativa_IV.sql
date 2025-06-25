# SCRIPT CRIAÇÃO DE BANCO DE DADOS DA ATIVIDADE AVALIATIVA IV

CREATE SCHEMA Biblioteca
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_unicode_ci;

CREATE TABLE Biblioteca.Livro(
	isbn INT NOT NULL,
	titulo VARCHAR(40) NOT NULL,
	ano INT(4) NOT NULL,
	editora VARCHAR(40) NOT NULL,
	qnt_copias INT,
	fk_cod_categoria INT NOT NULL,
	PRIMARY KEY (isbn)
); #OK

CREATE TABLE Biblioteca.Autor(
	id_autor INT NOT NULL,
	nome VARCHAR(40) NOT NULL,
	nacionalidade VARCHAR(20) NOT NULL,
	PRIMARY KEY (id_autor)
); #OK

CREATE TABLE Biblioteca.Livro_Autor(
	fk_isbn INT NOT NULL,
	fk_id_autor INT NOT NULL,
	PRIMARY KEY (fk_isbn, fk_id_autor)
); #OK

CREATE TABLE Biblioteca.Categoria(
	codigo INT NOT NULL,
	descricao VARCHAR(40) NOT NULL,
	PRIMARY KEY (codigo)
); #OK

CREATE TABLE Biblioteca.Usuario(
	matricula INT NOT NULL,
	nome VARCHAR(40) NOT NULL,
	telefone VARCHAR(11),
	PRIMARY KEY (matricula)
); #OK

CREATE TABLE Biblioteca.Locacao(
	fk_matricula INT NOT NULL,
	fk_isbn INT NOT NULL,
	data_locacao DATE NOT NULL,
	data_devolucao DATE NOT NULL,
	PRIMARY KEY (fk_matricula, fk_isbn)
); #OK



# ALTER TABLE

ALTER TABLE Biblioteca.Livro ADD CONSTRAINT fk_cod_categoria
	FOREIGN KEY (fk_cod_categoria)
	REFERENCES Biblioteca.Categoria(codigo)
	ON DELETE RESTRICT
	ON UPDATE NO ACTION;

ALTER TABLE Biblioteca.Livro_Autor ADD CONSTRAINT fk_isbn
	FOREIGN KEY (fk_isbn)
	REFERENCES Biblioteca.Livro (isbn)
	ON DELETE RESTRICT
	ON UPDATE NO ACTION;

ALTER TABLE Biblioteca.Livro_Autor ADD CONSTRAINT fk_id_autor 
	FOREIGN KEY (fk_id_autor)
	REFERENCES Biblioteca.Autor (id_autor)
	ON DELETE RESTRICT
	ON UPDATE NO ACTION;

ALTER TABLE Biblioteca.Locacao ADD CONSTRAINT fk_matricula
	FOREIGN KEY (fk_matricula)
	REFERENCES Biblioteca.Usuario (matricula)
	ON DELETE RESTRICT
	ON UPDATE NO ACTION;

ALTER TABLE Biblioteca.Locacao ADD CONSTRAINT fk_locacao_isbn
	FOREIGN KEY (fk_isbn)
	REFERENCES Biblioteca.Livro (isbn)
	ON DELETE RESTRICT
	ON UPDATE NO ACTION;



# INSERT INTO
INSERT INTO Biblioteca.Categoria (codigo, descricao) VALUES
(1, 'Romance'),
(2, 'Ficcao'),
(3, 'Historia'),
(4, 'Tecnologia'),
(5, 'Filosofia');

INSERT INTO Biblioteca.Livro (isbn, titulo, ano, editora, qnt_copias, fk_cod_categoria) VALUES
(1001, 'O Amor em Tempos Digitais', 2020, 'Editora Aurora', 3, 1),
(1002, 'A Máquina do Tempo', 1895, 'Clássicos SF', 5, 2),
(1003, 'Breve História da Humanidade', 2015, 'Editora Saber', 4, 3),
(1004, 'Algoritmos e Cafe', 2021, 'TechBooks', 2, 4),
(1005, 'O Mundo de Sofia', 1991, 'Pensar Editora', 6, 5);

INSERT INTO Biblioteca.Autor (id_autor, nome, nacionalidade) VALUES
(1, 'Juliana Costa', 'Brasileira'),
(2, 'H G Wells', 'Britanica'),
(3, 'Yuval Harari', 'Israelense'),
(4, 'Lucas Teixeira', 'Brasileira'),
(5, 'Jostein Gaarder', 'Norueguesa');


INSERT INTO Biblioteca.Livro_Autor (fk_isbn, fk_id_autor) VALUES
(1001, 1),
(1002, 2),
(1003, 3),
(1004, 4),
(1005, 5);


INSERT INTO Biblioteca.Usuario (matricula, nome, telefone) VALUES
(101, 'Ana Paula', '11987654321'),
(102, 'Carlos Henrique', '21976543210'),
(103, 'Beatriz Silva', '31965432100'),
(104, 'Joao Pedro', '41987651234'),
(105, 'Larissa Gomes', '51987456321');


INSERT INTO Biblioteca.Locacao (fk_matricula, fk_isbn, data_locacao, data_devolucao) VALUES
(101, 1001, '2025-04-01', '2025-04-15'),
(102, 1002, '2025-04-03', '2025-04-17'),
(103, 1003, '2025-04-05', '2025-04-19'),
(104, 1004, '2025-04-06', '2025-04-20'),
(105, 1005, '2025-04-07', '2025-04-21');
