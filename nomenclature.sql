-- Создание таблицы номенкулатура
CREATE TABLE nomenclature (
    -- Столбец с первичным ключом
    id SERIAL PRIMARY KEY,
    -- Название товара
    name VARCHAR(255) NOT NULL,
    -- Количество товара на складе, по умолчанию 0
    quantity INTEGER NOT NULL DEFAULT 0,
    -- Цена товара, >= 0
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    -- Ссылка на категорию товара
    catalog_id INTEGER NOT NULL,
    -- Внешний ключ, связывающий с таблицей категорий
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

-- Индекс для быстрого поиска товаров по категории
CREATE INDEX idx_nomenclature_catalog_id ON nomenclature(catalog_id);