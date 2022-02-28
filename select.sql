
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
/*вывод основных данных о товаре*/
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

/*список категорий*/
SELECT c.name
FROM product_category pc
JOIN category c
	ON pc.category_id = c.category_id
		AND pc.product_id = 1 /*product_id - переменная, полученная через метод GET*/
		
/*список дополнительных картинок*/
SELECT i.image
FROM product_image pi
JOIN image i
	ON pi.image_id = i.image_id
		AND pi.product_id = 1 /*product_id - переменная, полученная через метод GET*/
