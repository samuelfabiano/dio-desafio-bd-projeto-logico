USE ecommercedio;

-- INSERIR DADOS DE PESSOA FÍSICA
INSERT INTO pessoa_fisica(cpf,gender,email)
VALUES
	(12345678901,'Masculino','fulano@mydomian.com'),
    (09876543212,'Feminino','nome.sobrenome@mydomian.com'),
    (34567890123,'Feminino','karyn@mydomian.com'),
    (67890123456,'Masculino','heather@mydomian.com'),
    (45678901234,'Feminino','katelyn@mydomian.com'),
    (89012345678,'Masculino','ria@mydomian.com'),
    (12312312345,'Masculino','andrew@mydomian.com'),
    (56756756789,'Masculino','rhonda@mydomian.com'),
    (34534567891,'Feminino','adriae@mydomian.com'),
    (56789045678,'Feminino','larissa@mydomian.com');

-- INSERIR DADOS DE PESSOA JURÍDICA
INSERT INTO pessoa_juridica(cnpj,socialName,abstName,email)
VALUES
	(78876301441124,"Nash Estes","semper","non.sapien@aol.edu"),
  (68241106481586,"Avye Freeman","aliquet.","eu@hotmail.couk"),
  (45979457588313,"Marvin Sparks","lacinia","metus@icloud.couk"),
  (62310741493744,"Galvin Day","neque.","mollis@icloud.ca"),
  (35920818001938,"Odessa Pugh","risus.","nunc.mauris.sapien@protonmail.couk"),
  (27321423203449,"Madeson Mckinney","eu","mauris@google.edu"),
  (94418372304512,"Connor Gray","sed","ipsum.primis.in@google.org"),
  (35379033811144,"Heather Ford","ac","neque@aol.ca"),
  (32750750430514,"Naomi Slater","orci.","integer.mollis@yahoo.ca"),
  (19263642893883,"Liberty Hardy","ullamcorper,","lacus.aliquam@google.edu");

-- INSERIR DADOS DOS CLIENTES
INSERT INTO clients (Fname,Minit,Lname,idCpf,idCnpj,Address)
VALUES
  ("Karyn","Rat","Ayers",1,null,"773-2215 Tellus Av."),
  ("Cheryl","Jon","Rodriquez",2,null,"311-5454 Sed Ave"),
  ("Jessamine","Ham","Wilder",3,null,"1494 Metus Avenue"),
  ("Larissa","Sua","Velez",4,null,"Ap #487-7600 Convallis Street"),
  ("Adria","Lai","Mcmillan",null,5,"5243 Facilisi. St."),
  ("Heather","Est","Salas",null,3,"Ap #820-4964 Pretium St."),
  ("Ria","Mar","Hodge",6,null,"Ap #686-574 Suspendisse Street"),
  ("Andrew","Ral","Weaver",7,null,"213-9631 Lorem Street"),
  ("Katelyn","Sou","Middleton",8,null,"766-1780 Massa Av."),
  ("Rhonda","Ter","Oneal",null,9,"Ap #464-3026 Feugiat Street");

-- INSERÇÃO DE PRODUTOS
INSERT INTO product (pDescription,category,valor)
VALUES
	('Fone de ouvido','Eletrônicos',40.00),
    ('Barbie Elsa','Brinquedos',30.00),
    ('Body Carters','Vestuário',80.00),
    ('Microfone Vedo','Eletrônicos',400.00),
    ('Sofá retrátil','Móveis',3000.00),
    ('Farinha de Arroz','Alimentos',2.60),
    ('Fire Stick Amazon','Eletrônicos',350.00);

-- INSERÇÃO DE CARTÃO DE CRÉDITO
INSERT INTO creditCard(cardNumber,ownerName,expirationDate,secutiryCode)
VALUES
	(12345678,"Karyn Ayers","2024-01-31",890);

-- INSERÇÃO DE PAGAMENTOS
INSERT INTO payments (typePayment,idPaymentCard)
VALUES
	("Boleto",null),
    ("Cartão",1);

-- INSERÇÃO DE ENTRAGAS
INSERT INTO deliver(deliverStatus,deliverdDate,trackingCode)
VALUES
	("Entregue","2021-12-15",7158),
	("Com a transpotadora","2021-11-14",8167),
	("Preparando envio","2021-12-27",8220),
	("Com a transpotadora","2021-12-28",2553),
	("Entregue","2021-12-04",9884);

-- INSERÇÃO DE PEDIDOS
INSERT INTO orders (orderStatus,orderDescription,sendValue,idOrderClient,idOrderDeliver,idOrderPayment)
VALUES
	("Em processamento","Compra via website",10,2,3,4),
  ("Em processamento","Compra via aplicativo",12,3,2,3),
  ("Confirmado","Compra via website",11,2,3,3),
  ("Em processamento","Compra via website",20,2,3,4),
  ("Confirmado","Compra via aplicativo",11,6,3,4),
  ("Confirmado","Compra via website",13,7,2,3),
  ("Em processamento","Compra via aplicativo",13,4,2,3),
  ("Em processamento","Compra via aplicativo",17,8,3,4),
  ("Em processamento","Compra via aplicativo",16,6,1,4),
  ("Confirmado","Compra via website",16,8,5,3);

-- INSERÇÃO DO FORNECEDOR
INSERT INTO supplier (socialName,idSupplierCpf,idSupplierCnpj,contact)
VALUES
	("Moana Hahn",null,3,30618375784),
  ("Emi Hopper",null,7,92047566214),
  ("Katell Gutierrez",null,3,50055179400),
  ("Deborah Petersen",null,7,24722956451),
  ("Simon Vaughan",null,5,21080081912),
  ("Hannah Wilcox",null,7,18159761344),
  ("Stacey Marsh",6,null,65277553430),
  ("Christian Mcdonald",3,null,57154652069),
  ("Charissa Underwood",null,3,59762462890),
  ("Yolanda Mendez",null,8,27811915157);

-- INSERÇÃO DO ESTOQUE
INSERT INTO productStorage (quantity)
VALUES
	(900),
    (3500);

-- INSERÇÃO DO VENDEDORES
INSERT INTO seller (socialName,location,idSellerrCpf,idSellerCnpj)
VALUES
	("Bevis Bowman","Duque de Caxias",null,7),
  ("Hakeem Mercado","Feira de Santana",null,2),
  ("Isabella Brock","Criciúma",4,null),
  ("Ulric Page","Itapipoca",2,null),
  ("Charde Peck","Santa Inês",null,3),
  ("Dolan Montoya","Jaboatão dos Guararapes",null,6),
  ("Josiah Sears","Salvador",4,null),
  ("Uta Hale","Juazeiro do Norte",4,null),
  ("Cullen Mcintosh","Cajazeiras",null,8),
  ("Alec Fernandez","Juazeiro",3,null);

-- INSERÇÃO DOS PRODUTOS DO VENDEDORES
INSERT INTO productSeller (idPseller,idPproduct,prodQuantity)
VALUES
	 (6,7,9),
  (9,7,4),
  (5,6,4),
  (4,5,7),
  (9,6,6),
  (9,5,3),
  (4,7,2),
  (6,3,8),
  (9,3,2),
  (6,4,4);

-- INSERÇÃOD DOS PRODUTOS DOS PEDIDOS
INSERT INTO productOrder (idPOproduct,idPOorder,poQuantity,poStatus)
VALUES
	(5,14,2,DEFAULT),
  (1,14,1,"Sem estoque"),
  (2,18,2,DEFAULT),
  (7,20,5,"Sem estoque"),
  (2,16,5,"Sem estoque"),
  (6,11,5,DEFAULT),
  (6,19,3,DEFAULT);
    
-- INSERÇÃO DOS LOCAIS DE ARMAZANMENTO
INSERT INTO storageLocation (idLproduct,idLstorage,location)
VALUES
	 (5,2,"Florianópolis"),
  (7,1,"Paranaguá"),
  (2,1,"Bragança"),
  (3,2,"Crato"),
  (1,2,"Camaçari"),
  (4,2,"Abaetetuba"),
  (1,1,"Chapecó"),
  (2,2,"Maracanaú"),
  (3,1,"Ilhéus"),
  (4,1,"Camaçari");

-- INSERÇÃO DOS PRODUTOS DOS FORNECEDORES
INSERT INTO productSupplier (idPsSupplier,idPsProduct,quantity)
VALUES
	(3,3,155),
  (6,7,253),
  (5,2,164),
  (8,5,204),
  (5,6,274),
  (2,5,249),
  (7,7,162),
  (7,4,136),
  (5,3,9),
  (4,5,226);

-- INSERÇÃO DO CARTÃOD DE CRÉDITO DOS CLIENTES
INSERT INTO creditCardClient(idClientCreditCard,idCardCreditCard)
values
	(2,1);


    