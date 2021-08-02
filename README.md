# TRABALHO DE PI: Select
Trabalho desenvolvido durante a disciplina de Banco de Dados do Integrado

# Sumário

### 1. COMPONENTES<br>
Integrantes do grupo<br>
Haisla Esteves Grosman: haisla.egrosman@gmail.com<br>
Daniel Ramos Leite Soares: danielrls2003@gmail.com<br>
...

### 2.MINIMUNDO<br>
Descrever o mini-mundo! (Não deve ser maior do que 30 linhas, se necessário resumir para justar)
Entrevista com o usuário e identificação dos requisitos.(quando for o caso de sistemas com cliente real)
Descrição textual das regras de negócio definidas como um subconjunto do mundo real cujos elementos são propriedades que desejamos incluir, processar, armazenar, gerenciar, atualizar, e que descrevem a proposta/solução a ser desenvolvida.
<br>

> O sistema proposto para a "Devcom Projetos conterá as informacões aqui detalhadas. Dos Projetos serão armazenados o número, nome e cidade. Dos Departamentos serão armazenados o número e nome. O cliente destacou que cada projeto pode ter vários departamentos auxiliando no seu desenvolvimento, e cada departamento pode estar envolvido em vários projetos. Os dados relativos aos empregados que serão armazenados são: rg, nome, cpf, salário, data inicial do salario e supervisor de cada empregado. É importante destacar que cada empregado pode ser supervisionado por outro empregado, e obrigatoriamente deve estar alocado a um único departamento, mas pode gerenciar vários departamentos ou não gerenciar nenhum. Um empregado também pode participar de vários projetos, caso seja necessário, mas não precisa obrigatoriamente estar alocado em algum projeto. Com relação aos dependentes serão armazenadas as informações de nome do dependente, data de nascimento, sexo e grau de parentesco. Cada empregado pode ter vários dependentes, mas um dependente esta associado apenas a um único empregado. Com relação ao histórico de salário devemos armazenar as informações de valor do salário, data de início do salário no período e data final do salário no período. É importante lembrar que cada funcionario pode ter diversos eventos de histórico de salário associados a ele visto que este dado pode ser alterado várias vezes..
 

### 3.RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
Wireframe do celular:
[WireframeCelular.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6913615/Trabalho.1.pdf)

Wireframe para web:
[WireframeWeb.pdf](https://github.com/HaislaEG/template_projeto_integrador/files/6913616/Trabalho.1.WEB.pdf)



#### 3.1 Modelo conceitual

> A Empresa Select precisa inicialmente dos seguintes relatórios:
* Relatório que informe quais são os dados de cada pedido de retiradaincluindo as seguintes informações: Número da retirada, data da retirada, data da solicitação, hora da retirada e hora da solicitação.
* Relatório das associações cadastradas incluindo as seguintes informações: Nome da associação, Número do registro da associação e telefone da associação.
* Relatório dos catadores cadastrados no app incluindo as seguintes informações: Matricula do catador, CPF do catador e nome do catador
* Relatório com o endereco de cada cadastrado no sistema incluindo as seguintes informações: Rua, bairro, cidade, CEP.
* Relatório de usuário incluindo as seguintes informações: nome do usuário, código do usuário, senha do usuario, login, telefone.
![Mapa conceitual](https://user-images.githubusercontent.com/87146767/127789514-59625ba6-b288-48c3-9232-c1592cfb29f0.png)

 

### 4 TABELA DE DADOS DO SISTEMA:
![Modelo lógico](https://user-images.githubusercontent.com/87146767/127790663-0d8d3e84-cf19-4e2e-84da-4cdda58fde52.png)

 ### 5.PMC<br>
 ![Imagem PMC](https://user-images.githubusercontent.com/87146767/127790944-529da177-8cf5-48f6-ae87-b66ec1f58be9.png)

 
 
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
      ![Imagem do modelo físico Select](https://user-images.githubusercontent.com/87146767/127793782-c00765f2-f69d-48f9-b46d-721e7d023573.png)
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
        a) inclusão das instruções de inserção dos dados nas tabelas criadas pelo script de modelo físico
        (Drop para exclusão de tabelas + create definição de para tabelas e estruturas de dados 
 <br> + insert para dados a serem inseridos)
        b) Criar um novo banco de dados para testar a restauracao 
        (em caso de falha na restauração o grupo não pontuará neste quesito)
        c) formato .SQL


### 10	TABELAS E PRINCIPAIS CONSULTAS<br>
    OBS: Incluir para cada tópico as instruções SQL + imagens (print da tela) mostrando os resultados.<br>
#### 10.1	CONSULTAS DAS TABELAS COM TODOS OS DADOS INSERIDOS (Todas) <br>
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
