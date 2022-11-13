-- CRIAÇÃO DO BANCO DE DADOS PARA O CENÁRIOS DE E-COMMERCE
-- DROP DATABASE ecommercedio;
CREATE DATABASE ecommercedio;
USE ecommercedio;

-- Criar tabela Pessoa Física
CREATE TABLE pessoa_fisica(
	idPf int auto_increment primary key,
    cpf char(11) not null,
    gender enum('Masculino','Feminino') NOT NULL,
    email varchar(45),
    CONSTRAINT unique_cpf_pessoa_fisica UNIQUE (cpf)
);
ALTER TABLE pessoa_fisica auto_increment=1;

-- Criar tabela Pessoa Jurídica
CREATE TABLE pessoa_juridica(
	idPj int auto_increment primary key,
    cnpj char(14) not null,
    socialName varchar(255) not null,
    abstName varchar(255),
    email varchar(45),
    CONSTRAINT unique_cnpj_pessoa_juridica UNIQUE (cnpj)
);
ALTER TABLE pessoa_juridica auto_increment=1;

-- CRIAR TABELA CLIENTE
CREATE TABLE clients(
	idClient int auto_increment primary key,
    Fname varchar(20),
    Minit char(3),
    Lname varchar(20),
    Address varchar(45),
    idCpf int,
    idCnpj int,
    CONSTRAINT fk_client_cpf foreign key (idCpf) references pessoa_fisica(idPf),
    CONSTRAINT fk_client_cnpj foreign key (idCnpj) references pessoa_juridica(idPj)
);
ALTER TABLE clients auto_increment=1;

-- CRIA TABELA PRODUTO
CREATE TABLE product(
	idProduct int auto_increment primary key,
    pDescription varchar(45),
    category enum('Eletrônicos','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
    valor float DEFAULT 0
);
ALTER TABLE product auto_increment=1;

-- CRIAR TABELA CARTÃO DE CRÉDITO
CREATE TABLE creditCard(
	idCreditCard int auto_increment primary key,
    cardNumber CHAR(8),
    ownerName varchar(45),
    expirationDate date,
    secutiryCode int    
);
ALTER TABLE creditCard auto_increment=1;

-- CRIAR TABELA PAGAMENTO
CREATE TABLE payments(
    idPayment int auto_increment primary key,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    idPaymentCard int,
    CONSTRAINT fk_payment_card foreign key (idPaymentCard) references creditCard(idCreditCard)
);
ALTER TABLE payments auto_increment=1;

-- CRIAR TABELA ENTREGA
CREATE TABLE deliver(
	idEntrega int auto_increment primary key,
    deliverStatus varchar(45),
    deliverdDate date,
    trackingCode int DEFAULT 0
);
ALTER TABLE deliver auto_increment=1;

-- CRIAR TABELA PEDIDO
CREATE TABLE orders(
	idOrder int auto_increment primary key,
    orderStatus enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
    orderDescription varchar(255),
    sendValue float DEFAULT 10,
    idOrderClient int,
    idOrderDeliver int,
    idOrderPayment int,
    CONSTRAINT fk_order_clients foreign key (idOrderClient) references clients(idClient)
		ON UPDATE CASCADE,
	CONSTRAINT fk_order_deliver foreign key (idOrderDeliver) references deliver(idEntrega),
    CONSTRAINT fk_order_payment foreign key (idOrderPayment) references payments(idPayment)
);
ALTER TABLE orders auto_increment=1;
desc orders;

-- CRIAR TABELA FORNECEDOR
CREATE TABLE supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    idSupplierCpf int,
    idSupplierCnpj int,
    CONSTRAINT fk_supplier_cpf foreign key (idSupplierCpf) references pessoa_fisica(idPf),
    CONSTRAINT fk_supplier_cnpj foreign key (idSupplierCnpj) references pessoa_juridica(idPj),
    contact varchar(11) not null
);
ALTER TABLE supplier auto_increment=1;
desc supplier;

-- CRIAR TABELA ESTIOQUE
CREATE TABLE productStorage(
	idProdStorage int auto_increment primary key,    
    quantity int DEFAULT 0
);
ALTER TABLE productStorage auto_increment=1;

-- CRIAR TABELA VENDEDOR
CREATE TABLE seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,    
    location varchar(255),
	idSellerrCpf int,
    idSellerCnpj int,
    CONSTRAINT fk_seller_cpf foreign key (idSellerrCpf) references pessoa_fisica(idPf),
    CONSTRAINT fk_seller_cnpj foreign key (idSellerCnpj) references pessoa_juridica(idPj)    
);
ALTER TABLE seller auto_increment=1;

-- CRIAR TABELA PRODUTO_VENDEDOR
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

-- CRIAR TABELA CARTÃO DE CRÉDITO CLIENTE
CREATE TABLE creditCardClient(
	idClientCreditCard int,
    idCardCreditCard int,
    PRIMARY KEY (idClientCreditCard, idCardCreditCard),
    CONSTRAINT fk_client_credit_card FOREIGN KEY (idClientCreditCard) references clients(idClient),
    CONSTRAINT fk_card_credit_card FOREIGN KEY (idCardCreditCard) references creditCard(idCreditCard)
);
