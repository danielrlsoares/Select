/* ModeloLogicoSelect: */

CREATE TABLE Usuario (
    Codigo_Usuario INTEGER PRIMARY KEY,
    Nome_Usuario VARCHAR(50),
    Senha_Usuario CHAR(15),
    Login_Usuario VARCHAR(50),
    Telefone_Usuario CHAR(15),
    fk_Endereco_Num_Endereco INTEGER
);

CREATE TABLE Endereco (
    Rua VARCHAR(50),
    CEP CHAR(15),
    Numero INTEGER,
    Num_Endereco INTEGER PRIMARY KEY,
    Bairro CHAR(15),
    Cidade CHAR(15)
);

CREATE TABLE Associacao (
    Nome_Associacao VARCHAR(50),
    Num_Registro_Associacao INTEGER PRIMARY KEY,
    Telefone_Associacao CHAR(15),
    fk_Endereco_Num_Endereco INTEGER
);

CREATE TABLE Catador (
    Nome_Catador VARCHAR(50),
    CPF_Catador CHAR(15),
    Matricula_Catador INTEGER PRIMARY KEY,
    Status CHAR(15)
);

CREATE TABLE Retirada (
    DataHora_Retirada TIMESTAMP,
    DataHora_Solicitacao TIMESTAMP,
    Num_Retirada INTEGER PRIMARY KEY,
    fk_Endereco_Num_Endereco INTEGER,
    fk_Usuario_Codigo_Usuario INTEGER,
    fk_Catador_Matricula_Catador INTEGER,
    fk_Associacao_Num_Registro_Associacao INTEGER
);

CREATE TABLE Compoe (
    fk_Catador_Matricula_Catador INTEGER,
    fk_Associacao_Num_Registro_Associacao INTEGER,
    Data_inicio DATE,
    Num_compoe INTEGER PRIMARY KEY
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_Endereco_Num_Endereco)
    REFERENCES Endereco (Num_Endereco)
    ON DELETE SET NULL;
 
ALTER TABLE Associacao ADD CONSTRAINT FK_Associacao_2
    FOREIGN KEY (fk_Endereco_Num_Endereco)
    REFERENCES Endereco (Num_Endereco)
    ON DELETE CASCADE;
 
ALTER TABLE Retirada ADD CONSTRAINT FK_Retirada_2
    FOREIGN KEY (fk_Endereco_Num_Endereco)
    REFERENCES Endereco (Num_Endereco)
    ON DELETE CASCADE;
 
ALTER TABLE Retirada ADD CONSTRAINT FK_Retirada_3
    FOREIGN KEY (fk_Usuario_Codigo_Usuario)
    REFERENCES Usuario (Codigo_Usuario)
    ON DELETE CASCADE;
 
ALTER TABLE Retirada ADD CONSTRAINT FK_Retirada_4
    FOREIGN KEY (fk_Catador_Matricula_Catador)
    REFERENCES Catador (Matricula_Catador)
    ON DELETE CASCADE;
 
ALTER TABLE Retirada ADD CONSTRAINT FK_Retirada_5
    FOREIGN KEY (fk_Associacao_Num_Registro_Associacao)
    REFERENCES Associacao (Num_Registro_Associacao)
    ON DELETE CASCADE;
 
ALTER TABLE Compoe ADD CONSTRAINT FK_Compoe_1
    FOREIGN KEY (fk_Catador_Matricula_Catador)
    REFERENCES Catador (Matricula_Catador)
    ON DELETE RESTRICT;
 
ALTER TABLE Compoe ADD CONSTRAINT FK_Compoe_2
    FOREIGN KEY (fk_Associacao_Num_Registro_Associacao)
    REFERENCES Associacao (Num_Registro_Associacao)
    ON DELETE SET NULL;