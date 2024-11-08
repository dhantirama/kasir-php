-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 09:21 AM
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
-- Database: `angkatan3_kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `id_kategori` int(9) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `qty` int(10) NOT NULL,
  `harga` int(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_kategori`, `nama_barang`, `satuan`, `qty`, `harga`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mie Rebus', 'kantong', 6, 3000, '2024-11-06 03:51:50', '2024-11-08 07:50:57'),
(2, 2, 'Jus Alpukat', 'ml', 11, 12000, '2024-11-06 03:51:50', '2024-11-08 07:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(9) DEFAULT NULL,
  `id_barang` int(9) DEFAULT NULL,
  `jumlah` int(9) DEFAULT NULL,
  `harga` double(10,2) DEFAULT NULL,
  `total_harga` double(10,2) DEFAULT NULL,
  `sub_total` double(10,2) DEFAULT NULL,
  `nominal_bayar` double(10,2) DEFAULT NULL,
  `kembalian` double(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id`, `id_penjualan`, `id_barang`, `jumlah`, `harga`, `total_harga`, `sub_total`, `nominal_bayar`, `kembalian`, `created_at`, `updated_at`) VALUES
(19, 15, 1, 1, 3000.00, 1.00, 3000.00, 20000.00, 5000.00, '2024-11-08 07:44:48', '2024-11-08 07:44:48'),
(20, 15, 2, 1, 12000.00, 5.00, 12000.00, 20000.00, 5000.00, '2024-11-08 07:44:48', '2024-11-08 07:44:48'),
(21, 16, 1, 2, 3000.00, 1.00, 6000.00, 20000.00, 2000.00, '2024-11-08 07:45:13', '2024-11-08 07:45:13'),
(22, 16, 2, 1, 12000.00, 8.00, 12000.00, 20000.00, 2000.00, '2024-11-08 07:45:13', '2024-11-08 07:45:13'),
(23, 17, 1, 2, 3000.00, 30000.00, 6000.00, 50000.00, 20000.00, '2024-11-08 07:50:57', '2024-11-08 07:50:57'),
(24, 17, 2, 2, 12000.00, 30000.00, 24000.00, 50000.00, 20000.00, '2024-11-08 07:50:57', '2024-11-08 07:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(55) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama_kategori`, `created_at`, `updated_at`) VALUES
(1, 'Makanan', '2024-11-06 03:39:21', '2024-11-06 03:39:21'),
(2, 'Minuman', '2024-11-06 03:39:21', '2024-11-06 03:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_transaksi` varchar(50) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_user`, `kode_transaksi`, `tanggal_transaksi`, `created_at`, `updated_at`) VALUES
(5, 4, 'TR-241107150611', '2024-11-07', '2024-11-07 08:06:21', '2024-11-07 08:06:21'),
(6, 4, 'TR-241108084812', '2024-11-08', '2024-11-08 01:48:23', '2024-11-08 01:48:23'),
(7, 4, 'TR-241108084925', '2024-11-08', '2024-11-08 02:57:04', '2024-11-08 02:57:04'),
(8, 4, 'TR-241108135428', '2024-11-08', '2024-11-08 07:00:34', '2024-11-08 07:00:34'),
(9, 4, 'TR-241108140052', '2024-11-08', '2024-11-08 07:01:42', '2024-11-08 07:01:42'),
(10, 4, 'TR-241108140826', '2024-11-08', '2024-11-08 07:08:49', '2024-11-08 07:08:49'),
(11, 4, 'TR-241108141403', '2024-11-08', '2024-11-08 07:16:41', '2024-11-08 07:16:41'),
(12, 4, 'TR-241108143901', '2024-11-08', '2024-11-08 07:43:17', '2024-11-08 07:43:17'),
(13, 4, 'TR-241108143901', '2024-11-08', '2024-11-08 07:44:06', '2024-11-08 07:44:06'),
(14, 4, 'TR-241108144408', '2024-11-08', '2024-11-08 07:44:22', '2024-11-08 07:44:22'),
(15, 4, 'TR-241108144408', '2024-11-08', '2024-11-08 07:44:48', '2024-11-08 07:44:48'),
(16, 4, 'TR-241108144456', '2024-11-08', '2024-11-08 07:45:13', '2024-11-08 07:45:13'),
(17, 4, 'TR-241108145032', '2024-11-08', '2024-11-08 07:50:57', '2024-11-08 07:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_lengkap`, `nama_pengguna`, `deskripsi`, `email`, `password`, `foto`, `cover`, `created_at`, `updated_at`) VALUES
(4, 'dhantirama', 'dhanti', '', 'dhanram@gmail.com', 'dhanram@gmail.com', 'ki.png', 'yay.jpg', '2024-11-05 00:46:59', '2024-11-05 01:03:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kategori_tokategori_id` (`id_kategori`);

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_penjualan_to_penjualan_id` (`id_penjualan`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `id_kategori_tokategori_id` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_barang` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `id_penjualan_to_penjualan_id` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
