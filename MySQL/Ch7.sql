#Q1

select distinct category_name
from categories
where category_id in (
    select category_id
    from products
)
order by category_name;

#Q2

select product_name, list_price
from products
where list_price > (
    select avg(list_price)
    from products
)
order by list_price desc;

#Q3

select category_name
from categories
where not exists (
    select 1
    from products
    where products.category_id = categories.category_id
);

#Q4

select 
    customers.email_address,
    order_items.order_id,
    SUM(order_items.quantity * order_items.item_price) AS order_total
from customers
join orders on 
	customers.customer_id = orders.customer_id
join order_items on 
	orders.order_id = order_items.order_id
group by customers.email_address, order_items.order_id;

select query1.email_address,
		MAX(query1.order_total)

from (
		select customers.email_address,
		order_items.order_id,
        SUM((order_items.item_price - order_items.discount_amount)*order_items.quantity) AS order_total

		from customers

		inner join orders on
			customers.customer_id = orders.customer_id
		inner join order_items on
			orders.order_id = order_items.order_id

		group by customers.email_address, orders.order_id
) AS query1 	

group by query1.email_address

order by MAX(query1.order_total) DESC
;

#	Q5

select
    p1.product_name,
    p1.discount_percent
    
from products p1

where p1.discount_percent not in (
									select p2.discount_percent
									from products p2
									where p1.product_id <> p2.product_id
)

order by p1.product_name
;

#Q6

select
    customers.email_address,
    orders.order_id,
    orders.order_date
    
from customers

inner join orders on
	customers.customer_id = orders.customer_id
    
where orders.order_date = (
        select MIN(order_date)
        from orders
        where orders.customer_id = customers.customer_id
)

order by orders.order_date, orders.order_id
;


