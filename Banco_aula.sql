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
