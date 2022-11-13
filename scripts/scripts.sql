-- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIOS DE E-COMMERCE
-- DROP DATABASE ECOMMERCE;
CREATE DATABASE ecommerce;
USE ecommerce;

-- CRIAR TABELA CLIENTE
CREATE TABLE clients(
	idClient int auto_increment primary key,
    Fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    CONSTRAINT unique_cpf_cliente UNIQUE (CPF)
);
ALTER TABLE clients auto_increment=1;

-- CRIA TABELA PRODUTO
-- size equivale a dimensão do produto
CREATE TABLE product(
	idProduct int auto_increment primary key,
    Pname varchar(20),
    classification_kids boolean DEFAULT FALSE,
    category enum('Eletrônicos','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
    avaliacao float DEFAULT 0,
    size varchar(10)
);


-- CRIAR TABELA PAGAMENTO
-- para ser continuado no desafio: terminar de implementar a tabela e criar a conexão
-- com as tabelas necessárias, além disso, reflita essa modificação no diagrama de esquema relacional
-- Criar constraint relacionada ao pagamento, ou seja, implementar ou idPayment na tabela order
CREATE TABLE payments(
	idClient int,
    idPayment int,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- CRIAR TABELA PEDIDO
CREATE TABLE orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    orderDescription varchar(255),
    sendValue float DEFAULT 10,
    paymentCash boolean DEFAULT false,
    -- idPayment 
    CONSTRAINT fk_order_clients foreign key (idOrderClient) references clients(idClient)
		ON UPDATE CASCADE
);
desc orders;

-- CRIAR TABELA ESTIOQUE
CREATE TABLE productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int DEFAULT 0
);

-- CRIAR TABELA FORNECEDOR
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(14) not null,
    -- contato está com varchar de tamamho 11 pode pode aceitar tanto telefones com ou sem o nono dígito
    contact varchar(11) not null,
    CONSTRAINT unique_supplier unique (CNPJ)
);
desc supplier;

-- Fazer melhoramento nas tabelas SUPPLIER e SELLER e colocar os atributos socialName, CNPJ e CPF como generalização

-- CRIAR TABELA VENDEDOR
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    abstName varchar(255),
    CNPJ char(14),
    CPF char(11),
    location varchar(255),
    contact varchar(11) not null,
    CONSTRAINT unique_cnpj_supplier unique (CNPJ),
    CONSTRAINT unique_cpf_supplier unique (CPF)
);

-- CRIAR TABELA PRODUTO_VENDEDOR
-- ajustar, pois a deve conter o idPseller e, só então, idProduct e idSeller
CREATE TABLE productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int DEFAULT 1,
    PRIMARY KEY (idPseller, idPproduct),
    CONSTRAINT fk_product_seller foreign key (idPseller) references seller(idSeller),
    CONSTRAINT fk_product_product foreign key (idPproduct) references product(idProduct)    
);
desc productSeller;

-- CRIAR TABELA PEDIDO DO PRODUTO
CREATE TABLE productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int DEFAULT 1,
    poStatus enum('Disponível','Sem estoque') DEFAULT 'Disponível',
    PRIMARY KEY (idPOproduct, idPOorder),
    CONSTRAINT fk_order_product FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_order_order FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

-- CRIAR TABELA LOCAL DE ARMAZENAMENTO PRODUTO
CREATE TABLE storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    PRIMARY KEY (idLproduct, idLstorage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

-- CRIAR TABELA PRODUTO FORNECEDOR
CREATE TABLE productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier,idPsProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPsSupplier) references supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPsProduct) references product(idProduct)
);
