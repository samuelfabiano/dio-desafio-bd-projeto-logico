USE ecommerce;

-- Quantos pedidos foram feitos por cada cliente?
select CONCAT(c.Fname, ' ', c.Lname) as 'Cliente', count(o.idOrderClient) as 'Quantidade de Pedidos'
from orders as o join clients as c on o.idOrderClient=c.idClient
group by c.idClient
order by count(o.idOrderClient) desc, c.Fname;

-- Quantidade de compras  feitas via aplicaitvo e pagamento feito em dinheiro
select count(*)
from orders
where paymentCash=1 and orderDescription like 'compra via aplicativo';

-- Algum vendedor também é fornecedor?
select v.socialName
	,v.CNPJ
from seller as v join supplier as f on v.CNPJ=f.CNPJ
order by v.socialName;

-- Relação de produtos fornecedores e estoques
select p.Pname as 'Produto'
	,s.socialName as 'Fornecedor'
    ,ps.quantity as 'Quantidade em estoque'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
order by p.Pname;

-- Relação de nomes dos fornecedores e nomes dos produtos
select s.socialName as 'Fornecedor'
	,p.Pname as 'Produto'
from productSupplier as ps join product as p on ps.idPsProduct=p.idProduct
	join supplier as s on ps.idPsSupplier=s.idSupplier
order by s.socialName;
