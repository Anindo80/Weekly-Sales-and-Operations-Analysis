CREATE View ingrdient_inventory_view AS
Select
	i.item_name,
    i.item_type,
    i.item_size,
    ing.ingredient_name,
    r.quantity AS amount_used,
    ing.ingredient_weight AS amount_in_1_quantity,
    r.unit, 
    SUBSTRING(ing.ingredient_price, 2, 5) AS price_per_quantity,
    inv.quantity AS quantity_left_in_inventory
From items i
Join recipes r ON i.item_code = r.recipe_id
Join ingredients ing ON r.ingredient_id = ing.ingredient_id
Join inventory inv ON ing.ingredient_id = inv.ingredient_id;
