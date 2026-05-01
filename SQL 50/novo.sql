/* Criar tabela */
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(150)
);

/* Inserir Dados */
INSERT INTO
    clientes (id, nome, idade, email)
VALUES
    (1, 'João Silva', 30, 'joao@email.com'),
    (2, 'Maria Silva', 27, 'maria@email.com');

/* Atualizar daados */
UPDATE clientes
SET idade = 31
WHERE id = 1;

/* Update errado *Atualiza a idade de todos usuários* */
UPDATE clientes
SET idade = 32

/* Deletou joão */
delete from clientes
WHERE id = 1;

/* 
 */
 
INSERT INTO clientes (id, nome, idade, email) VALUES
(1, 'Ana Souza', 25, 'ana.souza@email.com'),
(2, 'Carlos Oliveira', 32, 'carlos.oliveira@email.com'),
(3, 'Mariana Santos', 28, NULL),
(4, 'José Pereira', NULL, 'jose.pereira@email.com'),
(5, 'Fernanda Lima', 40, 'fernanda.lima@email.com'),
(6, 'Roberto Alves', NULL, NULL),
(7, 'Letícia Costa', 21, 'leticia.costa@email.com'),
(8, 'Ricardo Mendes', 35, NULL),
(9, 'Beatriz Ribeiro', 29, 'beatriz.ribeiro@email.com'),
(10, 'Gustavo Martins', 38, 'gustavo.martins@email.com'),
(11, 'Julia Ferreira', NULL, NULL),
(12, 'Vinícius Rocha', 27, 'vinicius.rocha@email.com'),
(13, 'Amanda Castro', 30, 'amanda.castro@email.com'),
(14, 'Daniel Moreira', 45, NULL),
(15, 'Bruna Nunes', NULL, 'bruna.nunes@email.com'),
(16, 'Lucas Carvalho', 26, 'lucas.carvalho@email.com'),
(17, 'Paula Almeida', NULL, NULL),
(18, 'Thiago Duarte', 34, 'thiago.duarte@email.com'),
(19, 'Gabriela Farias', 37, NULL),
(20, 'Felipe Gomes', 23, 'felipe.gomes@email.com'),
(21, 'Tatiane Silveira', NULL, NULL),
(22, 'Rafael Lima', 29, 'rafael.lima@email.com'),
(23, 'Larissa Barbosa', 31, 'larissa.barbosa@email.com'),
(24, 'André Vasconcelos', 33, NULL),
(25, 'Juliana Araújo', NULL, 'juliana.araujo@email.com'),
(26, 'Diego Monteiro', 39, 'diego.monteiro@email.com'),
(27, 'Camila Antunes', 28, NULL),
(28, 'Bruno Costa', 42, 'bruno.costa@email.com'),
(29, 'Renata Borges', 30, 'renata.borges@email.com'),
(30, 'Eduardo Teixeira', NULL, NULL);



SELECT nome, idade
FROM clientes
WHERE idade >= 25 AND nome LIKE '%A' /* Nomes terminados com a  */
ORDER BY nome ASC; /* Ordena pelo nome de forma ascendente */