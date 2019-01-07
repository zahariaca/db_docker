CREATE USER 'vm_admin'@'%' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS vendingmachine_m2;

GRANT ALL PRIVILEGES on vendingmachine_m2 . * to 'vm_admin'@'%';

FLUSH PRIVILEGES;

USE vendingmachine_m2;

CREATE TABLE `users` (
    `user_id` int(16) NOT NULL AUTO_INCREMENT,
    `username` varchar(32) NOT NULL,
    `password` char(64) NOT NULL,
    `isSupplier` tinyint(1) NOT NULL DEFAULT 0,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `username` (`username`)
);

INSERT INTO `users` 
VALUES (1, 'azaharia', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 1),
       (2, 'admin', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', 1), 
       (3, 'jackson', 'c775e7b757ede630cd0aa1113bd102661ab38829ca52a6422ab782862f268646', 0);

/* 1-n relationship with `users` table */
CREATE TABLE `products` (
    `product_id` int(16) NOT NULL AUTO_INCREMENT,
    `name` varchar(32) NOT NULL,
    `description` varchar(128) NOT NULL,
    `price` float(5,2) NOT NULL,
    `supplier_id` int(16) NOT NULL,
    PRIMARY KEY (`product_id`),
    FOREIGN KEY (`supplier_id`) REFERENCES users (`user_id`)
);

ALTER TABLE `products` AUTO_INCREMENT=1001;

INSERT INTO `products` 
VALUES  (NULL, 'Soda', 'Sugary refreshing beverage', 5.66, 2),
        (NULL, 'Chips', 'Salty pack of thin potatoes', 8.0, 2),
        (NULL, 'Milkduds', 'Delicious heaven bites', 12.78, 1),
        (NULL, 'Pomelo', 'Oversized orange', 90.6, 1),
        (NULL, 'Ritter Sport', 'Expensive delicious chocolate', 8.88, 2);

/* n-n relationship with `users` and `products` tabels */
CREATE TABLE `transactions` (
    `supplier_id` int(16) NOT NULL,
    `product_id` int(16) NOT NULL,
    `date` BIGINT(19) UNSIGNED NOT NULL,
    FOREIGN KEY (`supplier_id`) REFERENCES users (`user_id`),
    FOREIGN KEY (`product_id`) REFERENCES products (`product_id`)
);

INSERT INTO `transactions` VALUES (2, 1001, 1542664425498);
