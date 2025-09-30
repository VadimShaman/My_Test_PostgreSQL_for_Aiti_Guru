## Даталогическая схема данных

### **CATALOG** (Каталог категорий)
- `id` SERIAL PRIMARY KEY
- `name` VARCHAR(255) NOT NULL  
- `parent_id` INTEGER NULL, FOREIGN KEY → CATALOG.id

### **NOMENCLATURE** (Номенклатура)
- `id` SERIAL PRIMARY KEY
- `name` VARCHAR(255) NOT NULL
- `quantity` INTEGER NOT NULL DEFAULT 0
- `price` NUMERIC(10,2) NOT NULL CHECK (≥0)
- `catalog_id` INTEGER NOT NULL, FOREIGN KEY → CATALOG.id

### **CLIENTS** (Клиенты)
- `id` SERIAL PRIMARY KEY
- `name` VARCHAR(255) NOT NULL
- `address` TEXT NULL

### **ORDERS** (Заказы)
- `id` SERIAL PRIMARY KEY
- `client_id` INTEGER NOT NULL, FOREIGN KEY → CLIENTS.id
- `created_at` TIMESTAMP NOT NULL DEFAULT NOW()
- `status` VARCHAR(50) NOT NULL DEFAULT 'new'

### **ORDER_ITEMS** (Позиции заказа)
- `id` SERIAL PRIMARY KEY
- `order_id` INTEGER NOT NULL, FOREIGN KEY → ORDERS.id
- `nomenclature_id` INTEGER NOT NULL, FOREIGN KEY → NOMENCLATURE.id
- `quantity` INTEGER NOT NULL CHECK (>0)
- `price_at_order` NUMERIC(10,2) NOT NULL CHECK (≥0)