-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2022 at 09:53 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fos`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categorieId` int(12) NOT NULL,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(1, 'BREAKFAST', 'A delight for veggie lovers! Choose from our wide range of delicious vegetarian pizzas, it\'s softer and tastier', '2021-03-17 18:16:28'),
(2, 'INDIAN-FOOD', 'Spicy, rich, flavourful and diverse are terms that are frequently used to describe Indian food. All these words are apt in describing Indian .', '2021-03-17 18:17:14'),
(3, 'PIZZA-BURGUR', 'Indulge into mouth-watering taste of Pizza mania range, perfect answer to all your food cravings', '2021-03-17 18:17:43'),
(4, 'CHINESE', 'Mango Chilli Chicken Recipe. Mango Chilli Chicken ; Mushroom Noodles Recipe. Mushroom Noodles ; Chilli Chaap Recipe. Chilli Chaap ; Schezwan Dosa ...', '2021-03-17 18:19:10'),
(5, 'SANDWICH', 'Complement your sandwich with wide range of beverages available at Domino\'s Pizza India', '2021-03-17 21:58:58'),
(6, 'SWEET-DISH', 'sandwich, in its basic form, slices of meat, cheese, or other food placed between two slices of bread. ', '2021-03-18 07:55:28'),
(7, 'BEVERAGE', 'A drink or beverage is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture.', '2021-03-18 08:06:30'),
(8, 'BIRIYANI', 'Biryani is a mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, and usually some type of meat ...', '2021-03-18 08:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contactId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT 0 COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `contactreply`
--

CREATE TABLE `contactreply` (
  `id` int(21) NOT NULL,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deliverydetails`
--

CREATE TABLE `deliverydetails` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `deliverydetails`
--

INSERT INTO `deliverydetails` (`id`, `orderId`, `deliveryBoyName`, `deliveryBoyPhoneNo`, `deliveryTime`, `dateTime`) VALUES
(1, 1, 'boy1', 9878723223, 12, '2022-11-24 16:25:27'),
(2, 2, 'boy1', 9878723223, 12, '2022-11-24 16:27:51'),
(3, 3, 'boy1', 1234567890, 12, '2022-11-24 16:27:13'),
(4, 4, 'boy2', 8786954535, 120, '2022-11-24 16:54:50'),
(5, 5, 'sham', 5436576576, 60, '2022-11-25 15:31:51'),
(6, 6, 'santoj', 5645646455, 12, '2022-11-30 18:23:17');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(21) NOT NULL,
  `orderId` int(21) NOT NULL,
  `foodId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `foodId`, `itemQuantity`) VALUES
(1, 4, 13, 1),
(2, 4, 1, 1),
(3, 5, 13, 1),
(4, 5, 14, 1),
(5, 6, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(21) NOT NULL,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(1, 3, 'majhauli, ttuygu', 123456, 1234567890, 249, '0', '6', '2022-11-23 20:51:29'),
(2, 4, 'ererte, fghr', 843334, 9102772001, 50, '0', '1', '2022-11-24 13:31:16'),
(3, 4, '123, 112', 232412, 1223242342, 189, '0', '3', '2022-11-24 14:43:08'),
(4, 4, '1234, 23234', 232412, 1234567890, 90, '0', '3', '2022-11-24 15:53:45'),
(5, 4, 'ct collage, shahpur', 123456, 9675768768, 289, '0', '4', '2022-11-25 15:29:05'),
(6, 4, 'sfdgg, dfgfghg', 123456, 5645646455, 120, '0', '3', '2022-11-30 18:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `foodId` int(12) NOT NULL,
  `foodName` varchar(255) NOT NULL,
  `foodPrice` int(12) NOT NULL,
  `foodDesc` text NOT NULL,
  `foodCategorieId` int(12) NOT NULL,
  `foodPubDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`foodId`, `foodName`, `foodPrice`, `foodDesc`, `foodCategorieId`, `foodPubDate`) VALUES
(1, 'Allu Paratha with curd', 50, 'Aloo Paratha are popular Indian flatbreads stuffed with a delicious spiced potato mixture. In Hindi, Aloo means “Potatoes” and Paratha means “ ...', 1, '2021-03-17 21:03:26'),
(2, 'Samosa', 20, 'The ever-popular Margherita - loaded with extra cheese... oodies of it', 1, '2021-03-17 21:20:58'),
(3, 'maggie', 30, 'Maggi is a popular instant noodle accompanied with a packet of flavoring (known as tastemaker). It is very simple to prepare and is a famous ..', 1, '2021-03-17 21:22:07'),
(4, 'Egg roll', 50, 'egg roll....................', 1, '2021-03-17 21:23:05'),
(5, 'spring roll', 70, 'spring roll is a chinese food...', 1, '2021-03-17 21:23:48'),
(6, 'Omlette', 40, 'For a vegetarian looking for a BIG treat that goes easy on the spices, this one\'s got it all.. The onions, the capsicum, those delectable mushrooms - with paneer and golden corn to top it all.\r\n\r\n', 1, '2021-03-17 21:24:38'),
(7, 'egg omlette', 40, 'breakfast.....', 1, '2021-03-17 21:25:42'),
(8, 'chana bhatura', 50, 'famous fast food.....', 1, '2021-03-17 21:26:31'),
(9, 'paneer bhatura', 70, 'Paneer and bhatura famous fast food', 1, '2021-03-17 21:27:21'),
(10, 'checken roll', 80, 'famous fast food ...... checken roll', 1, '2021-03-17 21:28:06'),
(11, 'Bread omlete', 50, 'egg and bread mixed item...', 1, '2021-03-17 21:28:49'),
(12, 'Samosa chatni', 20, '2 samosa and chatni....', 1, '2021-03-17 21:29:41'),
(13, 'Fried Daal', 40, 'extra delisious testy', 2, '2021-03-17 21:34:37'),
(14, 'kadhai paneer', 120, 'kadhai paneer extra chilli....', 2, '2021-03-17 21:35:31'),
(15, 'Shahi paneer', 110, 'shahi paneer item of indian food...', 2, '2021-03-17 21:36:36'),
(16, 'Non Veg Supreme\r\n', 120, 'Bite into supreme delight of Black Olives, Onions, Grilled Mushrooms, Pepper BBQ Chicken, Peri-Peri Chicken, Grilled Chicken Rashers\r\n\r\n', 2, '2021-03-17 21:37:21'),
(17, 'Daal makhni', 40, 'Treat your taste buds with Double Pepper Barbecue Chicken, Peri-Peri Chicken, Chicken Tikka & Grilled Chicken Rashers', 2, '2021-03-17 21:38:13'),
(18, 'Mixed veg', 70, 'mixed veg item ..... indian food', 2, '2021-03-17 21:39:49'),
(19, 'Mushroom masala', 60, 'Mushroom.....1 palte', 2, '2021-03-17 21:40:58'),
(20, 'Egg curry', 60, 'Egg curry extra chilli 1 plate', 2, '2021-03-17 21:41:49'),
(21, 'Tomato pizza', 99, 'Juicy tomato in a flavourful combination with cheese I tangy sauce', 3, '2021-03-17 21:44:44'),
(22, 'VEG LOADED', 149, 'Tomato | Grilled Mushroom |Jalapeno |Golden Corn | Beans in a fresh pan crust', 3, '2021-03-17 21:45:34'),
(23, 'CHEESY', 99, 'Orange Cheddar Cheese I Mozzarella', 3, '2021-03-17 21:46:21'),
(24, 'Noodles burger', 50, 'Capsicum', 3, '2021-03-17 21:47:07'),
(25, 'ONION', 60, 'onion', 3, '2021-03-17 21:47:51'),
(26, 'GOLDEN CORN', 50, 'Golden Corn', 3, '2021-03-17 21:48:44'),
(27, 'PANEER & ONION', 80, 'Creamy Paneer | Onion', 3, '2021-03-17 21:49:36'),
(28, 'CHEESE N TOMATO', 60, 'A delectable combination of cheese and juicy tomato', 3, '2021-03-17 21:50:20'),
(29, 'Momose', 60, 'Momose extra red chilli .....', 4, '2021-03-17 22:01:33'),
(30, 'Noodles', 50, 'Freshly Baked Garlic Bread stuffed with mozzarella cheese, sweet corns & tangy and spicy jalapeños', 4, '2021-03-17 22:02:50'),
(31, 'Spring roll', 70, '1 pices spring roll egg...', 4, '2021-03-17 22:03:44'),
(32, 'Manchuriyan', 60, 'chinese food.....', 4, '2021-03-17 22:05:08'),
(33, 'Manchuriyan copta', 80, 'Food....', 4, '2021-03-17 22:06:06'),
(34, 'Fried rice', 80, 'Chinese item french rice', 4, '2021-03-17 22:06:59'),
(35, 'Pasta', 60, 'fast food.....', 4, '2021-03-17 22:08:13'),
(36, 'french fried', 60, 'fast food...', 4, '2021-03-17 22:08:58'),
(37, 'Sandwich 1', 25, 'fast food ', 5, '2021-03-17 22:12:53'),
(38, 'sandwich 2', 35, 'fast food', 5, '2021-03-17 22:13:38'),
(39, 'sandwich 3', 45, 'fast food...', 5, '2021-03-17 22:14:24'),
(40, 'sandwich 4', 30, 'fast food', 5, '2021-03-17 22:16:29'),
(41, 'sandwich 5', 40, 'fastfood...', 5, '2021-03-17 22:17:08'),
(42, 'Ice Cream', 25, 'yummy sweet dish..... cold', 6, '2021-03-18 07:57:27'),
(43, 'Gualb jamun', 120, 'Sweet dish item', 6, '2021-03-18 07:59:52'),
(44, 'Cake pices', 40, 'one pices of cake....', 6, '2021-03-18 08:00:39'),
(45, 'Cold drink', 40, 'cold drink....\'', 6, '2021-03-18 08:01:29'),
(46, 'Tea', 15, 'one cup tea...', 6, '2021-03-18 08:03:17'),
(50, 'Mutton Biriyani', 220, 'biriyani....', 8, '2021-03-18 08:14:52'),
(51, 'Veg Biriyani', 140, 'Biriyani...', 8, '2021-03-18 08:15:36'),
(52, 'Non Veg Biriyani', 170, 'Barbeque Chicken, Hot \'n\' Spicy Chicken,Chunky Chicken and Chicken Salami.', 8, '2021-03-18 08:16:29');

-- --------------------------------------------------------

--
-- Table structure for table `sitedetail`
--

CREATE TABLE `sitedetail` (
  `tempId` int(11) NOT NULL,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'Punjabi Rasoi', 'lab.cse99@gmail.com', 7814666768, 7973719199, 'CT Group of institutions', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(21) NOT NULL,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(2, 'rjofmy16', 'Santosh', 'Kumar', 'lab.cse99@gmail.com', 7814666768, '1', '$2y$10$011SLAFNUWeoVeD8Iyv4UeCbRaic5KCozUTeebFbIUJ0tU1sDHuhe', '2022-11-23 20:34:51'),
(3, 'test@123', 'Demo', 'user1', 'test@test.com', 1234567890, '0', '$2y$10$WvRxJL3jcmw/.iyQD/DD6eJrshkjkcNWTXZePv0H4L/J4m.AXY1zS', '2022-11-23 20:38:13'),
(4, 'lab.cse99', 'santosh', 'Kumar', 'this@this.com', 9102772001, '0', '$2y$10$QoTcmXf9vyvXFVoMHeHo/eXyWvmQu6tmq6jxV5Em/QXiREdRr6Uwu', '2022-11-24 13:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `viewcart`
--

CREATE TABLE `viewcart` (
  `cartItemId` int(11) NOT NULL,
  `foodId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `foodId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(2, 1, 2, 0, '2022-11-23 20:49:03'),
(3, 14, 1, 3, '2022-11-23 20:50:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categorieId`);
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Indexes for table `contactreply`
--
ALTER TABLE `contactreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orderId` (`orderId`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`foodId`);
ALTER TABLE `pizza` ADD FULLTEXT KEY `pizzaName` (`foodName`,`foodDesc`);

--
-- Indexes for table `sitedetail`
--
ALTER TABLE `sitedetail`
  ADD PRIMARY KEY (`tempId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `viewcart`
--
ALTER TABLE `viewcart`
  ADD PRIMARY KEY (`cartItemId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categorieId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contactreply`
--
ALTER TABLE `contactreply`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deliverydetails`
--
ALTER TABLE `deliverydetails`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `foodId` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `sitedetail`
--
ALTER TABLE `sitedetail`
  MODIFY `tempId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(21) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `viewcart`
--
ALTER TABLE `viewcart`
  MODIFY `cartItemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
