# TRABALHO DE PI: Select
Trabalho desenvolvido durante a disciplina de Banco de Dados do Integrado

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Haisla Esteves Grosman: haisla.egrosman@gmail.com<br>
Daniel Ramos Leite Soares: danielrls2003@gmail.com<br>

### 2.MINIMUNDO<br>

    O Select terá como objetivo integrar a pessoa que gostaria de fazer o descarte e o que fará a coleta de um material reciclável, haverá um local para inserir o endereço de onde será feita a busca, além de contar com um suporte para aqueles que desejam saber mais sobre as funcionalidades do aplicativo. O aplicativo contará com dicas sobre como descartar mais seguramente o material para a sua segurança e do próprio catador, e com modos de reutilização de alguns materiais, como por exemplo ensinar a fazer um vai-vem de garrafa pet, como fazer potes com esses materiais, entre outros.
 

### 3.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Wireframe do celular:
[WireframeCelular.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6913615/Trabalho.1.pdf)

Wireframe para web:
[WireframeWeb.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6913616/Trabalho.1.WEB.pdf)

#### 3.1 QUAIS PERGUNTAS PODEM SER RESPONDIDAS COM O SISTEMA PROPOSTO?
> A Empresa Select precisa inicialmente dos seguintes relatórios:
    * Relatório que informe quais são os dados de cada pedido de retirada incluindo as seguintes informações: Número da retirada, data da retirada, data da solicitação, hora da retirada e hora da solicitação.
    * Relatório das associações cadastradas incluindo as seguintes informações: Nome da associação, Número do registro da associação e telefone da associação.
    * Relatório dos catadores cadastrados no app incluindo as seguintes informações: Matricula do catador, CPF do catador e nome do catador
    * Relatório com o endereco de cada cadastrado no sistema incluindo as seguintes informações: Rua, bairro, cidade, CEP.
    * Relatório de usuário incluindo as seguintes informações: nome do usuário, código do usuário, senha do usuario, login, telefone.

### 4 TABELA DE DADOS DO SISTEMA:
![Modelo lógico](https://user-images.githubusercontent.com/87146767/127790663-0d8d3e84-cf19-4e2e-84da-4cdda58fde52.png)


 ### 5.PMC<br>
![Imagem PMC](https://user-images.githubusercontent.com/52607370/129369731-c0f6479b-a80b-48d6-b45f-78c4e2dce81e.png)

 
 ### 6.MODELO CONCEITUAL<br>
![Imagem modelo conceitual](https://user-images.githubusercontent.com/87146767/127791075-58e3a79e-3815-4603-8326-aaebeecfc9a6.png)

      
    
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
![Imagem Modelo Lógico](https://user-images.githubusercontent.com/87146767/127793499-4858c06d-08a3-4cba-8054-6de0fa74cb99.png)


### 8	MODELO FÍSICO<br>
     
     /* ModeloLogicoSelect: */

     CREATE TABLE Usuario (
         Codigo_Usuario INTEGER PRIMARY KEY,
         Nome_Usuario CHAR(50),
         Senha_Usuario CHAR(15),
         Login_Usuario CHAR(50),
         Telefone_Usuario CHAR(15),
         fk_Endereco_Num_Endereco INTEGER
     );

     CREATE TABLE Endereco (
         Rua CHAR(50),
         CEP CHAR(15),
         Numero INTEGER,
         Num_Endereco INTEGER PRIMARY KEY
     );

     CREATE TABLE Associacao (
         Nome_Associacao CHAR(50),
         Num_Registro_Associacao INTEGER PRIMARY KEY,
         Telefone_Associacao CHAR(15),
         fk_Endereco_Num_Endereco INTEGER
     );

     CREATE TABLE Catador (
         Nome_Catador CHAR(50),
         CPF_Catador CHAR(15),
         Matricula_Catador INTEGER PRIMARY KEY
     );

     CREATE TABLE Retirada (
         Data_Retirada DATE,
         Data_Solicitacao DATE,
         Hora_Solicitacao TIME,
         Hora_Retirada TIME,
         Num_Retirada INTEGER PRIMARY KEY,
         fk_Endereco_Num_Endereco INTEGER,
         fk_Usuario_Codigo_Usuario INTEGER,
         fk_Catador_Matricula_Catador INTEGER,
         fk_Associacao_Num_Registro_Associacao INTEGER
     );

     CREATE TABLE Compoe (
         fk_Catador_Matricula_Catador INTEGER,
         fk_Associacao_Num_Registro_Associacao INTEGER
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
    ('Associação dos Catadores de Vitória - ACVIX', 666, '(27)91234-5678', 6),
    ('Associação dos Catadores de Cariacica - ACC', 333, '(27)90000-0000', 7),
    ('Associação dos Catadores de Viana - ACV', 555, '(27)91928-3746', 8),
    ('Associação dos Catadores de Vila Velha - ACVV', 444, '(27)99998-8876', 9),
    ('Associação dos Catadores da Serra - ACSERRA', 777, '(27)98765-4321', 10);

    insert into catador values
    ('João da Silva', '123.456.789-00', 1111),
    ('Maria de Fátima', '987.654.321-00', 2222),
    ('Pedro de Oliveira', '192.837.465-00', 3333),
    ('Antônia Ramos', '918.273.465-00', 4444),
    ('José Guimarães', '821.419.479-00', 5555);

    insert into compoe values
    (5555, 333),
    (1111, 555),
    (3333, 444),
    (2222, 666),
    (4444, 777);

    insert into endereco values
    ('Rua das Flores', '29090-200', 100, 1),
    ('Rua das Pedras', '29150-900', 85, 2),
    ('Rua das Luzes', '29640-730', 550, 3),
    ('Rua dos Cachorros', '29802-206', 999, 4),
    ('Rua dos Gatos', '29000-111', 4, 5),
    ('Rua da Alegria', '29900-500', 150, 6),
    ('Rua dos Riso', '29167-920', 3212, 7),
    ('Rua da Animação', '29120-604', 412, 8),
    ('Rua da Felicidade', '29234-700', 15, 9),
    ('Rua das Gargalhadas', '29800-916', 3, 10);

    insert into retirada values
    ('2021-07-30', '2021-07-30', '12:03:13', '16:02:02', 100, 1, 15, 2222, 777),
    ('2021-07-26', '2021-07-25', '22:30:45.5', '07:23:20.7', 101, 3, 13, 4444, 555),
    ('2021-07-29', '2021-07-29', '07:07:07.07', '09:30:00.01', 102, 1, 15, 1111, 333),
    ('2021-07-10', '2021-07-10', '15:00:09.98', '17:18:19.2', 103, 4, 12, 5555, 666),
    ('2021-07-01', '2021-06-30', '22:42:33', '06:46:05.11', 104, 2, 14, 3333, 444);

    insert into usuario values
    (11, 'Mário Bonela', '12345678', 'mario.bonella@gmail.com', '(27)91111-2222', 5),
    (12, 'Phelipe Lemos', 'Phelipe1990', 'phelipe.lemos@gmail.com', '(27)92222-3333', 4),
    (13, 'Rafaela Marquezine', 'minhasenha', 'rafaela.maequezine@gmail.com', '(27)93333-4444', 3),
    (14, 'Jhony Silva', 'chocolate1', 'jhony.silva@gmail.com', '(27)94444-5555', 2),
    (15, 'André Falcão', 'batata123', 'andre,falcao@gmail.com', '(27)95555-6666', 1);


### 10	TABELAS E PRINCIPAIS CONSULTAS<br>
#### 10.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
![SELECT * FROM associacao](https://user-images.githubusercontent.com/52607370/127855572-e115fde8-f88f-42f6-86cb-893ae7e7a2a4.png)<br>
![SELECT * FROM catador](https://user-images.githubusercontent.com/52607370/127855744-23352d40-54c0-4cfb-8ced-74e82b654780.png)<br>
![SELECT * FROM compoe](https://user-images.githubusercontent.com/52607370/127855937-5db5bd81-0e16-4e6e-892d-19fcfaa0e63f.png)<br>
![SELECT * FROM endereco](https://user-images.githubusercontent.com/52607370/127855983-6e5a948f-4d62-4850-abe6-6ab13f3e2535.png)<br>
![SELECT * FROM retirada](https://user-images.githubusercontent.com/52607370/127856098-051b12df-fbdf-4aeb-824c-2fc877cf8d99.png)<br>
![SELECT * FROM usuario](https://user-images.githubusercontent.com/52607370/127856111-1b4a9789-92b7-4eb1-a500-1ce59d724029.png)<br>


#### 10.2 PRINCIPAIS CONSULTAS DO SISTEMA 
 Inserir as principais consultas (relativas aos 5 principais relatórios) definidas previamente no iten 3.1 deste template.
 <br>
  a) Você deve apresentar as consultas em formato SQL para cad um dos relatórios.
 <br>
  b) Além da consulta deve ser apresentada uma imagem com o resultado obtido para cada consulta.
 <br>
 <br>
 
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
 <br>
 <br>   


    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
   
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/

#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")
