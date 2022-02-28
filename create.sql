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
    main_category_id INT NOT NULL,
    main_img_id INT NOT NULL
);

CREATE TABLE image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(250)
);

CREATE TABLE product_category (
    product_id INT,
    category_id INT,
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (category_id) REFERENCES category (category_id),
    PRIMARY KEY (category_id, product_id)
);

CREATE TABLE product_image (
    product_id INT ,
    image_id INT ,
    FOREIGN KEY (product_id) REFERENCES product (product_id),
    FOREIGN KEY (image_id) REFERENCES image (image_id),
    PRIMARY KEY (product_id, image_id)
);

ALTER TABLE product
   ADD FOREIGN KEY (main_category_id) REFERENCES product_category (category_id),
   ADD FOREIGN KEY (main_img_id) REFERENCES product_image (image_id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
;



INSERT INTO category (name, description)
VALUES ('Мужчинам', 'Раздел мужской одежды'),
('Женщинам', 'Раздел женской одежды'),
('Юбки', 'Раздел с юбками'),
('Шорты', 'Раздел с шортами'),
('Рубашки', 'Раздел с рубашками');


INSERT INTO product (name, price, discount, description, main_category_id, main_img_id)
VALUES ('Рубашка 1', 1500, 0.1, 'Описание рубашки 1', 5, 1),
('Рубашка 2', 1600, 0.1, 'Описание рубашки 2', 5, 4),
('Юбка 1', 2500, 0.2, 'Описание юбки 1', 3, 7),
('Шорты 1', 2000, 0.8, 'Описание шорт 1', 4, 10),
('Шорты-юбка 1', 1500, 0.3, 'Описание шорты-юбки 1', 4, 13),
('Шорты 2', 3500, 0.1, 'Описание шорт 2', 4, 13),
('Рубашка 3', 4000, 0.2, 'Описание рубашки 3', 5, 16),
('Юбка 2', 3000, 0.1, 'Описание юбки 2', 3, 19);


INSERT INTO product_category (product_id, category_id)
 VALUES (1, 5),
(1, 2),
(2, 5),
(2, 1),
(3, 3),
(3, 2),
(4, 4),
(4, 1),
(5, 4),
(5, 3),
(5, 2),
(6, 4),
(6, 2),
(7, 5),
(8, 3),
(8, 2);

INSERT INTO image (image)
 VALUES ('image_1_1.png'),
 ('image_1_2.png'),
 ('image_1_3.png'),
 ('image_2_1.png'),
 ('image_2_2.png'),
 ('image_2_3.png'),
 ('image_3_1.png'),
 ('image_3_2.png'),
 ('image_3_3.png'),
 ('image_4_1.png'),
 ('image_4_2.png'),
 ('image_4_3.png'),
 ('image_5_1.png'),
 ('image_5_2.png'),
 ('image_5_3.png'),
 ('image_6_1.png'),
 ('image_6_2.png'),
 ('image_6_3.png'),
 ('image_7_1.png'),
 ('image_7_2.png'),
 ('image_7_3.png'),
 ('image_8_1.png'),
 ('image_8_2.png'),
 ('image_8_3.png');

INSERT INTO product_image (product_id, image_id)
 VALUES (1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 13),
(6, 14),
(6, 15),
(7, 16),
(7, 17),
(7, 18),
(8, 19),
(8, 20);
