# Projeto lógico de banco de dados
Implementação do projeto lógico de banco de dados para um cenário E-commerce.

Primeiramente, foi apresentado a modalagem de referência, feita pela professora Juliana Mascarenahs. Os scripts estão disponíveis no diretório /scripts.

Diante disso, foi feita uma modelagem refinada conforme FIGURA 1, disponível neste repositório.

Em seguida os seguintes passos foram executados:
1. Criação dos Scripts SQL para criação do esquema do banco de dados. O arquivo está disponível no diretório /scripts-refinados/scripts.sql
2. Inserção dos dados. Arquivo disponível no diretório /scripts-refinados/insert-data.sql¹

Diante disso, abaixo uma amostra dos resultados obtidos:

## Quantos pedidos foram feitos por cada cliente?
```bash
select CONCAT(c.Fname, ' ', c.Lname) as 'Cliente', count(o.idOrderClient) as 'Quantidade de Pedidos'
from orders as o join clients as c on o.idOrderClient=c.idClient
group by c.idClient
order by count(o.idOrderClient) desc, c.Fname;
```
### Resultado
![image](https://user-images.githubusercontent.com/89883269/201528696-18edb96d-2146-4881-ab46-53e80ab04678.png)

## Quantidade de compras  feitas via aplicaitvo e pagamento feito em cartão de crédito
```bash
select count(*) as 'Quantidade'
from orders
where idOrderPayment=4 and orderDescription like 'compra via aplicativo';
```
### Resultado
![image](https://user-images.githubusercontent.com/89883269/201528754-c44bc1ba-e00e-4d03-b875-385b8a37805f.png)

## Vendedores quem também são fornecedores
```bash
select distinct v.socialName
from seller as v join supplier as f on v.idSellerCnpj = f.idSupplierCnpj
order by v.socialName;
```
### Resultado
![image](https://user-images.githubusercontent.com/89883269/201528798-a161d5c7-2925-4f09-96c4-b357add37c75.png)


## Relação de produtos fornecedores e estoques
```bash
select p.pDescription as 'Produto'
	,s.socialName as 'Fornecedor'
  ,ps.quantity as 'Quantidade em estoque'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
order by p.pDescription;
```
### Resultado
![image](https://user-images.githubusercontent.com/89883269/201528858-a26e2218-0f92-4227-bf41-724e5830ad80.png)

## Relação de produtos fornecedores que possurm em estoque entre 130 e 160
```bash
select p.pDescription as 'Produto'
	,s.socialName as 'Fornecedor'
    ,ps.quantity as 'Quantidade em estoque'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
group by p.pDescription,s.socialName
```
![image](https://user-images.githubusercontent.com/89883269/201528885-b9947c4a-2c82-4629-9933-1e688f138687.png)

¹ Foram utilizados dados fictícios, muitos deles gerados no site https://generatedata.com/
