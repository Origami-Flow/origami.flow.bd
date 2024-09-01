
CREATE DATABASE IF NOT EXISTS salgado_trancas;
USE salgado_trancas;


CREATE TABLE IF NOT EXISTS tipo_de_cabelo (
  id_tipo_de_cabelo INT PRIMARY KEY,
  tipo VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS tipo_genero (
  id_genero INT PRIMARY KEY,
  genero VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS usuario (
  id_usuario INT PRIMARY KEY auto_increment,
  nome VARCHAR(100) NOT NULL,
  dt_nascimento DATE,
  email VARCHAR(100) NOT NULL UNIQUE,
  senha VARCHAR(255),
  id_google VARCHAR(255),
  telefone VARCHAR(20),
  tipo_de_cabelo_id INT,
  tipo_genero_id INT,
  FOREIGN KEY (tipo_de_cabelo_id) 
    REFERENCES tipo_de_cabelo (id_tipo_de_cabelo),
  FOREIGN KEY (tipo_genero_id) 
    REFERENCES tipo_genero (id_genero)
);


CREATE TABLE IF NOT EXISTS trancista (
  id_trancista INT PRIMARY KEY auto_increment,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  senha VARCHAR(255),
  id_google VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS status_agendamento (
  id_status INT PRIMARY KEY,
  status VARCHAR(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS agendamento (
  id_agendamento INT PRIMARY KEY auto_increment,
  data DATETIME NOT NULL,
  tipo_tranca VARCHAR(100) NOT NULL,
  valor_pago DECIMAL(10, 2) NOT NULL,
  valor_sinal DECIMAL(10, 2),
  usuario_id INT,
  trancista_id INT,
  status_agendamento_id INT,
  FOREIGN KEY (usuario_id) 
    REFERENCES usuario (id_usuario),
  FOREIGN KEY (trancista_id) 
    REFERENCES trancista (id_trancista),
  FOREIGN KEY (status_agendamento_id) 
    REFERENCES status_agendamento (id_status)
);


CREATE TABLE IF NOT EXISTS produto (
  id_produto INT PRIMARY KEY auto_increment,
  nome VARCHAR(100) NOT NULL,
  quantidade INT NOT NULL,
  marca VARCHAR(100),
  descricao TEXT
);


CREATE TABLE IF NOT EXISTS avaliacao_usuario (
  id_avaliacao INT PRIMARY KEY auto_increment,
  avaliacao VARCHAR(255),
  nota INT NOT NULL,
  usuario_id INT,
  FOREIGN KEY (usuario_id) 
    REFERENCES usuario (id_usuario)
);



/* INSERTS DO BANCO */

INSERT INTO tipo_de_cabelo VALUES
(1,'1'),
(2,'2A'),
(3,'2B'),
(4,'2C'),
(5,'3A'),
(6,'3B'),
(7,'3C'),
(8,'4A'),
(9,'4B'),
(10,'4C');

INSERT INTO tipo_genero VALUES
(1,'Masculino'),
(2,'Feminino'),
(3,'Outro');

INSERT INTO status_agendamento VALUES 
(1,'Agendado'),
(2,'Cancelado'),
(3,'Concluido');

