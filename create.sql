CREATE DATABASE shop;

CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    description TEXT
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    discount FLOAT,
    description TEXT,
    main_img VARCHAR(250)
);

CREATE TABLE product_category (
    category_id INT,
    product_id INT,
    main_category BOOLEAN, 
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id)
);

CREATE TABLE image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    img VARCHAR(250),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);