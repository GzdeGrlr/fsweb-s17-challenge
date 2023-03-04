-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.

--HEPSİBURADA - SATICI İLE İLGİLİ OLASI TABLOLAR

CREATE TABLE `seller`(
    `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `seller_name` TEXT NOT NULL,
    `seller_address` TEXT NOT NULL
);

CREATE TABLE `sub_categories`(
    `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `sub_category_name` TEXT NOT NULL,
    `category_id` INT UNSIGNED NOT NULL
);

CREATE TABLE `stores`(
    `store_id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `store_name` TEXT NOT NULL,
    `seller_id` INT UNSIGNED NOT NULL
);

CREATE TABLE `orders`(
    `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `store_id` INT UNSIGNED NOT NULL,
    `order_date` DATETIME NOT NULL
);

CREATE TABLE `product`(
    `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `product_name` TEXT NOT NULL,
    `product_price` BIGINT UNSIGNED NOT NULL,
    `product_quantity` INT UNSIGNED NOT NULL,
    `category_id` INT UNSIGNED NOT NULL,
    `sub_category_id` INT UNSIGNED NOT NULL,
    `seller_id` INT UNSIGNED NOT NULL
);

CREATE TABLE `categories`(
    `id` INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `category_name` TEXT NOT NULL
);

ALTER TABLE
    stores ADD FOREIGN KEY(seller_id) REFERENCES seller(id);
      
ALTER TABLE
    `product` ADD CONSTRAINT `product_seller_id_foreign` FOREIGN KEY(`seller_id`) REFERENCES `seller`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_sub_category_id_foreign` FOREIGN KEY(`sub_category_id`) REFERENCES `sub_categories`(`id`);
ALTER TABLE
    `product` ADD CONSTRAINT `product_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);
ALTER TABLE
    `orders` ADD CONSTRAINT `orders_store_id_foreign` FOREIGN KEY(`store_id`) REFERENCES `stores`(`store_id`);
ALTER TABLE
    `sub_categories` ADD CONSTRAINT `sub_categories_category_id_foreign` FOREIGN KEY(`category_id`) REFERENCES `categories`(`id`);