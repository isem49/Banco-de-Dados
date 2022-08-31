CREATE SCHEMA AGENDA;

USE AGENDA;

 CREATE TABLE CATEGORIA(
 
	id int not null primary key auto_increment,
    nome varchar(45) not null

);

CREATE TABLE CONTATO(

	ID INT NOT NULL primary KEY auto_increment,
    NOME VARCHAR(45) NOT NULL,
    EMAIL VARCHAR(45) NOT NULL,
    FONE VARCHAR(45) NOT NULL,
    CELULAR VARCHAR(45) NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    constraint fk_id_categoria foreign key (id_categoria) references CATEGORIA(id)
    
);

insert into categoria(nome) values ("AMIGOS"),("TRABALHO"),("familia");
