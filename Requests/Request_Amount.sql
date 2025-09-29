SELECT 
    c.name AS "Наименование клиента",
    SUM(oi.quantity * oi.price_at_order) AS "Сумма"
FROM clients c
LEFT JOIN orders o ON o.client_id = c.id
LEFT JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.id, c.name
ORDER BY "Сумма" DESC;