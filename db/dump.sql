-- CREATE 

CREATE TABLE usuario (
	idUsuario		INT PRIMARY KEY AUTO_INCREMENT,  
    nome			VARCHAR(100) not null,
    email			VARCHAR(100) not null,
    dtNascimento	DATE not null,
    cidade			VARCHAR(100) not null,
    senha			VARCHAR(50) not null
);

CREATE TABLE modalidade (
  	idModalidade	INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(100) not null,
    descricao		VARCHAR(100) not null,
    imagem			VARCHAR(300) not null
);

CREATE TABLE plano (
  	idPlano			INT PRIMARY KEY AUTO_INCREMENT,
    nome			VARCHAR(100) not null,
    descricao		VARCHAR(100) not null,
    valor			DECIMAL(10,2) not null
);

CREATE TABLE itemPlano (
  	idItemPlano		INT PRIMARY KEY AUTO_INCREMENT,
    idModalidade	INT,
    idPlano			INT, 
    
    CONSTRAINT fkItemPlanoModalidade FOREIGN KEY (idModalidade) REFERENCES modalidade (idModalidade),
    CONSTRAINT fkItemPlanoPlano FOREIGN KEY (idPlano) REFERENCES plano (idPlano)
);

CREATE TABLE matricula (
  	idMatricula		INT PRIMARY KEY AUTO_INCREMENT,
    dtInicio		DATE not null,
    dtValidade		DATE not null,
    idPlano			INT,
    idUsuario		INT,
    
    CONSTRAINT fkMatriculaPlano FOREIGN KEY (idPlano) REFERENCES plano (idPlano),
    CONSTRAINT fkMatriculaUsuario FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);

-- PROCEDURES

DELIMITER //

CREATE PROCEDURE piUsuario (
	IN _nome			VARCHAR(100),
    IN _email			VARCHAR(100),
    IN _dtNascimento	DATE,
    IN _cidade			VARCHAR(100),
    IN _senha			VARCHAR(50)
)
BEGIN
	INSERT INTO usuario (nome, email, dtNascimento, cidade, senha) 
    VALUES (_nome, _email, _dtNascimento , _cidade, _senha);
END //

DELIMITER // 

CREATE PROCEDURE psLoginUsuario(
	IN _email	VARCHAR(100),
    IN _senha	VARCHAR(50)
)

BEGIN
	SELECT * FROM usuario WHERE email = _email AND senha = _senha;
END //

DELIMITER //

CREATE PROCEDURE psUsuario (
  	IN _id		INT
)

BEGIN
SELECT * FROM usuario
WHERE idUsuario = _id;

END //

DELIMITER //
 
create procedure psListarUsuario(
IN _nome varchar(100);
);
 
BEGIN

SELECT * FROM usuario

WHERE nome LIKE CONCAT(_nome, '%');

END //

DELIMITER //
CREATE PROCEDURE pdUsuario
(
	IN 	_id		INT
)
BEGIN
	DELETE FROM usuario WHERE idUsuario = _id;
END //
DELIMITER //
CREATE PROCEDURE puUsuario
(
	IN	_id					INT,
    IN	_nome				VARCHAR(100),
    IN _email				VARCHAR(100),
    IN _dtNascimento		DATE,
    IN _cidade				VARCHAR(100),
    IN _senha				VARCHAR(100)
)
BEGIN
	UPDATE usuario
    	SET nome = _nome,
        	valorUnitario = _valor
    WHERE idUsuario = _id;
END //
