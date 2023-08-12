BEGIN;
-- Détruit les tables éxistantes
DROP TABLE IF EXISTS "customer", "category", "product", "order", "order_has_product";
-- Création de la table 

CREATE TABLE IF NOT EXISTS "customer" (
  "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "lastname" VARCHAR(255) NOT NULL, 
  "firstname" VARCHAR(255) NOT NULL,
  "email" VARCHAR(255) NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  "updated_at" TIMESTAMPTZ
  );



CREATE TABLE IF NOT EXISTS "category" (
  "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "name" TEXT NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  "updated_at" TIMESTAMPTZ
);

CREATE TABLE IF NOT EXISTS "product" (
  "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "title" TEXT NOT NULL,
  "description" TEXT NOT NULL,
  "price" FLOAT NOT NULL,
  "available" BOOLEAN NOT NULL,
  "inventory" INTEGER NOT NULL,
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  "updated_at" TIMESTAMPTZ,
  "category_id" INTEGER NOT NULL REFERENCES "category" ("id")
);

CREATE TABLE IF NOT EXISTS "order" (
  "id" INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  "number_order" VARCHAR(10) NOT NULL,
  "status" VARCHAR(45) NOT NULL,
  "payment_method" VARCHAR(45),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW (),
  "updated_at" TIMESTAMPTZ,
  "customer_id" INTEGER NOT NULL REFERENCES "customer" ("id")
);

CREATE TABLE IF NOT EXISTS "order_has_product" (
  "order_id" integer NOT NULL REFERENCES "order" ("id"),
  "product_id" integer NOT NULL REFERENCES "product" ("id"),
  "created_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ 
);

INSERT INTO category ("name")
VALUES
('Accessoires'),
('Puériculture'),
('Vêtements');


INSERT INTO product ("title", "description","price","available","inventory", "category_id")
VALUES 
('Attache tétine silicone', 'Attache tétine pour garçon', 12.99,true, 10, 1),
('Mouche nez', 'mouche nez très pratique', 15.99, false, 20 , 2),
('Body', 'body pour garçon', 7.99, true, 100 , 3),
('Attache tétine silicone', 'Attache tétine pour fille', 12.99,true, 7, 1);

COMMIT; 



