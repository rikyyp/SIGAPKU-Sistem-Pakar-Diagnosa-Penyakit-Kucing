-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 07:25 AM
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
-- Database: `sigapku-master`
--

-- --------------------------------------------------------

--
-- Table structure for table `basis_pengetahuan`
--

CREATE TABLE `basis_pengetahuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gejala_id` char(4) NOT NULL,
  `penyakit_id` char(4) NOT NULL,
  `bobot` int(2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basis_pengetahuan`
--

INSERT INTO `basis_pengetahuan` (`id`, `gejala_id`, `penyakit_id`, `bobot`, `created_at`, `updated_at`) VALUES
(1, 'G006', 'P002', 3, '2021-12-22 07:04:29', '2023-05-21 03:06:05'),
(48, 'G009', 'P002', 1, '2023-05-21 03:06:27', '2023-05-21 03:06:27'),
(49, 'G011', 'P002', 2, '2023-05-21 03:06:46', '2023-05-21 03:06:46'),
(51, 'G017', 'P002', 2, '2023-05-21 03:07:22', '2023-05-21 03:07:22'),
(52, 'G022', 'P002', 4, '2023-05-21 03:07:37', '2023-05-21 03:07:37'),
(53, 'G009', 'P001', 2, '2023-05-21 03:07:57', '2023-05-21 03:07:57'),
(54, 'G010', 'P001', 3, '2023-05-21 03:08:19', '2023-05-21 03:08:19'),
(55, 'G016', 'P001', 1, '2023-05-21 03:08:40', '2023-05-21 03:08:40'),
(56, 'G023', 'P001', 4, '2023-05-21 03:08:57', '2023-05-21 03:08:57'),
(57, 'G002', 'P003', 2, '2023-05-21 03:09:22', '2023-05-21 03:09:50'),
(58, 'G003', 'P003', 4, '2023-05-21 03:10:13', '2023-05-21 03:10:13'),
(59, 'G008', 'P003', 1, '2023-05-21 03:10:32', '2023-05-21 03:10:32'),
(60, 'G009', 'P003', 2, '2023-05-21 03:10:45', '2023-05-21 03:10:45'),
(61, 'G010', 'P003', 2, '2023-05-21 03:11:03', '2023-05-21 03:11:03'),
(62, 'G015', 'P003', 2, '2023-05-21 03:11:16', '2023-05-21 03:11:16'),
(63, 'G021', 'P003', 2, '2023-05-21 03:11:36', '2023-05-21 03:11:36'),
(64, 'G023', 'P003', 3, '2023-05-21 03:12:08', '2023-05-21 03:12:30'),
(65, 'G001', 'P004', 2, '2023-05-21 03:13:02', '2023-05-21 03:13:02'),
(66, 'G002', 'P004', 1, '2023-05-21 03:13:03', '2023-05-21 03:13:26'),
(67, 'G008', 'P004', 1, '2023-05-21 03:13:54', '2023-05-21 03:13:54'),
(68, 'G009', 'P004', 4, '2023-05-21 03:14:13', '2023-05-21 03:14:13'),
(69, 'G015', 'P004', 2, '2023-05-21 03:14:33', '2023-05-21 03:14:33'),
(70, 'G023', 'P004', 3, '2023-05-21 03:14:55', '2023-05-21 03:14:55'),
(71, 'G008', 'P005', 3, '2023-05-21 03:15:19', '2023-05-21 03:15:19'),
(72, 'G016', 'P005', 4, '2023-05-21 03:15:40', '2023-05-21 03:15:40'),
(73, 'G002', 'P006', 3, '2023-05-21 03:16:03', '2023-05-21 03:16:03'),
(74, 'G008', 'P006', 2, '2023-05-21 03:16:20', '2023-05-21 03:17:12'),
(75, 'G009', 'P006', 2, '2023-05-21 03:16:44', '2023-05-21 03:16:44'),
(76, 'G010', 'P006', 4, '2023-05-21 03:16:59', '2023-05-21 03:16:59'),
(77, 'G021', 'P006', 3, '2023-05-21 03:17:39', '2023-05-21 03:17:39'),
(78, 'G001', 'P007', 1, '2023-05-21 03:18:01', '2023-05-21 03:18:01'),
(79, 'G002', 'P007', 2, '2023-05-21 03:18:16', '2023-05-21 03:18:16'),
(80, 'G006', 'P007', 3, '2023-05-21 03:18:32', '2023-05-21 03:18:32'),
(81, 'G008', 'P007', 2, '2023-05-21 03:18:50', '2023-05-21 03:18:50'),
(82, 'G009', 'P007', 2, '2023-05-21 03:19:06', '2023-05-21 03:19:06'),
(83, 'G010', 'P007', 2, '2023-05-21 03:19:23', '2023-05-21 03:19:23'),
(84, 'G015', 'P007', 1, '2023-05-21 03:19:40', '2023-05-21 03:19:40'),
(85, 'G016', 'P007', 1, '2023-05-21 03:20:05', '2023-05-21 03:20:05'),
(86, 'G021', 'P007', 4, '2023-05-21 03:20:20', '2023-05-21 03:20:20'),
(87, 'G023', 'P007', 2, '2023-05-21 03:20:48', '2023-05-21 03:20:48'),
(89, 'G024', 'P007', 3, '2023-05-21 03:21:12', '2023-05-21 03:21:12'),
(90, 'G004', 'P008', 4, '2023-05-21 03:21:37', '2023-05-21 03:21:37'),
(91, 'G011', 'P008', 4, '2023-05-21 03:21:55', '2023-05-21 03:21:55'),
(92, 'G029', 'P008', 4, '2023-05-21 03:22:15', '2023-05-21 03:22:15'),
(93, 'G002', 'P009', 2, '2023-05-21 03:22:36', '2023-05-21 03:22:36'),
(94, 'G003', 'P009', 2, '2023-05-21 03:22:52', '2023-05-21 03:22:52'),
(95, 'G008', 'P009', 2, '2023-05-21 03:23:07', '2023-05-21 03:23:07'),
(96, 'G019', 'P009', 4, '2023-05-21 03:23:27', '2023-05-21 03:24:29'),
(97, 'G021', 'P009', 2, '2023-05-21 03:24:09', '2023-05-21 03:24:09'),
(98, 'G023', 'P009', 1, '2023-05-21 03:25:06', '2023-05-21 03:25:06'),
(99, 'G028', 'P009', 4, '2023-05-21 03:25:37', '2023-05-21 03:25:37'),
(100, 'G030', 'P009', 3, '2023-05-21 03:25:51', '2023-05-21 03:25:51'),
(101, 'G001', 'P010', 2, '2023-05-21 03:26:09', '2023-05-21 03:26:09'),
(102, 'G003', 'P010', 3, '2023-05-21 03:26:27', '2023-05-21 03:26:27'),
(103, 'G006', 'P010', 2, '2023-05-21 03:26:52', '2023-05-21 03:27:09'),
(104, 'G008', 'P010', 1, '2023-05-21 03:27:24', '2023-05-21 03:27:24'),
(105, 'G009', 'P010', 2, '2023-05-21 03:27:48', '2023-05-21 03:27:48'),
(106, 'G012', 'P010', 4, '2023-05-21 03:28:27', '2023-05-21 03:28:27'),
(107, 'G015', 'P010', 1, '2023-05-21 03:28:45', '2023-05-21 03:28:45'),
(108, 'G016', 'P010', 1, '2023-05-21 03:29:02', '2023-05-21 03:29:02'),
(109, 'G021', 'P010', 3, '2023-05-21 03:29:22', '2023-05-21 03:29:22'),
(110, 'G027', 'P010', 4, '2023-05-21 03:29:46', '2023-05-21 03:29:46'),
(111, 'G001', 'P001', 2, '2023-05-28 07:08:26', '2023-05-28 07:08:26'),
(112, 'G025', 'P001', 3, '2023-05-28 07:08:41', '2023-05-28 07:08:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `basis_pengetahuan_gejala_id_foreign` (`gejala_id`),
  ADD KEY `basis_pengetahuan_penyakit_id_foreign` (`penyakit_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `basis_pengetahuan`
--
ALTER TABLE `basis_pengetahuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;