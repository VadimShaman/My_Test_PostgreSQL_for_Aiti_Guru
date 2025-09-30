-- Создание таблицы каталога
CREATE TABLE catalog (
    -- Столбец с первичным ключом
    id SERIAL PRIMARY KEY,
    -- Имя категории
    name VARCHAR(255) NOT NULL,
    -- Ссылка на родительскую категорию
    parent_id INTEGER NULL,
    -- объявление внешнего ключа для столбца parent_id
    FOREIGN KEY (parent_id) REFERENCES catalog(id) ON DELETE CASCADE
);

-- Создание индекса для ускорения поиска дочерних категорий
CREATE INDEX idx_catalog_parent_id ON catalog(parent_id);