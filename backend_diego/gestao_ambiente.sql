DROP DATABASE IF EXISTS Gestão_Ambiente;
CREATE DATABASE Gestão_Ambiente;
USE  Gestão_Ambiente;
CREATE TABLE Usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
email VARCHAR(255),
telefone VARCHAR(20),
tipo ENUM('ADM','Porteiro'),
senha CHAR(6));

CREATE TABLE Turmas(
id_turmas INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_turma VARCHAR(40) NOT NULL
); 

CREATE TABLE Ambientes(
id_ambientes INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(40) NOT NULL,
descrição VARCHAR(225)
);    

CREATE TABLE Instrutores(
id_instrutor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(60) NOT NULL,
email VARCHAR(255),
telefone VARCHAR(20)
);

CREATE TABLE Registros(
id_registro INT PRIMARY KEY AUTO_INCREMENT,

id_ambiente INT NOT NULL,
id_instrutor INT NOT NULL,
id_turma INT NOT NULL,

data_inicio DATETIME NOT NULL,
data_fim DATETIME NOT NULL,

CONSTRAINT fk_ambiente 
FOREIGN KEY (id_ambiente) REFERENCES Ambientes(id_ambientes) 
ON DELETE RESTRICT,

CONSTRAINT fk_instrutor 
FOREIGN KEY (id_instrutor) REFERENCES Instrutores(id_instrutor) 
ON DELETE RESTRICT,

CONSTRAINT fk_turma 
FOREIGN KEY (id_turma) REFERENCES Turmas(id_turmas) 
ON DELETE RESTRICT
);

INSERT INTO Usuarios(nome,email,telefone,tipo,senha) 
VALUES ('Weberton','weberton@gmail.com','(32) 91234-5678','ADM','123456'), ('Sidney','sidney@gmail.com','(32) 91234-5678','Porteiro','123456');

INSERT INTO Ambientes(nome,descrição) 
VALUES ('Sala 420', '42 é a resposta de todas as coisas'), ('Sala 410', '41 é um número malvado');

INSERT INTO Turmas(nome_turma)
VALUES ('Análise e Desenvolvimento de Sistemas'), ('Informática');

INSERT INTO Instrutores(nome,email,telefone)
VALUES ('Diego','diego@gmail.com','(32) 91234-5678'), ('Wesley','wesley@gmail.com','(32) 91234-5678');

SELECT * FROM Usuarios;
SELECT * FROM Ambientes;
SELECT * FROM Turmas;
SELECT * FROM Instrutores;