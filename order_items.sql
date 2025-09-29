CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL,
    nomenclature_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    price_at_order NUMERIC(10, 2) NOT NULL CHECK (price_at_order >= 0),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (nomenclature_id) REFERENCES nomenclature(id)
);

-- Составной индекс для быстрого поиска всех позиций заказа
CREATE INDEX idx_order_items_order_id ON order_items(order_id);