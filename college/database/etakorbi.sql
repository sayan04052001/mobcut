-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 12:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `product_title` varchar(300) NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_details` varchar(500) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `user_email`, `product_title`, `product_price`, `product_details`, `product_image`, `product_quantity`) VALUES
(6, 10001, 'shreyas80@gmail.com', '  Vivo X80', 54999, '  8 GB RAM | 128 GB ROM ', 'vivo X80.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(10) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `area` varchar(100) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `pincode` int(10) NOT NULL,
  `landmark` varchar(100) NOT NULL,
  `totalorder_price` int(10) NOT NULL,
  `order_status` varchar(20) NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_status` varchar(15) NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `user_email`, `phone`, `name`, `area`, `city`, `state`, `pincode`, `landmark`, `totalorder_price`, `order_status`, `payment_type`, `payment_status`, `order_date`) VALUES
(1000, 'sahaparna0410@gmail.com', '0801 738 5449', 'Manik Saha', 'DAMDUM', 'dumdum', 'WEST BENGAL', 700030, '1c', 54999, 'Delivered', 'card', 'Success', '2023-05-20'),
(1001, 'sahaparna0410@gmail.com', '0801 738 5449', '', 'ghnjm', 'dumdum', 'WEST BENGAL', 700030, '', 164997, 'Confirmed', 'cash', 'Pending', '2023-05-20'),
(1002, 'shreyas80@gmail.com', '', 'sdjhgs', '', '', '', 0, '', 126298, 'Pending', 'cash', 'Pending', '2023-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `orderdetails_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `product_quantity` int(10) NOT NULL,
  `product_price` int(15) NOT NULL,
  `product_title` varchar(200) NOT NULL,
  `product_details` varchar(300) NOT NULL,
  `product_image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`orderdetails_id`, `order_id`, `product_id`, `product_quantity`, `product_price`, `product_title`, `product_details`, `product_image`) VALUES
(1, 1000, 10001, 1, 54999, '  Vivo X80', '  8 GB RAM | 128 GB ROM ', 'vivo X80.jpg'),
(2, 1001, 10001, 3, 54999, '  Vivo X80', '  8 GB RAM | 128 GB ROM ', 'vivo X80.jpg'),
(3, 1002, 10000, 1, 124999, '  Samsung Galaxy S23 Ultra 5Gr   ', '  12 GB RAM | 256 GB ROM 12 GB RAM | 256 GB ROM ', 'Samsung Galaxy S23 Ultra 5G.jpg'),
(4, 1002, 10012, 1, 1299, '  Boult Audio Z40 with Zen ENC Mic', '  Bluetooth version: 5.1 Wireless range: 10 m', 'Boult Audio Z40 with Zen ENC Mic.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) NOT NULL,
  `product_type` varchar(50) NOT NULL,
  `product_title` varchar(300) NOT NULL,
  `product_details` varchar(500) NOT NULL,
  `product_more_details` text NOT NULL,
  `product_price` int(15) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_type`, `product_title`, `product_details`, `product_more_details`, `product_price`, `product_image`, `product_date`) VALUES
(10000, 'Phone', '  Samsung Galaxy S23 Ultra 5Gr   ', '  12 GB RAM | 256 GB ROM 12 GB RAM | 256 GB ROM ', ' 17.27 cm (6.8 inch) Quad HD+ Display\r\n200MP + 10MP + 12MP + 10MP | 12MP Front Camera\r\n5000 mAh Lithium Ion Battery\r\nQualcomm Snapdragon 8 Gen 2 Processor', 124999, 'Samsung Galaxy S23 Ultra 5G.jpg', '2023-05-20'),
(10001, 'Phone', '  Vivo X80', '  8 GB RAM | 128 GB ROM ', ' 17.22 cm (6.78 inch) Full HD+ Display\r\n50MP + 12MP + 12MP | 32MP Front Camera\r\n4500 mAh Lithium Battery\r\nMediatek Dimensity 9000 Processor', 54999, 'vivo X80.jpg', '2023-05-20'),
(10002, 'Phone', '  Google Pixel 7 Pro 5G', '    12 GB RAM | 128 GB ROM', ' 17.02 cm (6.7 inch) Quad HD+ Display\r\n50MP + 48MP + 12MP | 10.8MP Front Camera\r\n4926 mAh Battery\r\nGoogle Tensor G2 Processor', 80999, 'Google Pixel 7 Pro 5G.jpg', '2023-05-20'),
(10003, 'Phone', '  OnePlus 11R 5G ', '  8 GB RAM | 128 GB ROM', ' 17.02 cm (6.7 inch) Display\r\n50MP Rear Camera\r\n5000 mAh Battery', 39601, 'OnePlus-11-Pro.jpg', '2023-05-20'),
(10004, 'Phone', '  vivo V27 Pro 5G', '  12 GB RAM | 256 GB ROM', ' 17.22 cm (6.78 inch) Full HD+ Display\r\n50MP (OIS) + 8MP + 2MP | 50MP Front Camera\r\n4600 mAh Battery\r\nMediatek Dimensity 8200 Processor', 42999, 'vivo V27 Pro 5G.jpeg', '2023-05-20'),
(10005, 'Phone', '  POCO X5 Pro 5G (Astral Black)', '  8 GB RAM | 256 GB ROM', ' 16.94 cm (6.67 inch) Full HD+ Display\r\n108MP + 8MP + 2MP | 16MP Front Camera\r\n5000 mAh Battery\r\nQualcomm Snapdragon 778G Processor', 24999, 'POCO X5 Pro 5G (Astral Black, 256 GB).jpg', '2023-05-20'),
(10006, 'Phone', '  OnePlus 10R 5G ', '  12 GB RAM | 256 GB ROM', ' 17.02 cm (6.7 inch) Display\r\n50MP Rear Camera\r\n5000 mAh Battery', 36798, 'oneplus-10-pro-5g.jpg', '2023-05-20'),
(10007, 'Phone', '  MOTOROLA Edge 30 Fusion', '   8 GB RAM | 128 GB ROM', ' 16.64 cm (6.55 inch) Full HD+ Display\r\n50MP + 13MP + 2MP | 32MP Front Camera\r\n4400 mAh Lithium Battery\r\nQualcomm Snapdragon 888 + Processor', 39999, 'MOTOROLA Edge 30 Fusion.jpg', '2023-05-20'),
(10008, 'Tablet', '  Oppo Pad Air 4 GB RAM', '  4 GB RAM | 128 GB ROM', ' 26.31 cm (10.36 inch) 2K Display\r\n8 MP Primary Camera | 8 MP Front\r\nAndroid ColorOS 12.1 | Battery: 7100 mAh\r\nProcessor: Qualcomm Snapdragon 680', 19, 'Oppo Pad Air 4 GB RAM.jpg', '2023-05-20'),
(10009, 'Tablet', '  Lenovo Tab Yoga', '  4 GB RAM | 128 GB ROM | Expandable Upto 256 GB ', ' 27.94 cm (11 inch) Full HD Display\r\n8 MP Primary Camera | 8 MP Front\r\nAndroid 11 | Battery: 7500 mAh\r\nVoice Call (Single Sim LTE)\r\nProcessor: MediaTek Helio G90T', 27439, 'Lenovo Tab Yoga.jpg', '2023-05-20'),
(10010, 'Tablet', '  SAMSUNG Galaxy Tab S7', '  6 GB RAM | 128 GB ROM | Expandable Upto 1 TB', ' 31.5 cm (12.4 inch) Quad HD Display\r\n13 MP Primary Camera | 8 MP Front\r\nAndroid 10 | Battery: 10090 mAh\r\nProcessor: Qualcomm Snapdragon 865 Plus', 49999, 'SAMSUNG Galaxy Tab S7.jpg', '2023-05-20'),
(10011, 'Tablet', '  APPLE iPad (10th Gen)', '  256 GB ROM', ' 27.69 cm (10.9 inch) Full HD Display\r\n12 MP Primary Camera | 12 MP Front\r\niPadOS 16 | Battery: Lithium Polymer\r\nProcessor: A14 Bionic Chip (64-bit Architecture) with Neural Engine\r\n', 74900, 'APPLE iPad (10th Gen).jpg', '2023-05-20'),
(10012, 'Accessories', '  Boult Audio Z40 with Zen ENC Mic', '  Bluetooth version: 5.1 Wireless range: 10 m', ' Battery life: 60 hrs\r\nZen Tech ENC mic |Low Latency Gaming | 60Hrs Battery Life\r\nLightning Boult Type-C Fastest Charging ', 1299, 'Boult Audio Z40 with Zen ENC Mic.jpg', '2023-05-20'),
(10013, 'Accessories', '  OnePlus Bullets Wireless Z2 ', '  With Mic: Yes Bluetooth version: 5', ' Battery life: 20 Hrs | Charging time: 10 Mins\r\nBattery life: 20 Hrs\r\nCharging time: 10 mins', 1799, 'OnePlus Bullets Wireless Z2.jpg', '2023-05-20'),
(10014, 'Accessories', '  realme Buds Wireless 2 Neo ', '  With Mic: Yes 11.2mm Bass Boost Driver', ' 17hrs Total Playback\r\nEnvironmental Noise Cancellation | IPX4 Water Resistant\r\nMulti Device Switch | 88ms Low Latency\r\nQuick Charge (120mins playback in 10min charge)\r\nMagnetic Tips With Instant Connection', 1299, 'realme Buds Wireless 2 Neo.jpg', '2023-05-20'),
(10015, 'Accessories', '  Blaupunkt BTW08 ANC Moksha 30db', '  With Mic:Yes Active Noise Cancellation : Upto -30dB Bluetooth version: 5.2', ' CRISPR ENC TECH With Quad MIC\r\n40 Hours* Playtime (15 min = 4Hrs Playtime)\r\nGameOn Advance Player mode with 80 ms Low Latency\r\nTurvoVolt Charging I 10mm Dynamic Driver I ', 2799, 'Blaupunkt BTW08 ANC Moksha 30db.jpg', '2023-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phn` varchar(20) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_phn`, `user_password`) VALUES
(14, 'RAbi ', 'abc@gmail.com', '7003895502', '6cd0af214855a6d1da026e2f5cbda096'),
(10, 'PARNA SAHA ', 'sahaparna0410@gmail.com', '8017385449', 'f4cd057b5bb6fbfac3c4c535647819f1'),
(11, 'Shreya Saha ', 'shreyas80@gmail.com', '8240521768', 'e4391e45c497b1ab041b5d0b5f2f9630');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `product_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `user_email`, `product_id`) VALUES
(1, 'sahaparna0410@gmail.com', 10001),
(2, 'shreyas80@gmail.com', 10000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`orderdetails_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_email`),
  ADD UNIQUE KEY `UNIQUE` (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `orderdetails_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10016;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
