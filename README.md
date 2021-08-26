# TRABALHO DE PI: Select
Trabalho desenvolvido durante a disciplina de Banco de Dados do Integrado

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Haisla Esteves Grosman: haisla.egrosman@gmail.com<br>
Daniel Ramos Leite Soares: danielrls2003@gmail.com<br>

### 2.MINIMUNDO
<br>

> Portanto, o Select tem como objetivo principal otimizar o funcionamento da estrutura que já existe, através da integração entre cidadãos que desejam reciclar e catadores, tendo como ponte as associações de catadores. O sistema é baseado em 4 entidades principais: usuários, catadores, associações e retiradas. Para os usuários, é necessário armazenar os dados cadastrais, como email, senha, nome, telefone e endereço. Já com os catadores, o importante é ter alguns dados pessoais básicos, como o nome e o CPF, e um status que informe se o catador ainda está em atividade. A entidade das associações deve conter dados básicos, como nome e telefone, e o endereço no qual ela se encontra. Vale destacar que cada catador pode estar associado a várias associações, e cada associação pode mediar o trabalho de vários catadores. Por isso, criou-se uma tabela que armazena esses vínculos e a data em que ocorreram. Por fim, a entidade das retiradas armazena quem solicitou e quem atendeu a retirada (usuário e catador), armazenando o dia e o horário em que cada etapa ocorreu, quem mediou (associação) e onde isso ocorreu. Ademais, a fim de reduzir o número de informações repetidas, criou-se uma entidade para armazenar os endereços, com rua, número, CEP, bairro e cidade, referida nas outras entidade por um atributo identificador.

### 3.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Wireframe do celular:
[WireframeCelular.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6913615/Trabalho.1.pdf)

Wireframe para web:
[Wireframe Site Select.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6985512/Wireframe.Site.Select.1.pdf)


#### 3.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?

> O Sistema Select precisa inicialmente dos seguintes relatórios:
* Relatório que informe o tempo levado para atender às solicitações de retirada.
* Relatório da frequência dos usuários no aplicativo (solicitando retirada de material reciclável).
* Relatório das solicitações atendidas por cada catador.
* Relatório da recorrência de solicitações em cada bairro.
* Relatório das associações mais ativas no atendimento às solicitações.

### 4 TABELA DE DADOS DO SISTEMA:
[DanielSoares_HaislaEsteves_TabelaDeDados.xlsx](https://github.com/HaislaEG/template_projeto_integrador/files/7062226/DanielSoares_HaislaEsteves_TabelaDeDados.xlsx)
 ### 5.PMC<br>
![Imagem PMC](https://user-images.githubusercontent.com/52607370/129369731-c0f6479b-a80b-48d6-b45f-78c4e2dce81e.png)

 
 ### 6.MODELO CONCEITUAL<br>
![Select_ModeloConceitual_HaislaEsteves_DanielSoares](https://user-images.githubusercontent.com/52607370/130245711-5ebfbbd8-9400-45a3-a5f4-d1fb3d0edbda.png)
      
    
#### 6.1 Descrição dos dados 

    RETIRADA: Tabela que armazena as informações relativas a retirada do material
    Num_retirada: campo que armazena o número do pedido de retirada.
    Data_Retirada: campo que armazena a data que ocorreu a retirada.
    Data_solicitaaoo: campo que armazena a data que o usuário fez o pedido da retirada.
    Hora_Solicitacao: campo que armazena a hora que o usuário fez o pedido da retirada
    
    ASSOCIACAO: Tabela que armaena as informações referentes as associações cadastradas no app.
    Nome_Associacao: campo que armazena o nome das associações.
    Num_Registro_associacao: campo que armazena a identificação das associações.
    Telefone_associacao: campo que armazena o número de telefone das associações.
    
    CATADOR: Tabela que armazena as informações dos catadores.
    Matricula_Catador: campo que armazena o número de identificação de cada catador.
    CPF_Catador: campo que armazena o cpf relativo a cada catador.
    Nome_Catador: campo que armazena os nomes dos catadores.
    
    ENDERECO: Tabela que armazena os dados dos endereços de localização das associações, moradia dos catadores e usuários do aplicativo.
    Cep: campo que armazena o cep de localização das moradias.
    Rua: campo que armazena o nome da rua.
    Num_endereco: campo que armazena o número da casa, apartamento ou associação.
    Numero: campo que armazena o complemento, se houver, da moradia.
    
    USUARIO: Tabela que armazena os dados referentes aos usuários do aplicativo.
    Codigo_Usuario: campo que armazena o código único identificador de cada usuáio.
    Nome_Usuario: campo que armazena o nome do usuário.
    Senha_Usuario: campo que armazena a senha de acesso ao app de cada usuário.
    Login: campo que armazena o apelido que o usuário escolheu colocar como identificação.
    Telefone_Usuario: campo que armazena o telefone dos usuários.


### 7	MODELO LÓGICO<br>
![Select_ModeloLogico_HaislaEsteves_DanielSoares](https://user-images.githubusercontent.com/52607370/130245741-ea3edad9-7b1b-4e6f-a565-d45403d6fa5c.png)

### 8	MODELO FÍSICO<br>
     
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
        Bairro CHAR(50),
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
        
       
### 9	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
/* InsertsSelect: */        
    
    insert into associacao values
    ('Associação de Catadores de João Goulart', 111, '(27) 9919-3834', 24),
    ('Associação de Catadores de Fundão', 222, '(27) 6804-7815', 37),
    ('Associação de Catadores de Santa Mônica Popular', 333, '(27) 6729-0176', 22),
    ('Associação de Catadores de Pontal das Garças', 444, '(27) 2418-8890', 21),
    ('Associação de Catadores de Porto Canoa', 555, '(27) 1224-3733', 1),
    ('Associação de Catadores de Areinha', 666, '(27) 8464-2503', 35),
    ('Associação de Catadores de Vila Bethânia', 777, '(27) 4497-5616', 34),
    ('Associação de Catadores de Marcílio de Noronha', 888, '(27) 9610-9088', 32),
    ('Associação de Catadores de Nova Bethânia', 999, '(27) 0498-2693', 31),
    ('Associação de Catadores de Santa Cecília', 101010, '(27) 6145-8155', 30);

    insert into catador values
    ('João da Silva', '123.456.789-00', 1111, 'Ativo'),
    ('Maria de Fátima', '987.654.321-00', 2222, 'Inativo'),
    ('Pedro de Oliveira', '192.837.465-00', 3333, 'Ativo'),
    ('Antônia Ramos', '918.273.465-00', 4444, 'Ativo'),
    ('José Guimarães', '821.419.479-00', 5555, 'Ativo'),
    ('Rosângela Leal', '756.174.316-98', 6666, 'Ativo'),
    ('Luis Ribeiro', '787.628.220-20', 7777, 'Inativo'),
    ('Vitor Dias', '075.937.640-95', 8888, 'Ativo'),
    ('José Melo', '356.894.210-06', 9999, 'Ativo'),
    ('Mateus Dias', '618.010.930-32', 10101010, 'Ativo');

    insert into compoe values
    (10101010, 333, '2018-03-30', 30),
    (2222, 222, '2010-03-30', 29),
    (6666, 111, '2020-12-02', 28),
    (3333, 444, '2017-10-10', 27),
    (5555, 555, '2019-04-09', 26),
    (8888, 666, '2018-06-23', 25),
    (4444, 777, '2016-10-31', 24),
    (1111, 888, '2017-02-27', 23),
    (2222, 999, '2020-07-15', 22),
    (7777, 101010, '2012-11-26', 21),
    (4444, 333, '2021-04-05', 20),
    (2222, 444, '2008-03-30', 19),
    (2222, 222, '2006-03-30', 18),
    (1111, 555, '2021-08-25', 17),
    (10101010, 111, '2021-05-01', 16),
    (6666, 999, '2021-08-18', 15),
    (8888, 666, '2020-07-16', 14),
    (5555, 888, '2021-08-24', 13),
    (8888, 777, '2018-02-02', 12),
    (7777, 101010, '2001-09-11', 11),
    (4444, 111, '2019-11-20', 10),
    (9999, 222, '2015-12-25', 9),
    (10101010, 333, '2021-06-18', 8),
    (2222, 444, '2021-02-23', 7),
    (7777, 555, '2008-05-13', 6),
    (5555, 666, '2021-03-01', 5),
    (8888, 777, '2020-01-10', 4),
    (2222, 888, '2019-05-17', 3),
    (1111, 999, '2019-05-18', 2),
    (6666, 101010, '2020-12-20', 1);

    insert into endereco (cep, rua, numero, bairro, cidade, num_endereco) values
    ('29168-400', 'Rua dos Pintassilgos', 547, 'Porto Canoa', 'Serra', 1),
    ('29166-773', 'Rua dos Cardeais', 318, 'Morada de Laranjeiras', 'Serra', 2),
    ('29160-110', 'Rua L', 464, 'Carapina Grande', 'Serra', 3),
    ('29161-779', 'Rua Contagem', 333, 'Jardim Carapina', 'Serra', 4),
    ('29164-036', 'Rua F', 501, 'Jardim Limoeiro', 'Serra', 5),
    ('29176-022', 'Rua dos Estudantes', 801, 'Serra Centro', 'Serra', 6),
    ('29164-261', 'Rua Felicíssimo Martins Vieira', 748, 'Camará', 'Serra', 7),
    ('29032-416', 'Rua da Coragem', 584, 'Nova Palestina', 'Vitória', 8),
    ('29047-654', 'Escadaria Manoel Martins Nascimento', 378, 'Itararé', 'Vitória', 9),
    ('29050-565', 'Rua Professor Almeida Cousin', 122, 'Enseada do Suá', 'Vitória', 10),
    ('29027-470', 'Rua São Benedito', 874, 'Bela Vista', 'Vitória', 11),
    ('29070-290', 'Rua Aguapé', 562, 'Maria Ortiz', 'Vitória', 12),
    ('29023-087', 'Beco Augusto Ayres Ribeiro 1', 525, 'Inhanguetá', 'Vitória', 13),
    ('29043-408', 'Rua Maria Penha Silva', 924, 'Tabuazeiro', 'Vitória', 14),
    ('29075-525', 'Rua Manoel Gomes Brandão', 388, 'Boa Vista', 'Vitória', 15),
    ('29024-065', 'Rua Hordalino Militão Machado', 929, 'Grande Vitória', 'Vitória', 16),
    ('29124-327', 'Rua Dois', 428, 'Barramares', 'Vila Velha', 17),
    ('29108-450', 'Rua Maria Cerutti', 589, 'IBES', 'Vila Velha', 18),
    ('29114-055', 'Rua Adolfo Amaro', 322, 'São Torquato', 'Vila Velha', 19),
    ('29101-480', 'Rua Castelo Branco', 616, 'Praia da Costa', 'Vila Velha', 20),
    ('29103-394', 'Rua João de Barro', 928, 'Pontal das Garças', 'Vila Velha', 21),
    ('29105-600', 'Rua Quarenta', 687, 'Santa Mônica Popular', 'Vila Velha', 22),
    ('29124-408', 'Rua Marte', 846, 'Barramares', 'Vila Velha', 23),
    ('29127-072', 'Rua Bahia', 865, 'João Goulart', 'Vila Velha', 24),
    ('29149-518', 'Rua Antônio de Oliveira Lopes', 404, 'Itanguá', 'Cariacica', 25),
    ('29143-206', 'Avenida Fernando Antônio', 856, 'Vista Mar', 'Cariacica', 26),
    ('29147-774', 'Rua Artistas', 495, 'Rio Branco', 'Cariacica', 27),
    ('29147-792', 'Rua 31 de Outubro', 663, 'Rio Branco', 'Cariacica', 28),
    ('29153-345', 'Rua Alfredo Couto Teiexeira', 430, 'Nova Canaã', 'Cariacica', 29),
    ('29147-524', 'Rua Projetada 6', 358, 'Santa Cecília', 'Cariacica', 30),
    ('29138-043', 'Rua Rio Japuramirim', 770, 'Nova Bethânia', 'Viana', 31),
    ('29135-527', 'Rua Marataízes', 880, 'Marcílio de Noronha', 'Viana', 32),
    ('29135-069', 'Rua Padre José de Anchieta', 117, 'Canaã', 'Viana', 33),
    ('29136-132', 'Beco São João I', 166, 'Vila Bethânia', 'Viana', 34),
    ('29137-021', 'Rua das Laranjeiras', 118, 'Areinha', 'Viana', 35),
    ('29132-614', 'Rua Ipê', 961, 'Bom Pastor', 'Viana', 36),
    ('29185-970', 'Rua São José 104', 871, 'Centro', 'Fundão', 37);

    insert into retirada values
    (100, 29, 14, 6666, 101010, '2020-12-21 14:03:13', '2020-12-21 16:02:02'),
    (101, 33, 11, 5555, 666, '2021-03-04 22:30:45.5', '2021-03-05 07:23:20.7'),
    (102, 5, 15, 5555, 555, '2019-04-13 07:07:07.07', '2019-04-13 09:30:00.01'),
    (103, 33, 11, 5555, 888, '2021-08-26 15:00:09.98', '2021-08-26 17:18:19.2'),
    (104, 29, 14, 7777, 101010, '2012-11-30 22:42:33', '2012-12-01 06:46:05.11'),
    (105, 33, 11, 8888, 777, '2018-02-05 18:14:21.03', '2018-02-05 19:33:34.31'),
    (106, 20, 12, 2222, 444, '2021-02-24 14:21:34.58', '2021-02-24 17:58:00.0'),
    (107, 33, 11, 6666, 999, '2021-08-20 06:12:00.9', '2021-08-20 17:18:32.9'),
    (108, 18, 16, 10101010, 111, '2021-05-05 08:00:43.57', '2021-05-05 09:40:13.3'),
    (109, 36, 11, 4444, 777, '2016-11-02 09:10:49.28', '2016-11-02 11:50:03.7');

    insert into usuario (codigo_usuario, nome_usuario, login_usuario, senha_usuario, telefone_usuario, fk_endereco_num_endereco) values
    (11, 'Emanuelly Giovanna Isabel Bernardes', 'emanuellybernardes@portalpublicidade.com.br', 'NKTQb7wrim', '(27) 98807-1692', 33),
    (12, 'Vanessa Carolina Yasmin Cavalcanti', 'vanessacarolinayasmincavalcanti-84@bighost.com.br', 'B5pgmZqQaD', '(27) 98731-3590', 20),
    (13, 'José Enrico Ribeiro', 'joseenricoribeiro@golinelli.eti.br', 'njCH9YP7Wy', '(27) 99813-1216', 8),
    (14, 'Amanda Natália Aragão', 'amandaaragao_@ecotransambiental.com.br', 'uDHXKlCZEF', '(27) 98283-5752', 29),
    (15, 'Theo Kaique das Neves', 'theokaiquedasneves_@athos.srv.br', 'P2tcfWL3jK', '(27) 99862-6115', 5),
    (16, 'Luan Enrico Henrique Barbosa', 'luanenricohenriquebarbosa@gruposeteestrelas.com.br', '8BjxppNf3J', '(27) 98712-8907', 18),
    (17, 'Gabrielly Eliane Eduarda Vieira', 'gabriellyelianeeduardavieira_@raninho.com.br', 'p0fbEfFPid', '(27) 98119-1677', 6), 
    (18, 'Luzia Lúcia Mariana Martins', 'luzialuciamarianamartins_@emcinfo.com.br', 'z6aBL5WGMd', '(27) 98718-3778', 15),
    (19, 'Isabella Mirella Sandra dos Santos', 'isabellasantos@grupoarteoficio.com.br', 'gFg0eSBrCn', '(27) 98538-4545', 10),
    (20, 'Nair Sophia Figueiredo', 'nairsophiafigueiredo-76@vhbadvogados.com.br', 'XZC45lB1qo', '(27) 99335-2188', 2);


### 10	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 10.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
![SELECT * FROM associacao](https://user-images.githubusercontent.com/52607370/127855572-e115fde8-f88f-42f6-86cb-893ae7e7a2a4.png)<br>
![SELECT * FROM catador](https://user-images.githubusercontent.com/52607370/129948009-997b67d0-89a5-44be-8c18-c450dc91c0a4.png)<br>
![SELECT * FROM compoe](https://user-images.githubusercontent.com/52607370/129945393-7a2b0b2d-2a36-48db-94f8-bcd49cc784f7.png)<br>
![SELECT * FROM endereco](https://user-images.githubusercontent.com/52607370/129919759-f6ba6be6-031e-4ea9-8474-ba6d65b9a668.png)
![SELECT * FROM retirada](https://user-images.githubusercontent.com/52607370/130240528-0fe4e6e7-d3c8-413b-a743-aaa6b7c75527.png)<br>
![SELECT * FROM usuario](https://user-images.githubusercontent.com/52607370/127856111-1b4a9789-92b7-4eb1-a500-1ce59d724029.png)<br>


#### 10.2 PRINCIPAIS CONSULTAS DO SISTEMA
/* Relatório 1 */

    select ret.num_retirada "Retirada", (ret.dataHora_retirada - ret.dataHora_solicitacao) "Tempo para Atendimento" from retirada ret;
![image](https://user-images.githubusercontent.com/52607370/130239798-4db00421-ecda-473a-a454-cc6abad5cd81.png)

/* Relatório 2 */

    select count(*) "Vezes que usou o app", ret.fk_usuario_codigo_usuario "Usuário" from retirada ret group by ret.fk_usuario_codigo_usuario;
![image](https://user-images.githubusercontent.com/52607370/129902931-fa83703a-efe8-45e3-890f-e37d87a5f35b.png)

/* Relatório 3 */

    select count(*) "Solicitações Atendidas", ret.fk_catador_matricula_catador "Catador" from retirada ret group by ret.fk_catador_matricula_catador;
![image](https://user-images.githubusercontent.com/52607370/130242021-ab4b130a-c85f-42ca-96bd-f29aa731ff20.png)

/* Relatório 4 */

    select count(*) "Solicitações", endco.bairro from retirada ret join endereco endco on (ret.fk_endereco_num_endereco = endco.num_endereco) group by endco.bairro;
![image](https://user-images.githubusercontent.com/52607370/129920122-ac73a071-74b1-408b-967c-6c7598bd7fb3.png)    

/* Relatório 5 */
    
    select count(*) "Solicitações Administradas", ret.fk_associacao_num_registro_associacao "Associação" from retirada ret group by ret.fk_associacao_num_registro_associacao order by count(*) asc;
![image](https://user-images.githubusercontent.com/52607370/129907696-4949bd8a-7b24-458e-861e-14c519233d16.png)

 ### 11 Gráficos, relatórios, integração com Linguagem de programação e outras solicitações.<br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 11.1	Integração com Linguagem de programação; <br>
 #### 11.2	Desenvolvimento de gráficos/relatórios pertinentes, juntamente com demais <br>
 #### solicitações feitas pelo professor. <br>
 <br>
 <br>
 
 ### 12 Slides e Apresentação em vídeo. <br>
     OBS: Observe as instruções relacionadas a cada uma das atividades abaixo.<br>
 #### 12.1 Slides; <br>
 #### 12.2 Apresentação em vídeo <br>

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.
