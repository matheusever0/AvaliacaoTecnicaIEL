-- 1.	Construa (create) uma tabela que contenha os seguintes campos: código do departamento, nome do responsável pelo departamento, login do responsável, e-mail do responsável;
/* 2.	Após construção da tabela, desenvolva uma Stored Procedure que faça as seguintes instruções:
 	- Cadastre (insert) o departamento (código) e os dados do seu responsável (nome, login, e-mail) na tabela criada anteriormente;
 	- Caso, já exista um cadastro para esse departamento, atualizar (update) os dados do responsável (nome, login, email);
  	- Esta procedure deverá receber os parâmetros: código do departamento, nome do responsável, login do responsável e e-mail; */

CREATE TABLE [responsavel_departamento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cod_departamento] [int] NOT NULL,
	[nome] [varchar](50) NULL,
	[login] [varchar](50) NULL,
	[email] [varchar](50) NULL)

CREATE PROCEDURE verifica_departamento_insert
 @codigodepartamento int,
 @nome_responsavel varchar(50),
 @login_responsavel varchar(50),
 @email_responsavel varchar(50)
AS
 if exists(select cod_departamento from responsavel_departamento where cod_departamento = @codigodepartamento)
 begin
 UPDATE responsavel_departamento set nome = @nome_responsavel, login = @login_responsavel, email = @email_responsavel where cod_departamento = @codigodepartamento
 end
 else
 begin
 begin transaction
 insert into responsavel_departamento
 (cod_departamento, nome, login, email)
 values
 (@codigodepartamento, @nome_responsavel, @login_responsavel, @email_responsavel)
end

EXEC verifica_responsavel_insert 10, 'Matheus', 'Severo', 'Matheus.severo02@gmail.com'