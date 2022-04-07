-- 1.	Construa (create) uma tabela que contenha os seguintes campos: c�digo do departamento, nome do respons�vel pelo departamento, login do respons�vel, e-mail do respons�vel;
/* 2.	Ap�s constru��o da tabela, desenvolva uma Stored Procedure que fa�a as seguintes instru��es:
 	- Cadastre (insert) o departamento (c�digo) e os dados do seu respons�vel (nome, login, e-mail) na tabela criada anteriormente;
 	- Caso, j� exista um cadastro para esse departamento, atualizar (update) os dados do respons�vel (nome, login, email);
  	- Esta procedure dever� receber os par�metros: c�digo do departamento, nome do respons�vel, login do respons�vel e e-mail; */

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