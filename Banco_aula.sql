use oficina;

create database oficina;

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
    idtelefone INT,
    CONSTRAINT fk_endereco_funcionario FOREIGN KEY (idendereco)
        REFERENCES endereco (idendereco),
    CONSTRAINT fk_telefone_funcionario FOREIGN KEY (idtelefone)
        REFERENCES telefone (idtelefone)
);

drop table funcionario;

CREATE TABLE telefone (
    idtelefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(13) NOT NULL,
    ddd VARCHAR(45)
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
    idtelefone INT,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (idendereco)
        REFERENCES endereco (idendereco),
    CONSTRAINT fk_telefone_cliente FOREIGN KEY (idtelefone)
        REFERENCES telefone (idtelefone)
);

drop table cliente;

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

drop table OS;

CREATE TABLE itens_OS (
    Servico_servico INT NOT NULL,
    OS_IDOS INT NOT NULL
);