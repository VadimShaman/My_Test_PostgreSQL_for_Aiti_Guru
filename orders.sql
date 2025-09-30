-- Создание таблицы 
CREATE TABLE orders (
    -- Столбец с первичным ключом
    id SERIAL PRIMARY KEY,
    -- Ссылка на клиента, который сделал заказ
    client_id INTEGER NOT NULL,
    -- Дата и время создания заказа
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    -- Статус заказа
    status VARCHAR(50) NOT NULL DEFAULT 'new',
    -- Внешний ключ, связывающий с таблицей клиентов
    FOREIGN KEY (client_id) REFERENCES clients(id)
);