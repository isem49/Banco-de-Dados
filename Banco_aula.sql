use oficina;

create database oficina;

CREATE TABLE Empresa (
    idEmpresa INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(120) NOT NULL,
    tipo VARCHAR(45)
);

create index IDX_idempresa on empresa(idEmpresa);

drop table empresa;

CREATE TABLE Departamento (
    idDepartamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_Departamento VARCHAR(45) NOT NULL,
    descricao_Departamento VARCHAR(100) NOT NULL,
    id_EMPRESA INT NOT NULL,
    CONSTRAINT fk_idEmpresa_departamento FOREIGN KEY (id_Empresa)
        REFERENCES Empresa (idEmpresa)
);

create index idx_idderpatamento on departamento(idDepartamento);

drop table departamento;

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

create index idx_Idfuncionario on funcionario(idfuncionario);

drop table funcionario;

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

create index idx_idtelefone on telefone(idtelefone);

drop table telefone;

CREATE TABLE endereco (
    idendereco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(45) NOT NULL,
    numeroCasa VARCHAR(45)
);

create index idx_idendereco on endereco(idendereco);

drop table endereco;

CREATE TABLE cliente (
    idcliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(45) NOT NULL,
    cpf_cliente VARCHAR(11),
    idendereco INT,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (idendereco)
        REFERENCES endereco (idendereco)
);

alter table cliente add idade varchar(100);

create index idx_idcliente on cliente(idcliente);

drop table cliente;

CREATE TABLE servico (
    idServico INT NOT NULL AUTO_INCREMENT KEY,
    nome_servico VARCHAR(45),
    recursos VARCHAR(200)
);

create index idx_idservico on servico(idservico);

drop table servico;

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


create index idx_idos on os(idos);

drop table OS;


CREATE TABLE Itens_OS (
    idServico INT NOT NULL,
    idOS INT NOT NULL,
    CONSTRAINT fk_idServico_itens FOREIGN KEY (idservico)
        REFERENCES servico (idservico),
    CONSTRAINT fk_idos_itens FOREIGN KEY (idos)
        REFERENCES os (idos),
    PRIMARY KEY (IdServico , idOS)
);

create index idx_servico on ITENS_OS(IdServico);
create index idx_os on ITENS_OS(IdOS);

drop table itens_os;

-- Insert:

insert into Empresa (nome_empresa, tipo) values ("IFBA","Não sei");

insert into servico (nome_servico,recursos) values ("TESTE","Não sei");

insert into endereco (rua, numerocasa) values ("rua sei lá","111");

insert into endereco (rua, numerocasa) values ("rua sei222 lá","113331");

SELECT 
    *
FROM
    endereco;

SELECT 
    *
FROM
    empresa;

insert into departamento (nome_Departamento,descricao_departamento,id_empresa) values ("teste","dsadsadssdasdds","1");

SELECT 
    *
FROM
    departamento;

insert into cliente (nome_cliente,cpf_cliente,idendereco,idade) values ("teste","2332313","1",19);

SELECT 
    *
FROM
    cliente;

insert into funcionario (nome_funcionario,cpf_funcionario,id_departamento,idendereco) values ("farias","1323123213","1","2");

SELECT 
    *
FROM
    funcionario;

insert into os (datasolicitacao,dataprevisao,respostas,id_funcionario,id_departamento,id_cliente) values (20/5,21/5,"sdsadads",1,1,1);

SELECT 
    *
FROM
    os;

insert into itens_os (idservico,idos) values (1,1);

insert into telefone (numero,ddd,idfuncionario) values (323123321,55,1);

SELECT 
    *
FROM
    telefone;

insert into telefone (numero,ddd,idcliente) values (32333321,55,3);

UPDATE cliente 
SET 
    nome_Cliente = "teste"
WHERE
    idCliente = 3;

SELECT 
    *
FROM
    cliente;

DELETE FROM cliente 
WHERE
    idcliente = 2;

SELECT 
    c.nome_cliente, c.cpf_cliente, t.numero, e.rua
FROM
    cliente c,
    telefone t,
    endereco e
WHERE
    c.idcliente = t.idcliente
        AND c.idendereco = e.idendereco;
       