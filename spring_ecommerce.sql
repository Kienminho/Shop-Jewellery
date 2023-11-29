-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2023 at 06:29 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spring_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `total_items` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_order` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`total_items`, `total_price`, `cart_id`, `customer_id`, `user_id`, `is_order`) VALUES
(2, 588000, 2, NULL, 6, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `order_item_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`quantity`, `total_price`, `cart_id`, `order_item_id`, `product_id`, `price`) VALUES
(2, 588000, 2, 9, 138, 294500);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `is_activated` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`is_activated`, `is_deleted`, `category_id`, `name`) VALUES
(b'1', b'0', 1, 'Dây chuyền'),
(b'1', b'0', 2, 'Vòng tay'),
(b'1', b'0', 3, 'Combo quà tặng');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` bigint(20) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers_roles`
--

CREATE TABLE `customers_roles` (
  `customer_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_date_time` datetime(6) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `request_note` varchar(255) DEFAULT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `address`, `email`, `name`, `order_date_time`, `phone_number`, `city`, `request_note`, `total_price`) VALUES
(1, 'Hồ Chí Minh', 'n@gmail.com', 'E bé Ngân', '2023-11-29 12:48:59.000000', '074233546', 'Hồ Chí Minh', NULL, 1779000),
(2, 'Hồ Chí Minh', 'n@gmail.com', 'E bé Ngân', '2023-11-29 14:11:15.000000', '067343453', 'Hồ Chí Minh', NULL, 1158000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `current_quantity` int(11) NOT NULL,
  `is_activated` bit(1) NOT NULL,
  `is_deleted` bit(1) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`current_quantity`, `is_activated`, `is_deleted`, `sale_price`, `category_id`, `product_id`, `description`, `image_url`, `name`) VALUES
(0, b'1', b'0', 285000, 1, 136, 'Cam kết chính hãng 100%', 'images/fa4ca1b7-091a-4b67-948c-aa7bdf228395.jpg', 'DC Blue Sea Circle V1'),
(0, b'1', b'0', 304000, 1, 137, 'Cam kết chính hãng 100%', 'images/4f1a0e6f-b622-49b8-b9c7-7baeefab9ce6.jpg', 'DC Blue Glitter Moon'),
(0, b'1', b'0', 294500, 1, 138, 'Cam kết chính hãng 100%', 'images/a9914074-7138-42bc-8707-6d0f068e9d96.jpg', 'DC Gumiho VN'),
(0, b'1', b'0', 270000, 1, 139, 'Cam kết chính hãng 100%', 'images/d6c3700a-916e-45fb-93cc-cc6f66909c4f.jpg', 'DC Flower VN V2'),
(0, b'1', b'0', 310000, 1, 140, 'Cam kết chính hãng 100%', 'images/0b323e90-0456-4b6b-863b-d299d51454b7.jpg', 'DC Milky Way VN V6'),
(0, b'1', b'0', 310000, 1, 141, 'Cam kết chính hãng 100%', 'images/13f33788-caba-4055-b1cb-2a663063044f.jpg', 'DC Sun In Moon - CZ'),
(0, b'1', b'0', 320000, 1, 142, 'Cam kết chính hãng 100%', 'images/a48eef42-08b4-4e29-bcb3-84f402dbc48e.jpg', 'DC Hoa Tim Đá Moon'),
(0, b'1', b'0', 330000, 1, 143, 'Cam kết chính hãng 100%', 'images/142e0d5c-c5cf-4cff-a94e-0813233d9b98.jpg', 'DC Milky Way VN V7'),
(0, b'1', b'0', 340000, 1, 144, 'Cam kết chính hãng 100%', 'images/556604d6-80b4-412e-9fd2-ff2e0110aaaf.jpg', 'DC Hoa Đá Tim Móc VN'),
(0, b'1', b'0', 310000, 1, 145, 'Cam kết chính hãng 100%', 'images/70656a91-6294-42a6-9431-f6a9ea3211f8.jpg', 'DC Vòng Lá - Moonstone'),
(0, b'1', b'0', 330000, 1, 146, 'Cam kết chính hãng 100%', 'images/34e38780-d0e4-4e8b-9a7e-9c06bb7e7a4b.jpg', 'DC Tim Chéo Đá VN V4'),
(0, b'1', b'0', 280000, 1, 147, 'Cam kết chính hãng 100%', 'images/7afe24a5-66ff-4896-b85b-c03e6cc2cd5b.jpg', 'DC Diamond in Circle'),
(0, b'1', b'0', 280000, 1, 148, 'Cam kết chính hãng 100%', 'images/d7e9b6df-8dc5-48e1-8311-8d15ed9d6c3e.jpg', 'DC Hoa 6 Cánh Đá VN'),
(0, b'1', b'0', 330000, 1, 149, 'Cam kết chính hãng 100%', 'images/2e74f468-e0d0-4300-9b7e-2f622d7133e1.jpg', 'DC Cỏ 4 Lá VN V2'),
(0, b'1', b'0', 310000, 1, 150, 'Cam kết chính hãng 100%', 'images/7d30f456-f7c0-46e0-8705-6f3392976281.jpg', 'DC The Sun VN V2'),
(0, b'1', b'0', 310000, 1, 151, 'Cam kết chính hãng 100%', 'images/4d7ee2ec-d47d-463f-ae6c-5c9a1a47e4a0.jpg', 'DC Cỏ 4 Lá V2'),
(0, b'1', b'0', 300000, 1, 152, 'Cam kết chính hãng 100%', 'images/6ca91366-2461-4bf9-aa4f-e93a6f6c7891.jpg', 'DC Tim Đá V2'),
(0, b'1', b'0', 310000, 1, 153, 'Cam kết chính hãng 100%', 'images/30448ee1-17e4-4dc5-804f-75312cbd9bd2.jpg', 'DC Tim Chéo Đá VN V3'),
(0, b'1', b'0', 290000, 1, 154, 'Cam kết chính hãng 100%', 'images/c8a20128-5a51-46ed-ba1f-cd60aca05f55.jpg', 'DC Hành Tinh VN V2'),
(0, b'1', b'0', 370000, 1, 158, 'Cam kết chính hãng 100%', 'images/3f4edc2e-0c54-46f0-8e14-0e7da76f831f.jpg', 'DC Milky Way VN Violet'),
(0, b'1', b'0', 300000, 1, 159, 'Cam kết chính hãng 100%', 'images/5a142949-c53d-45d1-93c9-5a647ba04df0.jpg', 'DC Trăng Đá Treo'),
(0, b'1', b'0', 310000, 1, 160, 'Cam kết chính hãng 100%', 'images/c551adc8-3b94-41ac-8e45-c6b57f14485c.jpg', 'DC Gumiho V3'),
(0, b'1', b'0', 290000, 1, 161, 'Cam kết chính hãng 100%', 'images/5e51e1e4-cfbe-49b4-8bdb-9e0b5284dd38.jpg', 'DC Moon Stone V1'),
(0, b'1', b'0', 310000, 1, 162, 'Cam kết chính hãng 100%', 'images/ea013f6a-31f3-4a1a-89f4-c63680193264.jpg', 'DC Milky Way V4'),
(0, b'1', b'0', 350000, 1, 163, 'Cam kết chính hãng 100%', 'images/f7dedf82-836c-4e5a-99d3-d421758b8145.jpg', 'DC Hoa 4 Cánh Chấm Đá'),
(0, b'1', b'0', 330000, 1, 164, 'Cam kết chính hãng 100%', 'images/64d4c4bf-34a0-4052-97cf-5a550f1e5106.jpg', 'DC Blue Sea Circle V2'),
(0, b'1', b'0', 270000, 1, 165, 'Cam kết chính hãng 100%', 'images/bece20ec-a6d1-42bc-b249-007a7eceebb5.jpg', 'DC Thanh Đá VN'),
(0, b'1', b'0', 330000, 1, 166, 'Cam kết chính hãng 100%', 'images/f7788a68-8a24-4eec-86e9-0eb7bce8c714.jpg', 'DC Blue Sky Stone'),
(0, b'1', b'0', 330000, 1, 167, 'Cam kết chính hãng 100%', 'images/b1502ae8-42fd-474e-9f24-30b841e59e5f.jpg', 'DC Chữ C 2 Thanh Dọc VN'),
(0, b'1', b'0', 300000, 1, 168, 'Cam kết chính hãng 100%', 'images/9a92c2a6-96f8-42a2-a020-2a185b848039.jpg', 'DC Blue Glitter Moon v1'),
(0, b'1', b'0', 330000, 1, 169, 'Cam kết chính hãng 100%', 'images/d4161a5e-8ce8-42b4-87d9-7b29196ea8fc.jpg', 'DC Milky Way VN V3'),
(0, b'1', b'0', 275500, 1, 178, 'Cam kết chính hãng 100%', 'images/4281ce3d-29b3-4563-ac58-0f99c1e4f5fa.jpg', 'DC Glitter Moon VN'),
(0, b'1', b'0', 294500, 1, 182, 'Cam kết chính hãng 100%', 'images/5ba86f98-3852-43c2-ac7a-db094c66727b.jpg', 'DC HT Biển Xanh'),
(0, b'1', b'0', 313500, 1, 183, 'Cam kết chính hãng 100%', 'images/1a1779c6-ea55-4386-aa9e-03fe8a03e1c5.jpg', 'DC Vòng Lá Đá Xanh'),
(0, b'1', b'0', 294500, 1, 184, 'Cam kết chính hãng 100%', 'images/e776b3ac-f8be-471a-a7d5-ceedb76a49d3.jpg', 'DC Cỏ 4 Lá V1'),
(0, b'1', b'0', 313500, 1, 185, 'Cam kết chính hãng 100%', 'images/929c28fc-c225-4f18-9200-53767f35487d.jpg', 'DC Circle Lồng Tim'),
(0, b'1', b'0', 290000, 1, 186, 'Cam kết chính hãng 100%', 'images/da470861-69af-4382-9c71-8800fac338e6.jpg', 'DC Circle Lồng V2 - Size M'),
(0, b'1', b'0', 313500, 1, 187, 'Cam kết chính hãng 100%', 'images/3101370d-0265-4227-a124-1e97ce729066.jpg', 'DC Diamond In Circle V2'),
(0, b'1', b'0', 332500, 1, 188, 'Cam kết chính hãng 100%', 'images/9745887c-30fc-497a-8835-94e67c88f98a.jpg', 'DC Moon Star Diamond'),
(0, b'1', b'0', 275500, 1, 189, 'Cam kết chính hãng 100%', 'images/6531f56b-efd3-4d7b-b8b9-fcc15ba2da55.jpg', 'DC Blue Glitter Moon'),
(0, b'1', b'0', 237500, 1, 190, 'Cam kết chính hãng 100%', 'images/0ce7abf6-10bb-4435-bb89-bb5b69b206f0.jpg', 'DC Sticky'),
(0, b'1', b'0', 294500, 2, 191, 'Cam kết chính hãng 100%', 'images/de43db16-a79b-4745-90b5-47d542316306.jpg', 'LT Glitter Moon VN'),
(0, b'1', b'0', 256500, 2, 192, 'Cam kết chính hãng 100%', 'images/4810cfb9-3042-4d56-aa87-75f48d3b3d75.jpg', 'LT HT Biển Xanh'),
(0, b'1', b'0', 294500, 2, 193, 'Cam kết chính hãng 100%', 'images/d1de2e08-274a-4213-bc03-24a1e2d5da06.jpg', 'LT Open Heart VN'),
(0, b'1', b'0', 304000, 2, 194, 'Cam kết chính hãng 100%', 'images/428b72c4-e90b-4406-8613-4de2a9f5c221.jpg', 'LT Milky Way VN'),
(0, b'1', b'0', 280000, 2, 198, 'Cam kết chính hãng 100%', 'images/275e37cf-5eff-4056-955a-0996a62cd074.jpg', 'LT Star In Moon'),
(0, b'1', b'0', 290000, 2, 199, 'Cam kết chính hãng 100%', 'images/6f54c497-2437-4f22-b0c2-1b7182e4661e.jpg', 'LT Blue Sea Circle V3'),
(0, b'1', b'0', 290000, 2, 200, 'Cam kết chính hãng 100%', 'images/9e529dfc-327e-4564-9099-4dcae81190e7.jpg', 'LT Cỏ 4 Lá VN V2'),
(0, b'1', b'0', 280000, 2, 201, 'Cam kết chính hãng 100%', 'images/24db5007-84fb-44fd-8390-c493005da787.jpg', 'LT Four Leaf V2'),
(0, b'1', b'0', 270000, 2, 202, 'Cam kết chính hãng 100%', 'images/6984ab39-b02c-4b07-b6af-2e13e7d40404.jpg', 'LT Vòng Tròn Thanh Ngang'),
(0, b'1', b'0', 390000, 2, 216, 'Cam kết chính hãng 100%', 'images/89a34952-e948-46d8-9456-e397a6972d26.jpg', 'LT Mặt Đá Tròn Viền Sao '),
(0, b'1', b'0', 350000, 2, 217, 'Cam kết chính hãng 100%', 'images/3e429559-2e02-4851-88cf-d515c223e940.jpg', 'LT Hộp Vuông Đính Đá'),
(0, b'1', b'0', 290000, 2, 218, 'Cam kết chính hãng 100%', 'images/8adb34be-f123-4882-8e96-5b9a12b78ab6.jpg', 'LT Gumiho V4'),
(0, b'1', b'0', 370000, 2, 219, 'Cam kết chính hãng 100%', 'images/bd88d6ee-71fe-4890-a5d1-803707aa192c.jpg', 'LT Milky Way V6 - Violet'),
(0, b'1', b'0', 310000, 2, 220, 'Cam kết chính hãng 100%', 'images/d501dc0d-9797-47e4-8f95-f083e8fcafb0.jpg', 'LT Milky Way V5'),
(0, b'1', b'0', 290000, 2, 221, 'Cam kết chính hãng 100%', 'images/e3ed2326-3c70-4032-96f0-da22b1741d8b.jpg', 'LT Gumiho V3'),
(0, b'1', b'0', 310000, 2, 222, 'Cam kết chính hãng 100%', 'images/df5c70fb-b653-4f80-bfee-7d57d8f6c0d8.jpg', 'LT Diamond 5 Chấu VN'),
(0, b'1', b'0', 290000, 2, 223, 'Cam kết chính hãng 100%', 'images/6a6b0edf-f452-4bb2-9141-6e218e2f1db2.jpg', 'LT Milky Way V3'),
(0, b'1', b'0', 310000, 2, 224, 'Cam kết chính hãng 100%', 'images/b6a79882-04ef-4a7e-9bcf-603f6fe01998.jpg', 'LT Flower VN'),
(0, b'1', b'0', 310000, 2, 225, 'Cam kết chính hãng 100%', 'images/1bcc51dd-d8e6-4f8d-962b-67a7b3967b4a.jpg', 'LT Milky Way V4'),
(0, b'1', b'0', 330000, 2, 226, 'Cam kết chính hãng 100%', 'images/bca45743-61e3-4612-bc2c-0035ffe5ecc5.jpg', 'LT Hoa 4 Cánh Chấm Đá'),
(0, b'1', b'0', 285000, 2, 235, 'Cam kết chính hãng 100%', 'images/bcda3dbb-9ec6-461e-8451-206a0a5771cc.jpg', 'LT Circle Lồng Tim'),
(0, b'1', b'0', 294500, 2, 236, 'Cam kết chính hãng 100%', 'images/009ad211-ed56-406b-b253-5a0545465617.jpg', 'LT Daisy 4 Chấu Đá'),
(0, b'1', b'0', 294500, 2, 237, 'Cam kết chính hãng 100%', 'images/eb4929cc-4b72-4bfc-bd8d-7e64f6c2b696.jpg', 'LT Daisy 4 Chấu Đá VN'),
(0, b'1', b'0', 275500, 2, 238, 'Cam kết chính hãng 100%', 'images/e8788870-b865-4088-8122-8188efd28aa0.jpg', 'LT Circle Lồng VN V2'),
(0, b'1', b'0', 294500, 2, 239, 'Cam kết chính hãng 100%', 'images/22c36b39-588a-418a-91c2-363f0ca1be37.jpg', 'LT Circle Lồng VN - 2 Dây'),
(0, b'1', b'0', 285000, 2, 240, 'Cam kết chính hãng 100%', 'images/7a53506e-af4b-4e68-ab8f-b2e89163c6b6.jpg', 'LT Diamond In Circle VN'),
(0, b'1', b'0', 294500, 2, 241, 'Cam kết chính hãng 100%', 'images/b113b790-ddd9-42ca-8ea7-565ff0fc3091.jpg', 'LT 2 Dây Hoa 5 Cánh'),
(0, b'1', b'0', 332500, 2, 242, 'Cam kết chính hãng 100%', 'images/2ff44849-46b0-4108-b769-e7526b1ba120.jpg', 'LT Star In Moon VN'),
(0, b'1', b'0', 285000, 2, 243, 'Cam kết chính hãng 100%', 'images/2b14712f-9741-4080-9918-97b4d30c3959.jpg', 'LT Blue Sea Circle V1'),
(0, b'1', b'0', 285000, 2, 244, 'Cam kết chính hãng 100%', 'images/f0aa5359-97e7-4deb-8e87-1000f3e94a67.jpg', 'LT Four Leaf VN'),
(0, b'1', b'0', 256500, 2, 245, 'Cam kết chính hãng 100%', 'images/ee66f7d5-17de-4798-842d-f8d909d5c46f.jpg', 'LT Vòng Tròn và Lá'),
(0, b'1', b'0', 256500, 2, 246, 'Cam kết chính hãng 100%', 'images/42e4cdf1-928f-4f28-90c8-b1e2f8252a2e.jpg', 'LT Cỏ 4 Lá Cánh Đá'),
(0, b'1', b'0', 290000, 2, 247, 'Cam kết chính hãng 100%', 'images/10a568ca-261b-4ca2-b943-3d5b25f1dc15.jpg', 'LT Hoa 5 Cánh Đá VN'),
(0, b'1', b'0', 285000, 2, 248, 'Cam kết chính hãng 100%', 'images/fc098e92-a317-459d-8665-abf1018ca690.jpg', 'LT Diamond In Circle V1'),
(0, b'1', b'0', 280000, 2, 249, 'Cam kết chính hãng 100%', 'images/259f040f-621d-4e6e-9c13-5a604968d97a.jpg', 'LT Vô Cực V2'),
(0, b'1', b'0', 275500, 2, 250, 'Cam kết chính hãng 100%', 'images/e53f5708-bddb-41fe-8a0e-6062031b42fc.jpg', 'LT Huyền Thoại Biển Xanh'),
(0, b'1', b'0', 399000, 3, 254, 'Cam kết chính hãng 100%', 'images/fc5b350b-b462-4b18-a799-e8cda8d171a8.jpg', 'Combo My Darling'),
(0, b'1', b'0', 399000, 3, 255, 'Cam kết chính hãng 100%', 'images/ae98692f-f934-4cd3-87cb-25eb572a7b2b.jpg', 'Combo Sweetheart Pink'),
(0, b'1', b'0', 549000, 3, 256, 'Cam kết chính hãng 100%', 'images/5434ba0c-2b64-41a7-9e22-e2cbf365e500.jpg', 'Combo Sweetheart Blue'),
(0, b'1', b'0', 599000, 3, 257, 'Cam kết chính hãng 100%', 'images/b6141c88-34b8-4592-a7cc-55159ce72f97.jpg', 'Combo My STheart Blue'),
(0, b'1', b'0', 599000, 3, 258, 'Cam kết chính hãng 100%', 'images/15ca5266-463f-4d94-b54a-6db5d54c092d.jpg', 'Combo My Sweetheart'),
(0, b'1', b'0', 549000, 3, 259, 'Cam kết chính hãng 100%', 'images/25d23de5-e595-4e3b-b4b8-b531356ef2a3.jpg', 'Combo Dear My Love Red'),
(0, b'1', b'0', 599000, 3, 260, 'Cam kết chính hãng 100%', 'images/d6125b8e-5d41-4ff4-93b5-ecacecf55a91.jpg', 'Combo To My Darling'),
(0, b'1', b'0', 549000, 3, 261, 'Cam kết chính hãng 100%', 'images/4b956fc8-2706-4184-af1c-2d8e585b13ce.jpg', 'Combo Dear My Lover'),
(0, b'1', b'0', 599000, 3, 262, 'Cam kết chính hãng 100%', 'images/3b046e26-b253-4b91-a88f-3c376264a89a.jpg', 'Combo All My Heart'),
(0, b'1', b'0', 599000, 3, 263, 'Cam kết chính hãng 100%', 'images/1d507d65-2b0a-4e58-9cfc-152abea01e58.jpg', 'Combo My Sweetheart'),
(0, b'1', b'0', 200000, 3, 264, 'Cam kết chính hãng 100%', 'images/06107d15-eb68-4a98-a8a6-98315e432434.jpg', 'Hộp Quà Tặng 399k - Xanh'),
(0, b'1', b'0', 200000, 3, 265, 'Cam kết chính hãng 100%', 'images/3582c25b-c638-4b74-bce4-b870bda99655.jpg', 'Hộp Quà Tặng-Xám'),
(0, b'0', b'1', 0, 2, 266, 'efgegegeg', '/images/3100f863-e1c0-498b-8f66-c9146ae50230.jpg', 'awfw'),
(0, b'0', b'1', 0, 1, 267, 'efgegegeg', '/images/eeda186d-6dd8-4989-92b5-24900cb21231.jpg', 'awfwfr'),
(0, b'0', b'1', 0, 1, 268, 'efgegegeg', '/images/41343dd7-dbb0-498d-8938-b3a485e9c81f.jpg', 'awfwfr'),
(0, b'0', b'1', 23533, 1, 269, 'Kien kien kien', '/images/820c9293-2d31-4155-b58a-937bb487e4b5.jpg', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `password`, `username`) VALUES
(1, '$2a$10$Z8ikNDRiaDjyDFfmuE.MYuNIYrtMkYElsIYilp0AtddbE0GMfqHia', 'Kien'),
(2, '$2a$10$3t/hv6/W9rAjkXlDwmIoWOrLoDATJZKyN7GLfZyH65KNujoCwJDby', 'Dev'),
(3, '$2a$10$ymBnFgbmhTurbXHSZ62d.ewAX/VX16Y20IfqNw8g3YkmJQcWCRyBW', 'Test'),
(4, '$2a$10$Yc3TthW6cFLRyiQwSJNSneDdEF1Ci1iohi4Ei6EODssbwQ0MJtafC', 'test'),
(5, '$2a$10$Yc3TthW6cFLRyiQwSJNSneDdEF1Ci1iohi4Ei6EODssbwQ0MJtafC', 'admin'),
(6, '$2a$10$ky8mOcXMMiIedyAXrdBCXOuO.1GN7dzRLyNb52PtrhJWHgZM2UcVS', 'Culi');

-- --------------------------------------------------------

--
-- Table structure for table `users_roles`
--

CREATE TABLE `users_roles` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_roles`
--

INSERT INTO `users_roles` (`role_id`, `user_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(1, 5),
(2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD UNIQUE KEY `UK_88sv4i13lo80s74ox7rsb5a2c` (`customer_id`),
  ADD UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`order_item_id`),
  ADD UNIQUE KEY `UK_r5b99rvdnupujm2h7hh2bh6m7` (`product_id`),
  ADD KEY `FKlqwuo55w1gm4779xcu3t4wnrd` (`cart_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `UKt8o6pivur7nn124jehx7cygw5` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `UKepjdovrdlum64b0w39n6pk6kk` (`username`,`image`,`email`);

--
-- Indexes for table `customers_roles`
--
ALTER TABLE `customers_roles`
  ADD KEY `FKc43ultbfo55uyy6ljpi8x87mf` (`role_id`),
  ADD KEY `FKmn5q3x2wakfnrby09kb5n2bxs` (`customer_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `UKk05fyihlw59bbyi352bte47e` (`name`,`image_url`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  ADD KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FK8ba3sryid5k8a9kidpkvqipyt` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FKlqwuo55w1gm4779xcu3t4wnrd` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`),
  ADD CONSTRAINT `FKqkqmvkmbtiaqn2nfqf25ymfs2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `customers_roles`
--
ALTER TABLE `customers_roles`
  ADD CONSTRAINT `FKc43ultbfo55uyy6ljpi8x87mf` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `FKmn5q3x2wakfnrby09kb5n2bxs` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
