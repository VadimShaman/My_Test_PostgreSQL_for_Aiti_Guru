-- Создание таблицы 
CREATE TABLE order_items (
    -- Столбец с первичным ключом
    id SERIAL PRIMARY KEY,
    -- Ссылка на заказ
    order_id INTEGER NOT NULL,
    -- Ссылка на товар из номенклатуры
    nomenclature_id INTEGER NOT NULL,
    -- Количество товара в заказе
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    -- Цена товара на момент заказа
    price_at_order NUMERIC(10, 2) NOT NULL CHECK (price_at_order >= 0),
    -- При удалении заказа автоматически удаляются все его позиции
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    -- Связь с таблицей товаров
    FOREIGN KEY (nomenclature_id) REFERENCES nomenclature(id)
);

-- Составной индекс для быстрого поиска всех позиций заказа
CREATE INDEX idx_order_items_order_id ON order_items(order_id);