INSERT INTO category (name, description)
VALUES ('Мужчинам', 'Раздел мужской одежды'),
('Женщинам', 'Раздел женской одежды'),
('Юбки', 'Раздел с юбками'),
('Шорты', 'Раздел с шортами'),
('Рубашки', 'Раздел с рубашками');


INSERT INTO product (name, price, discount, description, main_img)
VALUES ('Рубашка 1', 1500, 0.1, 'Описание рубашки 1', 'image1.png'),
('Рубашка 2', 1600, 0.1, 'Описание рубашки 2', 'image2.png'),
('Юбка 1', 2500, 0.2, 'Описание юбки 1', 'image3.png'),
('Шорты 1', 2000, 1, 'Описание шорт 1', 'image4.png'),
('Шорты-юбка 1', 1500, 0.3, 'Описание шорты-юбки 1', 'image5.png'),
('Шорты 2', 3500, 0.1, 'Описание шорт 2', 'image6.png'),
('Рубашка 3', 4000, 0.2, 'Описание рубашки 3', 'image7.png'),
('Юбка 2', 3000, 0.1, 'Описание юбки 2', 'image8.png');


INSERT INTO product_category (product_id, category_id, main_category)
 VALUES (1, 5, true),
(1, 2, false),
(2, 5, true),
(2, 1, false),
(3, 3, true),
(3, 2, false),
(4, 4, true),
(4, 1, false),
(5, 4, true),
(5, 3, false),
(5, 2, false),
(6, 4, true),
(6, 2, false),
(7, 5, true),
(8, 3, true),
(8, 2, false);

INSERT INTO image (product_id, img)
 VALUES (1, 'image1.png'),
 (1, 'image1_2.png'),
 (1, 'image1_3.png'),
 (2, 'image2.png'),
 (2, 'image2_2.png'),
 (2, 'image2_3.png'),
 (3, 'image3.png'),
 (3, 'image3_2.png'),
 (3, 'image3_3.png'),
 (4, 'image4.png'),
 (4, 'image4_2.png'),
 (4, 'image4_3.png'),
 (5, 'image5.png'),
 (5, 'image5_2.png'),
 (5, 'image5_3.png'),
 (6, 'image6.png'),
 (6, 'image6_2.png'),
 (6, 'image6_3.png'),
 (7, 'image7.png'),
 (7, 'image7_2.png'),
 (7, 'image7_3.png'),
 (8, 'image8.png'),
 (8, 'image8_2.png'),
 (8, 'image8_3.png');


//все скидки 
SELECT p.product_id, p.name, p.price, p.discount,  pp.price_discount, round(pp.price_discount * 0.9) as funal_price
FROM (select product_id, round(price - price*discount) as price_discount
     from product) pp, 
		product p
WHERE p.product_id = pp.product_id

/*навигация по сайту*/
/* все категории и количество товаров в них */
SELECT pc.category_id,
		 c.name,
		 count(*) AS count_category
FROM product_category pc
JOIN category c
	ON pc.category_id = c.category_id
GROUP BY  category_id
ORDER BY  count_category DESC

/*страница с категориями и товарами*/
/*вывод карточек с товарами*/
SELECT p.product_id,
		 p.name,
		 c.name AS category_name,
		 i.image AS image_name
FROM product p
JOIN category c
	ON p.main_category_id = c.category_id
JOIN image i
	ON p.main_img_id = i.image_id
WHERE p.product_id IN 
	(SELECT pc.product_id
	FROM product_category pc
	WHERE pc.category_id = 3) /*category_id - переменная, полученная через метод GET*/

/*страница карточки с товаром*/

SELECT p.product_id, p.name, p.price, pp.price_discount, round(pp.price_discount * 0.9) as funal_price, p.description, i.image AS image_name
FROM (select product_id, round(price - price*discount) as price_discount
     from product) pp, 
		product p,
        image i
WHERE p.product_id = pp.product_id AND p.main_img_id = i.image_id AND p.product_id = 1

SELECT p.product_id,
		 p.name,
		 p.price,
		 round(price - price*discount) AS price_discount,
		 round((price - price*discount) * 0.9) AS funal_price,
		 p.description,
		 i.image AS image_name
FROM product p, image i
WHERE p.main_img_id = i.image_id
		AND p.product_id = 1 /*product_id - переменная, полученная через метод GET*/


SELECT c.name
FROM product_category pc
JOIN category c
	ON pc.category_id = c.category_id
		AND pc.product_id = 1

SELECT i.image
FROM product_image pi
JOIN image i
	ON pi.image_id = i.image_id
		AND pi.product_id = 1