CREATE DATABASE bd_integradash;

USE bd_integradash;

CREATE TABLE tb_usuario (
	id BINARY(16) NOT NULL,
    id_estrategia BINARY(16) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    telefone INT(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(id), 
    FOREIGN KEY (id_estrategia) REFERENCES tb_estrategia(id) 
);

CREATE TABLE tb_estrategia (
	id BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    id_usuario BINARY(16) NOT NULL,
	nome_estrategia VARCHAR(255) NOT NULL,
    data_estrategia DATETIME(6) NOT NULL,
    descricao_estrategia VARCHAR(255) NOT NULL,
    tipo_estrategia TINYINT NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id), 
    FOREIGN KEY (id_erro) REFERENCES tb_erro(id) 
);

CREATE TABLE tb_alerta (
	id BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    nome_alerta VARCHAR(255) NOT NULL,
    nivel_criticidade CHAR(6) NOT NULL,
    data_alerta DATETIME(6) NOT NULL,
    status_alerta VARCHAR(255) NOT NULL,
    descricao_alerta VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(id),
    FOREIGN KEY (id_erro) REFERENCES tb_erro(id)
);

SELECT * FROM tb_alerta;

CREATE TABLE tb_erro (
	id BINARY(16) NOT NULL,
    nome_erro VARCHAR(255) NOT NULL,
    data_erro DATETIME(6) NOT NULL,
    status_erro VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(id)
);

SELECT * FROM tb_erro;

CREATE TABLE tb_planta_erro  (
	id_planta BINARY(16) NOT NULL,
    id_erro BINARY(16) NOT NULL,
    descricao_erro VARCHAR(255) NOT NULL, 
    
    FOREIGN KEY (id_planta) REFERENCES tb_planta(id), 
    FOREIGN KEY (id_erro) REFERENCES tb_erro(id)
);

CREATE TABLE tb_planta (
	id BINARY(16) NOT NULL,
    nome_planta VARCHAR(255) NOT NULL,
    endereco_planta VARCHAR(255) NOT NULL,
    
    PRIMARY KEY(id)
);