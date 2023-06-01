

-- criar a tabela cliente
create table clientes(
    id int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint clientes_pk primary key(id)
);

alter table clientes
add uf char(2) default 'RJ';

alter table clientes
add dia_niver int,
add mes_niver int;

-- para excluir uma coluna
alter table clientes 
drop  dia_niver;

alter table clientes
add constraint clientes_dia_niver_ck check(dia_niver >= 1 and dia_niver <= 31),
add constraint clientes_mes_niver_ck check(mes_niver >= 1 and mes_niver <= 12);

alter table clientes
modify uf varchar(2);

alter table clientes
change uf estado char(2);

alter table clientes
drop estado;

alter table clientes rename parceiros;

create database academico;
use academico;
create table instituicoes(
    id int not null,
    constraint instituicoes_pk primary key(id),
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint instituicoes_nome_uq unique(email)
);

alter table instituicoes
    add uf char(2) default 'RJ';

create table professores(
    prof_matr numeric(6) not null,
    prof_nome varchar(100) not null,
    prof_email varchar(150) not null,
    prof_salario decimal(18,2),
    constraint professores_prof_matr_pk
        primary key(prof_matr),
    constraint professores_prof_email_uq
        unique(prof_email),
    constraint professores_prof_salario_ck
        check(prof_salario > 700)
);

alter table professores
modify prof_matr int(6);

alter table professores
add dia_niver int,
add mes_niver int;

desc professores;

alter table professores
add constraint professores_dia_niver_ck
    check(dia_niver >= 1 and dia_niver <= 31),
add constraint professores_mes_niver_ck
    check(mes_niver >= 1 and mes_niver < 13),
add prof_cep char(9);

desc professores;

use  bancodb_licomp_231;
alter table parceiros rename clientes;

insert into clientes(nome, email)
values('Pedro', 'comecaP@gmail.com');

insert into clientes
values(2, 'Ana', 'ana@gmail.com', null, null);

insert into clientes(nome, email)
values('Maria', 'teste@email.com');

insert into clientes(nome, email)
values('Letícia', 'teste@email.com'),
('Zico', 'zico@email.com');

update clientes
set email = 'teste@email.com';

update clientes
set email = 'zico@email.com'
where id = 5;

update clientes
set email = 'ana@gmail.com'
where nome like 'ana';

insert into clientes(nome, email)
values('Paulo', '.');

select * from clientes;

update clientes
set email = 'comecaP@gmail.com'
where nome like 'p%';

select * from clientes;

-- modifique a tabela clientes de modo a atender as especificações a seguir:
-- altere o dia do aniversário de todos os clientes cujo id seja superior a 3 para 7
update clientes
set dia_niver = 7
where id > 3;
-- altere o mes aniversário de todos os clientes que possuem a letra E em seu nome para 10
update clientes
set mes_niver = 10
where nome like '%e%';
-- altere o dia e mês de aniversário de todos os clientes que tenham o nome iniciado em A ou Z para dia: 14 e mês 04
update clientes
set dia_niver = 14, mes_niver = 4
where nome like 'A%' or nome like 'Z%';
-- liste o conteúdo da tabela

create table bancos(
    numero int not null,
    nome varchar(100) not null,
    constraint bancos_pk primary key(numero)
);

create table agencias(
    numero varchar(100) not null,
    nome varchar(100) not null,
    telefone int not null,
    banco int not null,
    constraint agencias_pk primary key (numero)
);

alter table bancos
add constraint bancos_nome_uq unique(nome);

alter table agencias
add constraint agencias_nome_uq unique(nome),
add constraint agencias_telefone_uq unique(telefone),
add constraint agencias_banco_fk
    foreign key(banco) references bancos(numero);

-- alterar o campo numero da tabela agências para integer
alter table agencias
modify numero int;

-- BancoDB


-- criar a tabela cliente
create table clientes(
    id int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint clientes_pk primary key(id)
);

alter table clientes
add uf char(2) default 'RJ';

alter table clientes
add dia_niver int,
add mes_niver int;


alter table clientes
add constraint clientes_dia_niver_ck check(dia_niver >= 1 and dia_niver <= 31),
add constraint clientes_mes_niver_ck check(mes_niver >= 1 and mes_niver <= 12);

alter table clientes
modify uf varchar(2);

alter table clientes
change uf estado char(2);

alter table clientes
drop estado;

alter table clientes
rename parceiros;

-- fixação - correção
create database academico_305_23;

use academico_305_23;

create table instituicoes(
    id integer not null,
    constraint instituicoes_pk 
        primary key(id),
    nome varchar(100) not null,
    email varchar(100) not null,
    constraint instituicoes_email_uq
        unique(email)
);


-- -----WORKBENCH ------

-- 1)
SELECT nome,email 
FROM clientes
WHERE UF='RJ';

-- 2)

SELECT id,idcliente,saldo,limite 
FROM clientes
WHERE saldo <= limite;

-- 3)

SELECT nome,email 
FROM clientes
WHERE mes_niver < 7;

-- 4)

SELECT nome,banco 
FROM agencias
WHERE nome LIKE '%A%';

-- 5)

SELECT nome,telefone,banco
FROM agencias
WHERE  telefone LIKE '(21)%' OR 
telefone LIKE '(22)%' OR
telefone LIKE '(23)%' OR
telefone LIKE '(24)%' ;

-- 6)

SELECT alu_nome AS 'Nome do Aluno',alu_matricula AS 'Matricula do Aluno'
FROM 
WHERE

-- Exemplo JOIN

SELECT nome,aluno 
FROM contas cn JOIN clientes cl
ON (cl.id=cn.idCliente)
WHERE saldo > 1500;


SELECT nome,aluno 
FROM contas cn RIGHT JOIN clientes cl
ON (cl.id=cn.idCliente);


-- Atividade INNER JOIN Slide 51-55

-- Criar a tabela tiposTransacoes
CREATE TABLE tiposTransacoes( id INT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    CONSTRAINT id_tt_pk PRIMARY KEY(id));


-- Criar a tabela transacoes

CREATE TABLE transacoes(cod INT(11) NOT NULL AUTO_INCREMENT,
    conta INT(11) NOT NULL,
    tipo_transacao INT(11) NOT NULL,
    valor DECIMAL(9,2) NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT id_cod_pk PRIMARY KEY(cod),
    CONSTRAINT conta_id_fk FOREIGN KEY(conta) REFERENCES Contas(id),
    CONSTRAINT nome_tt_fk FOREIGN KEY(tipo_transacao) REFERENCES tipoTransacoes(id));


-- Registrar dados da tabela tiposTransacoes

INSERT INTO tiposTransacoes(id,nome) VALUES(10,'deposito'),
(20,'transferencia'),
(30,'saque');

-- Registrar dados da tabela transacoes

INSERT INTO transacoes(conta,tipo_transacao,valor,data) VALUES(1,10,5000.00,'2018-09-18'),
(1,30,3000.00,'2018-09-19'),
(1,20,1000.00,'2018-09-19'),
(2,30,5000.00,'2018-09-17');

-- Consulta 

SELECT b.nome AS "Nome do Banco", a.nome AS "Nome da Agencia" 
FROM agencias a INNER JOIN bancos b 
ON(b.banco_id=a.banco_id);

-- Exercícios:

-- 1. Liste o nome do cliente e o valor de todas as transações realizadas por ele;

SELECT cl.nome AS "Nome do cliente", tra.valor AS "Transaçoes feitas"  
FROM clientes cl INNER JOIN transacoes tra
ON(cl.id=tra.conta);

-- 2. Liste o nome do cliente, o nome da transação, a data da transação e o valor de cada transação;

SELECT cl.nome AS "Nome do cliente", tt.nome AS "Nome da transação", tra.data AS "Data da transação", tra.valor AS "Valor da transação"
FROM  transacoes tra
INNER JOIN clientes cl ON(cl.id=tra.conta)
INNER JOIN tiposTransacoes tt ON(tt.id=tra.tipo_transacao);

-- 3. Liste a data, o valor e o nome do tipo de cada transação realizada no mês de setembro de 2019.

SELECT tra.data AS "Data da Transação",tra.valor AS "Valor da Transação", tt.nome AS "Nome da Transação"
FROM transacoes tra
INNER JOIN tiposTransacoes tt ON(tt.id=tra.tipo_transacao)
WHERE tra.data LIKE '%-09-19';

-- 4. Liste o nome do cliente, o tipo de sua conta, o valor das transações e o nome do tipo de cada transação, considerando apenas os clientes do estado no Rio de Janeiro e cujo saldo seja superior ao limite.

-- Update necessário pois no Banco de dados não havia alguma linha com esta condição

UPDATE contas SET saldo=10000 WHERE id=2;


SELECT cl.nome AS "Nome de Cliente", co.tipo AS "Tipo de Conta", tra.valor AS "Valor das transções", tt.nome AS "Tipo de Transação"
FROM clientes cl
INNER JOIN contas co ON(cl.id=co.idCliente) 
INNER JOIN transacoes tra ON(co.id=tra.conta) 
INNER JOIN tiposTransacoes tt ON(tt.id=tra.tipo_transacao)
WHERE cl.uf ="RJ" AND co.saldo > co.limite;


