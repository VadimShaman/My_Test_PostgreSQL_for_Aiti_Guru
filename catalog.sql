CREATE TABLE catalog (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id INTEGER NULL,
    FOREIGN KEY (parent_id) REFERENCES catalog(id) ON DELETE CASCADE
);

-- Создание индекса для ускорения поиска дочерних категорий
CREATE INDEX idx_catalog_parent_id ON catalog(parent_id);