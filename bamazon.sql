DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT,
    item_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NULL,
    quantity INT default 0,
    PRIMARY KEY (id)
);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Sapporo", "Beer", 2.50, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Budweiser", "Beer", 2.75, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Bud Light", "Beer", 2.00, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Corona", "Beer", 2.25, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Blue Moon", "Beer", 2.20, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Uinta", "Beer", 2.50, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("GoT Mead", "Beer", 4.00, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Butter Beer", "Beer", 5.25, 100);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Red Solo Cups", "Drinking thangs", 0.05, 1000);

INSERT INTO products (item_name, department, price, quantity)
VALUES ("Ice", "Drinking thangs", 10.00, 100);