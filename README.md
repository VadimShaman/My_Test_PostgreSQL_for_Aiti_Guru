Даталогическая схема данных

CATALOG (Каталог категорий)
├── id: SERIAL (PK)
├── name: VARCHAR(255) NOT NULL
└── parent_id: INTEGER NULL (FK → CATALOG.id)

NOMENCLATURE (Номенклатура)
├── id: SERIAL (PK)
├── name: VARCHAR(255) NOT NULL
├── quantity: INTEGER NOT NULL DEFAULT 0
├── price: NUMERIC(10,2) NOT NULL CHECK (≥0)
└── catalog_id: INTEGER NOT NULL (FK → CATALOG.id)

CLIENTS (Клиенты)
├── id: SERIAL (PK)
├── name: VARCHAR(255) NOT NULL
└── address: TEXT NULL

ORDERS (Заказы)
├── id: SERIAL (PK)
├── client_id: INTEGER NOT NULL (FK → CLIENTS.id)
├── created_at: TIMESTAMP NOT NULL DEFAULT NOW()
└── status: VARCHAR(50) NOT NULL DEFAULT 'new'

ORDER_ITEMS (Позиции заказа)
├── id: SERIAL (PK)
├── order_id: INTEGER NOT NULL (FK → ORDERS.id)
├── nomenclature_id: INTEGER NOT NULL (FK → NOMENCLATURE.id)
├── quantity: INTEGER NOT NULL CHECK (>0)
└── price_at_order: NUMERIC(10,2) NOT NULL CHECK (≥0)