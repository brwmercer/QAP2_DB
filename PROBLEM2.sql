CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL (10, 2),
    stock_quantity INT
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

-- Add Data to the file

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Hockey Stick', 229.99, 35),
('Hockey Gloves', 99.99, 63),
('Skates', 149.99, 86),
('Helmet', 74.99, 104),
('Jersey', 249.99, 18);

INSERT INTO customers (first_name, last_name, email) VALUES 
('Connor', 'Mcdavid', 'mvp@nhl.com'),
('Nathan', 'Mackinnon', 'stud@nhl.com'),
('Lane', 'Hutson', 'roty@nhl.com'),
('Sidney', 'Crosby', 'thebest@nhl.com');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-02-06'),
(2, '2025-02-06'),
(3, '2025-02-06'),
(4, '2025-02-06'),
(3, '2025-02-06');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), 
(1, 2, 1),
(2, 3, 2),
(2, 4, 1),
(3, 1, 3),
(3, 2, 1),
(4, 4, 1),
(4, 2, 1),
(5, 3, 1),
(5, 2, 1);