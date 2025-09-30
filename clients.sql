-- Создание таблицы
CREATE TABLE clients (
    -- Столбец с первичным ключом
    id SERIAL PRIMARY KEY,
    -- Наименование клиента
    name VARCHAR(255) NOT NULL,
    -- Адрес клиента
    address TEXT
);