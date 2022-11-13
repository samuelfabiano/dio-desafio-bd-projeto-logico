USE ECOMMERCE;

-- INSERIR DADOS DOS CLIENTES
INSERT INTO clients (Fname,Minit,Lname,CPF,Address)
VALUES
  ("Karyn","Rat","Ayers",16333157656,"773-2215 Tellus Av."),
  ("Cheryl","Jon","Rodriquez",82302957140,"311-5454 Sed Ave"),
  ("Jessamine","Ham","Wilder",49575251207,"1494 Metus Avenue"),
  ("Larissa","Sua","Velez",96697016130,"Ap #487-7600 Convallis Street"),
  ("Adria","Lai","Mcmillan",46633635583,"5243 Facilisi. St."),
  ("Heather","Est","Salas",99655940101,"Ap #820-4964 Pretium St."),
  ("Ria","Mar","Hodge",73012544505,"Ap #686-574 Suspendisse Street"),
  ("Andrew","Ral","Weaver",70087897968,"213-9631 Lorem Street"),
  ("Katelyn","Sou","Middleton",26765687868,"766-1780 Massa Av."),
  ("Rhonda","Ter","Oneal",53260389867,"Ap #464-3026 Feugiat Street");

SELECT * FROM clients;

-- INSERÇÃO DE PRODUTOS
INSERT INTO product (Pname,classification_kids,category,avaliacao,size)
VALUES
	('Fone de ouvido',false,'Eletrônicos','4',null),
    ('Barbie Elsa',false,'Brinquedos','3',null),
    ('Body Carters',false,'Vestuário','5',null),
    ('Microfone Vedo',false,'Eletrônicos','4',null),
    ('Sofá retrátil',false,'Móveis','3','3,57,80'),
    ('Farinha de Arroz',false,'Alimentos','2',null),
    ('Fire Stick Amazon',false,'Eletrônicos','3',null);

SELECT * FROM product;

-- INSERÇÃO DE PEDIDOS
INSERT INTO orders (idOrderClient,orderStatus,orderDescription,sendValue,paymentCash)
VALUES
	(1, default, 'compra via aplicativo',null,1),
    (2, default, 'compra via aplicativo',50,0),
    (3, 'Confirmado', null,null,1),
    (4, default, 'compra via website',150,0),
    (2, default, 'compra via website',40,0);

SELECT * FROM orders;

INSERT INTO productOrder (idPOproduct,idPOorder,poQuantity,poStatus)
VALUES
	(8,1,2,NULL),
    (9,1,2,NULL),
    (10,2,2,NULL);
    
SELECT * FROM productOrder;

INSERT INTO productStorage (storageLocation,quantity)
VALUES
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',500),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);

INSERT INTO storageLocation (idLproduct,idLstorage,location)
VALUES
    (8,1,'RJ'),
    (9,6,'GO');

INSERT INTO supplier (socialName,CNPJ,contact)
VALUES
	('Almeida e filhos',26846915872646,2121220909),
    ('Eletrônicos Silva',61937641137697,11987876655),
    ('Eletrônicos Valma',52558896625620,6132224456);
    
INSERT INTO productSupplier (idPsSupplier,idPsProduct,quantity)
VALUES
	(1,8,500),
    (1,9,300),
    (2,11,329),
    (3,10,296),
    (1,12,100);
    
INSERT INTO seller (socialName,abstName,CNPJ,CPF,location,contact)
VALUES
	('Tech eletronics',null,53051609721057,null,'Rio de Janeiro',2132433388),
    ('Botique Durgs',null,null,14677397110,'Rio de Janeiro',21988001100),
    ('Kids World',null,87051609721934,null,'São Paulo',11976554433),
    ('Eletrônicos Silva',null,61937641137697,null,'Rio de Janeiro',21988001144);

select * from seller;
select * from product;

INSERT INTO productSeller (idPseller,idPproduct,prodQuantity)
VALUES
	(4,9,80),
    (5,10,10);
    