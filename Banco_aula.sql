-- Criar e usar DATABASE

create database oficina;
use oficina;

-- Criar tabelas:

CREATE TABLE Empresa (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);
CREATE TABLE Departamento (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Departamento VARCHAR(45) NOT NULL,
    descricao_Departamento VARCHAR(100) NOT NULL,
    id_EMPRESA INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (id_Empresa)
        REFERENCES Empresa (idEmpresa)
);
CREATE TABLE Funcionario (
    idFuncionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(45) NOT NULL,
    cpf_funcionario VARCHAR(11),
    id_Departamento INT NOT NULL,
    CONSTRAINT fk_idDepartamento_funcionario FOREIGN KEY (id_departamento)
        REFERENCES departamento (iddepartamento),
    idendereco INT,
    CONSTRAINT fk_endereco_funcionario FOREIGN KEY (idendereco)
        REFERENCES endereco (idendereco)
);
CREATE TABLE telefone (
    idtelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(13) NOT NULL,
    ddd VARCHAR(45),
    idFuncionario INT,
    idCliente INT,
    CONSTRAINT fk_Funcionario_Telefone FOREIGN KEY (idfuncionario)
        REFERENCES funcionario (idFuncionario),
    CONSTRAINT FK_Cliente_Telefone FOREIGN KEY (IdCliente)
        REFERENCES cliente (idcliente)
);
CREATE TABLE endereco (
    idendereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(45) NOT NULL,
    numeroCasa VARCHAR(45)
);
CREATE TABLE cliente (
    idcliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45) NOT NULL,
    cpf_cliente VARCHAR(11),
    idendereco INT,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (idendereco)
        REFERENCES endereco (idendereco)
);
CREATE TABLE servico (
    idServico INT NOT NULL AUTO_INCREMENT KEY,
    nome_servico VARCHAR(45),
    recursos VARCHAR(200)
);
CREATE TABLE OS (
    idOS INT NOT NULL AUTO_INCREMENT KEY,
    datasolicitacao VARCHAR(10),
    dataprevisao DATE,
    respostas VARCHAR(45),
    id_funcionario INT NOT NULL,
    id_departamento INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_funcionario_OS FOREIGN KEY (id_funcionario)
        REFERENCES Funcionario (idFuncionario),
    CONSTRAINT fk_departamento_OS FOREIGN KEY (id_departamento)
        REFERENCES departamento (idDepartamento),
    CONSTRAINT fk_cliente_OS FOREIGN KEY (id_cliente)
        REFERENCES Cliente (idCliente)
);
CREATE TABLE Itens_OS (
    idServico INT NOT NULL,
    idOS INT NOT NULL,
    CONSTRAINT fk_idServico_itens FOREIGN KEY (idservico)
        REFERENCES servico (idservico),
    CONSTRAINT fk_idos_itens FOREIGN KEY (idos)
        REFERENCES os (idos),
    PRIMARY KEY (IdServico , idOS)
);

-- Criar index:

create index idx_servico on ITENS_OS(IdServico);
create index idx_os on ITENS_OS(IdOS);
create index idx_idos on os(idos);
create index idx_idservico on servico(idservico);
create index idx_idcliente on cliente(idcliente);
create index idx_idtelefone on telefone(idtelefone);
create index idx_idderpatamento on departamento(idDepartamento);
create index idx_Idfuncionario on funcionario(idfuncionario);
create index idx_idendereco on endereco(idendereco);
create index IDX_idempresa on empresa(idEmpresa);

-- Dropar uma tabela:

drop table OS;
drop table servico;
drop table cliente;
drop table empresa;
drop table departamento;
drop table funcionario;
drop table telefone;
drop table endereco;
drop table itens_os;

-- Insert: 

insert into Empresa (nome_empresa, tipo) values ("IFBA","Não sei");
insert into servico (nome_servico,recursos) values ("TESTE","Não sei");
insert into endereco (rua, numerocasa) values ("rua sei lá","111");
insert into endereco (rua, numerocasa) values ("rua sei222 lá","113331");
insert into departamento (nome_Departamento,descricao_departamento,id_empresa) values ("teste","dsadsadssdasdds","1");
insert into cliente (nome_cliente,cpf_cliente,idendereco,idade) values ("teste","2332313","1",19);
insert into funcionario (nome_funcionario,cpf_funcionario,id_departamento,idendereco) values ("farias","1323123213","1","2");
insert into telefone (numero,ddd,idcliente) values (32333321,55,3);
insert into itens_os (idservico,idos) values (1,1);
insert into itens_os (idservico,idos) values (2,2);
insert into itens_os (idservico,idos) values (3,3);
insert into os (datasolicitacao,dataprevisao,respostas,id_funcionario,id_departamento,id_cliente) values (20/5,21/5,"sdsadads",1,1,1);
insert into os (datasolicitacao,dataprevisao,respostas,id_funcionario,id_departamento,id_cliente) values (20/6,21/6,"sdsaddsdasads",2,2,2);
insert into os (datasolicitacao,dataprevisao,respostas,id_funcionario,id_departamento,id_cliente) values (20/7,21/7,"sdsadads",3,3,3);
insert into os (datasolicitacao,dataprevisao,respostas,id_funcionario,id_departamento,id_cliente) values (22/3,2/1,"sdsadads",4,1,1);
insert into telefone (numero,ddd,idfuncionario) values (323123321,55,1);
insert into servico (nome_servico,recursos) values ("TESTE2","Não sei");
insert into servico (nome_servico,recursos) values ("TESTE3","Não sei");
insert into funcionario (nome_funcionario,cpf_funcionario,id_departamento,idendereco) values ("ricardo","1323123213","1","2");
insert into funcionario (nome_funcionario,cpf_funcionario,id_departamento,idendereco) values ("teste","1323123213","1","2");
INSERT INTO departamento (nome_Departamento,descricao_Departamento,id_empresa)
VALUES
  ("Vestibulum ut","sit amet ante. Vivamus non lorem",1),
  ("aliquam eros","lectus ante dictum mi, ac",1),
  ("ac arcu.","tempus non, lacinia at, iaculis quis, pede. Praesent",1),
  ("egestas, urna","pellentesque a, facilisis non, bibendum",1),
  ("Phasellus nulla.","Cras interdum. Nunc sollicitudin commodo ipsum. Suspendisse non leo.",1),
  ("ultricies ornare,","tincidunt aliquam arcu. Aliquam ultrices iaculis odio. Nam interdum",1),
  ("fermentum convallis","vulputate, posuere vulputate, lacus. Cras interdum. Nunc",1),
  ("Duis ac","Vivamus molestie dapibus ligula. Aliquam erat",1),
  ("aliquam adipiscing","aliquam iaculis, lacus pede",1),
  ("nec tempus","massa. Vestibulum accumsan neque et nunc.",1);
INSERT INTO endereco (rua,numeroCasa,idendereco)
VALUES
  ("consectetuer adipiscing","tellus. Suspendisse sed dolor.",4),
  ("Fusce dolor","hendrerit a, arcu. Sed et libero. Proin mi. Aliquam",8),
  ("nibh sit","sem. Pellentesque ut ipsum ac mi eleifend",5),
  ("odio, auctor","nibh. Quisque nonummy ipsum non arcu. Vivamus",9),
  ("fermentum arcu.","amet diam eu dolor egestas rhoncus. Proin nisl",6),
  ("hendrerit consectetuer,","Curae Donec tincidunt. Donec vitae",7),
  ("Aliquam erat","est arcu ac orci. Ut semper pretium neque. Morbi",3);
INSERT INTO funcionario (nome_funcionario,cpf_funcionario,id_departamento,idendereco,idfuncionario)
VALUES
  ("ac nulla.","Donec tempus, lorem fringilla ornare placerat, orci lacus vestibulum",3,9,2),
  ("tempus risus.","Sed nec metus",3,3,3),
  ("nunc sed","rutrum, justo. Praesent luctus. Curabitur egestas nunc",11,7,5),
  ("commodo ipsum.","pellentesque eget, dictum placerat, augue.",4,3,6),
  ("odio. Phasellus","adipiscing elit. Aliquam auctor,",10,6,7),
  ("urna. Nunc","vitae, orci. Phasellus dapibus quam quis diam.",2,4,8),
  ("pharetra. Nam","mauris. Suspendisse aliquet molestie tellus. Aenean",10,7,9),
  ("ligula. Aliquam","sodales nisi magna",8,4,10),
  ("enim. Sed","turpis egestas. Fusce",10,4,11),
  ("blandit at,","orci. Donec nibh. Quisque nonummy ipsum non arcu. Vivamus",10,5,12);
INSERT INTO cliente (nome_cliente,cpf_cliente,idade,idendereco,idcliente)
VALUES
  ("ac, feugiat","tellus eu augue porttitor","lobortis, nisi nibh lacinia orci, consectetuer euismod est",3,2),
  ("enim. Nunc","ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt orci","vitae sodales nisi magna sed dui.",4,4),
  ("porttitor vulputate,","urna et arcu imperdiet ullamcorper. Duis at","Etiam vestibulum massa rutrum magna. Cras convallis",9,5),
  ("eget nisi","Mauris molestie pharetra nibh. Aliquam ornare, libero","quam. Pellentesque habitant morbi tristique senectus",9,6),
  ("sociis natoque","erat volutpat. Nulla","Nullam feugiat placerat velit. Quisque varius. Nam porttitor",5,7),
  ("lectus, a","sem magna nec quam. Curabitur vel lectus. Cum sociis","scelerisque dui. Suspendisse ac",8,8),
  ("lorem, luctus","dolor. Fusce mi lorem,","dolor elit, pellentesque a, facilisis non, bibendum sed, est.",4,9),
  ("Ut semper","lectus ante dictum mi, ac mattis velit","In lorem. Donec elementum, lorem ut aliquam",8,10),
  ("est ac","parturient montes, nascetur ridiculus mus. Proin","at auctor ullamcorper, nisl arcu iaculis",3,11),
  ("Vivamus sit","Morbi vehicula. Pellentesque tincidunt tempus risus. Donec","Proin dolor. Nulla semper tellus id nunc interdum feugiat.",7,12);
INSERT INTO os (dataSolicitacao,dataPrevisao,respostas,id_Funcionario,id_Departamento,id_Cliente)
	VALUES
		("8810602","5267141","accan",11,3,7),
		("5692563","5508452","ullcorper. Duis",9,2,3),
		("5458850","5486447","vaus",3,4,6),
		("7811506","1557365","ante",4,4,4),
		("5366658","2420844","Proin eget odio.",8,8,3),
		("6981392","4515169","interdum ligula",9,9,4),
		("7552328","5361334","aliquam arcu.",23,3,11),
		("4202783","8652123","felis.",3,1,5),
		("3328810","7483937","faucibus ut,",6,5,3),
		("4852322","6701426","nisl. Quisque",4,10,3);
INSERT INTO Servico (nome_Servico,recursos)
	VALUES
		("dolor","sed"),
		("hendrerit.","posuere"),
		("arcu.","augue ac"),
		("nulla","lectus convallis est,"),
		("sollicitudin","eu neque"),
		("blandit","mi"),
		("mollis","per conubia nostra,"),
		("ligula","ullamcorper eu,"),
		("Integer","Ut sagittis"),
		("ac,","porttitor");
INSERT INTO itens_OS (idServico,idOS)
	VALUES
		(2,45),
		(3,46),
		(4,47),
		(5,48),
		(6,49),
		(7,50),
		(8,51),
		(9,52),
		(10,53),
		(11,54);

-- Alterar tabela:

alter table cliente add idade varchar(100);

-- Selecionar uma tabela:

SELECT * FROM itens_os;
SELECT * FROM SERVICO;
SELECT * FROM endereco;
SELECT * FROM empresa;
SELECT * FROM departamento;
SELECT * FROM cliente; 
SELECT * FROM funcionario;
SELECT * FROM os;
SELECT * FROM telefone;
SELECT c.nome_cliente, c.cpf_cliente, t.numero, e.rua FROM cliente c, telefone t, endereco e WHERE c.idcliente = t.idcliente AND c.idendereco = e.idendereco;
SELECT * FROM os, CLIENTE;
SELECT f.nome_funcionario, s.nome_servico FROM funcionario f, servico s, os os , itens_os i  where 
	f.idfuncionario = os.id_funcionario and
    s.idservico =	i.idservico and
    os.idos = i.idos;
    
-- Modificar atributos de uma tablea

UPDATE cliente  SET nome_Cliente = "teste" WHERE idCliente = 3;
DELETE FROM cliente WHERE idcliente = 2;
DELETE FROM funcionario WHERE idfuncionario = 4;

-- Select Join:

-- Listar os serviços realizados por um determinado departamento:

SELECT 
    d.idDepartamento, d.nome_Departamento, s.nome_Servico
FROM
    servico s
        INNER JOIN
    Itens_OS i ON i.idServico = s.idServico
        INNER JOIN
    OS os ON i.idOS = os.idOS
        INNER JOIN
    Departamento d ON d.idDepartamento = os.id_Departamento;
    
-- Listar os funcionários que já realizaram algum tipo de serviço:

SELECT 
   f.nome_Funcionario, f.idFuncionario,  s.nome_Servico
FROM
    servico s
        INNER JOIN
    Itens_OS i ON i.idServico = s.idServico
        INNER JOIN
    OS os ON i.idOS = os.idOS
        INNER JOIN
    Funcionario f ON f.idFuncionario = os.id_Funcionario;
     
-- Saber quais clientes já realizaram determinado serviço:

SELECT 
   s.nome_Servico, c.idCliente, c.nome_Cliente
FROM
    servico s
        INNER JOIN
    Itens_OS i ON i.idServico = s.idServico
        INNER JOIN
    OS os ON i.idOS = os.idOS
        INNER JOIN
    Cliente c ON c.idCliente = os.id_Cliente;


SELECT 
    MAX(idfuncionario)
FROM
    funcionario;


SELECT 
    min(idfuncionario)
FROM
    funcionario;

SELECT 
    COUNT(Idcliente)
FROM
    cliente;
    
SELECT 
    AVG(idfuncionario)
FROM
    funcionario;

SELECT 
    id_funcionario, COUNT(*)
FROM
    OS
GROUP BY
	IDOS;

