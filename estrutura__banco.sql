create database ecommerce_db;
 
create table clientes(
id int AUTO_INCREMENT,
nome varchar(30) NOT NULL,
sexo enum('M','F'),
telefone varchar(20),
CPF varchar(20) UNIQUE,
email varchar(50) UNIQUE,
endereco varchar(50),
PRIMARY KEY (id)
);
  
create table produtos(
id int AUTO_INCREMENT,
nome varchar(30) NOT NULL,
descricao text,
valor decimal(10,2) NOT NULL,
estoque int NOT NULL DEFAULT 0,
status_produto enum ('ATIVO', 'INATIVO'),
PRIMARY KEY (id)
);

create table pedidos(
id int AUTO_INCREMENT, 
valor decimal(10,2) NOT NULL, 
cod_rastreio varchar(30),
status_pedido enum ('PE', 'PA', 'ENV', 'ENT'),
data_pedido timestamp DEFAULT CURRENT_TIMESTAMP, 
id_cliente int, 
PRIMARY KEY (id),
FOREIGN KEY (id_cliente) references clientes (id)
);

create table itens_pedido(
id int AUTO_INCREMENT,
id_pedido int NOT NULL, 
id_produto int NOT NULL, 
quantidade int NOT NULL, 
valor_venda decimal(10,2) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY (id_pedido) references pedidos (id), 
FOREIGN KEY (id_produto) references produtos (id)
);

create table pagamentos(
id int AUTO_INCREMENT,
id_pedido int NOT NULL, 
valor_pago decimal(10,2) NOT NULL,
metodo enum ('PIX', 'CARTAO', 'DINHEIRO') NOT NULL,
status_pagamento enum ('OK', 'PENDENTE') NOT NULL,
data_pagamento timestamp DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id),
FOREIGN KEY (id_pedido) references pedidos (id)
);