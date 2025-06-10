-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2025 at 07:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `online_sales`
--

CREATE TABLE `online_sales` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `online_sales`
--

INSERT INTO `online_sales` (`order_id`, `order_date`, `amount`, `product_id`) VALUES
(1, '2023-01-15', 120.50, 101),
(2, '2023-01-20', 230.00, 102),
(3, '2023-02-05', 340.75, 103),
(4, '2023-02-10', 180.00, 101),
(5, '2023-03-01', 210.60, 104),
(6, '2023-03-15', 90.40, 102),
(7, '2023-04-10', 300.00, 105),
(8, '2024-01-01', 500.00, 106),
(9, '2024-01-18', 120.00, 106),
(10, '2024-02-14', 420.75, 107);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `online_sales`
--
ALTER TABLE `online_sales`
  ADD PRIMARY KEY (`order_id`);
COMMIT;


SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    year ASC, month ASC;
