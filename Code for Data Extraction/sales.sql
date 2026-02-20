-- This query performs an INNER JOIN between the items and orders tables
-- to retrieve sales information, including item details,
-- order date and time, quantity, price, customer name, and order type (in or out)

SELECT
	i.item_name, 
    i.item_type,
    i.item_size,
    o.date, 
    o.time, 
    o.quantity,
    i.item_price,
    o.customer_name,
    IF ( o.in_or_out = '', 'N/A', o.in_or_out) AS in_or_out
FROM items i
JOIN orders o ON i.item_id = o.item_id;
