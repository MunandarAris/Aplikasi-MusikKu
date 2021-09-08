-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2021 at 04:57 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_music`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_artis`
--

CREATE TABLE `tb_artis` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `start_career` date NOT NULL,
  `photo` varchar(255) NOT NULL,
  `about` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_artis`
--

INSERT INTO `tb_artis` (`id`, `name`, `start_career`, `photo`, `about`, `created_at`, `update_at`) VALUES
(36, 'Charly VH', '2004-01-07', '1631022105733charly.jpg', 'Charly Van Houten merupakan seorang vokalis Setia Band dan komposer berkebangsaan Indonesia yang juga merupakan mantan vokalis dari grup musik ST 12. Pada tahun 2004, bersama Pepep, Pepeng, dan Iman ia ikut mendirikan grup musik yang bernama ST 12.', '2021-09-07 13:41:45', '2021-09-07 13:41:45'),
(37, 'Judika', '2013-01-07', '1631022155081judika.jpg', 'Judika Nalon Abadi Sihotang adalah aktor, penyanyi dan model berkebangsaan Indonesia. Ia meraih runner-up Indonesian Idol Musim Kedua. Ia merupakan anak ke-6 dari 7 bersaudara', '2021-09-07 13:42:35', '2021-09-07 13:42:35'),
(38, 'Ariel Noah', '2000-09-01', '1631022204877noah.jpeg', 'Noah adalah sebuah grup musik rock alternatif dari Indonesia. Grup musik ini dibentuk dengan nama Peterpan oleh Ariel, Andika, Indra, Lukman, Reza dan Uki pada tanggal 1 September 2000. Lebih dari sembilan juta album telah terjual di Indonesia, yang menja', '2021-09-07 13:43:24', '2021-09-07 13:43:24');

-- --------------------------------------------------------

--
-- Table structure for table `tb_genre`
--

CREATE TABLE `tb_genre` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_genre`
--

INSERT INTO `tb_genre` (`id`, `name`, `created_at`, `update_at`) VALUES
(8, 'Dangdut', '2021-09-04 08:25:42', '2021-09-04 08:25:42'),
(9, 'Pop', '2021-09-05 03:54:25', '2021-09-05 03:54:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_music`
--

CREATE TABLE `tb_music` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `music` varchar(255) NOT NULL,
  `cover_music` varchar(255) NOT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `artis_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_music`
--

INSERT INTO `tb_music` (`id`, `title`, `music`, `cover_music`, `genre_id`, `artis_id`, `created_at`, `update_at`) VALUES
(16, 'Putus Atau Terus', '1631026355955Judika-PutusatauTerus(OfficialMusicVideo).mp3', '1631026355955cover_putus_atau_tetus.jpg', 9, 37, '2021-09-07 14:52:35', '2021-09-07 14:52:35'),
(17, 'Saat Terakhir', '1631026385235ST12-SaatTerakhirVCTrinity.mp3', '1631026385234cover_saat_terakhir.jpg', 9, 36, '2021-09-07 14:53:05', '2021-09-07 14:53:05'),
(18, 'Separuh Aku', '1631026409135Noah-SeparuhAku-MusicEverywhere.mp3', '1631026409134cover_separuh_aku.png', 9, 38, '2021-09-07 14:53:29', '2021-09-07 14:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_playlist`
--

CREATE TABLE `tb_playlist` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `music_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT curtime(),
  `update_at` timestamp NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `email`, `password`, `status`, `created_at`, `update_at`) VALUES
(1, 'admin@gmail.com', 'admin', 1, '2021-08-11 03:50:44', '2021-08-02 03:50:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_artis`
--
ALTER TABLE `tb_artis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_genre`
--
ALTER TABLE `tb_genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_music`
--
ALTER TABLE `tb_music`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genre_id` (`genre_id`),
  ADD KEY `artis_id` (`artis_id`);

--
-- Indexes for table `tb_playlist`
--
ALTER TABLE `tb_playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_id` (`music_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_artis`
--
ALTER TABLE `tb_artis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `tb_genre`
--
ALTER TABLE `tb_genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_music`
--
ALTER TABLE `tb_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tb_playlist`
--
ALTER TABLE `tb_playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_music`
--
ALTER TABLE `tb_music`
  ADD CONSTRAINT `tb_music_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `tb_genre` (`id`),
  ADD CONSTRAINT `tb_music_ibfk_2` FOREIGN KEY (`artis_id`) REFERENCES `tb_artis` (`id`);

--
-- Constraints for table `tb_playlist`
--
ALTER TABLE `tb_playlist`
  ADD CONSTRAINT `tb_playlist_ibfk_1` FOREIGN KEY (`music_id`) REFERENCES `tb_music` (`id`),
  ADD CONSTRAINT `tb_playlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
