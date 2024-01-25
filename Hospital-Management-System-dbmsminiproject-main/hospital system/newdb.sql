-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2023 at 08:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(12, 'kartikmbbs@gmail.com', 'Kartik Gautam', 'Cardiology'),
(13, 'sandeepsharmambbs@gmail.com', 'Sandeep Sharma', 'ENT'),
(14, 'gurpreetmbbs@gmail.com', 'Gurpreet Kaur', 'Neurology'),
(15, 'snehagupta@gmail.com', 'Sneha Gupta', 'Orthology'),
(16, 'manpreetsinghmbbs@gmail.com', 'Manpreet Singh', 'Gastrology'),
(17, 'arjunmbbs@gmail.com', 'Arjun Nagarjuna', 'Gynaecology'),
(18, 'kananmbbs@gmail.com', 'Kanan Thakur', 'Radiology'),
(19, 'gouravmbbs@gmail.com', 'Gourav Mishra', 'Urology'),
(20, 'gunjanmbbs@gmail.com', 'Gunjan Ahluwalia', 'Dermatology'),
(21, 'bhupendermbbs@gmail.com', 'Bhupender Jogi', 'Pediatrics');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(24, 'rohitsharma45@gmail.com', 'Rohit Sharma', 'Male', 'morning', 'Diarrhea', '10:00:00', '1987-04-30', 'Gastrology', '7009823456'),
(25, 'sachintendulkar10@gmail.comj', 'Sachin Tendulkar', 'Male', 'evening', 'Skin allergy', '16:00:00', '1973-04-24', 'Dermatology', '9877338855'),
(26, 'kaifkatrina@gmail.com', 'Katrina Kaif', 'Female', 'morning', 'Throat infection', '11:00:00', '1983-07-16', 'ENT', '8002300001'),
(27, 'singhaniagautam@gmail.com', 'Gautam Singhania', 'Male', 'night', 'Urine infection', '20:00:00', '1960-11-25', 'Urology', '9972000010'),
(28, 'gautamgambhir97@gmail.com', 'Gautam Gambhir', 'Male', 'evening', 'Hypertension', '18:00:00', '1981-10-14', 'Cardiology', '9786542345'),
(29, 'sunilchhetri11@gmail.com', 'Sunil Chhetri', 'Male', 'morning', 'Patella Fracture', '10:30:00', '1984-08-03', 'Orthology', '6245678930'),
(30, 'ratantata@gmail.com', 'Ratan Tata', 'Male', 'evening', 'Alzheimer\'s disease', '17:00:00', '1937-12-28', 'Neurology', '8897796543'),
(31, 'reemadiwan@gmail.com', 'Reema diwan', 'Female', 'morning', 'Cervical cancer', '11:30:00', '1971-05-10', 'Gynaecology', '7689038888'),
(32, 'nehwalsaina@gmail.com', 'Saina Nehwal', 'Female', 'morning', 'Ear infection', '09:30:00', '1990-03-17', 'ENT', '7009200020'),
(33, 'karan37evil@gmail.com', 'karan', 'Male', 'evening', ' Highcholestrol', '18:30:00', '2012-12-12', 'Cardiology', '1234567890');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(1, 'arin', 'arin@GMAIL.COM'),
(2, 'test', 'test@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(43, 24, 'rohitsharma45@gmail.com', 'Rohit Sharma', 'PATIENT UPDATED', '2023-11-23 16:05:58'),
(44, 25, 'sachintendulkar10@gmail.comj', 'Sachin Tendulkar', 'PATIENT INSERTED', '2023-11-23 16:09:01'),
(45, 26, 'kaifkatrina@gmail.com', 'Katrina Kaif', 'PATIENT INSERTED', '2023-11-23 16:12:21'),
(46, 27, 'singhaniagautam@gmail.com', 'Gautam Singhania', 'PATIENT INSERTED', '2023-11-23 16:14:48'),
(47, 28, 'gautamgambhir97@gmail.com', 'Gautam Gambhir', 'PATIENT INSERTED', '2023-11-23 16:17:47'),
(48, 29, 'sunilchhetri11@gmail.com', 'Sunil Chhetri', 'PATIENT INSERTED', '2023-11-23 16:22:17'),
(49, 30, 'ratantata@gmail.com', 'Ratan Tata', 'PATIENT INSERTED', '2023-11-23 16:25:13'),
(50, 31, 'reemadiwan@gmail.com', 'Reema diwan', 'PATIENT INSERTED', '2023-11-23 16:29:01'),
(51, 32, 'nehwalsaina@gmail.com', 'Saina Nehwal', 'PATIENT INSERTED', '2023-11-23 16:37:48'),
(52, 33, 'karan37evil@gmail.com', 'karan', 'PATIENT INSERTED', '2023-12-02 21:27:38');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `usertype`, `email`, `password`) VALUES
(1, 'Kartik Gautam', 'Doctor', 'kartikmbbs@gmail.com', 'scrypt:32768:8:1$AxC0zlJBb78iVYLy$8e5ece8640286a8bdf00e08f4a922903344570d1a23d750e5963abc5b2051432195a6a8bec37b1b0aab90082e59e939aedcbd2b1d2f0a6655a1ff4266b588e5e'),
(23, 'Sandeep Sharma', 'Doctor', 'sandeepsharmambbs@gmail.com', 'scrypt:32768:8:1$tDwiQsfk4HUO5Z2Z$42c23b6a01d2481d07ce2a362cd6c2d6d0e17d583756dda064284efbecaafdaaa1167433bbd033cd9d7c088783eb74cc4de027fc99412add0a547442eea59a87'),
(24, 'Gurpreet Kaur', 'Doctor', 'gurpreetmbbs@gmail.com', 'scrypt:32768:8:1$Ua2QHZNi1pxdP7rR$a5f2bac5b41c72538f792ab4c049e390529ee6b6006e0bfd0cd7ba1e72310657a9403aacb9a63fdc30cc0d604ab6fa8562f85db42ba2a6bada8ef2929a28e31e'),
(25, 'Sneha Gupta', 'Doctor', 'snehagupta@gmail.com', 'scrypt:32768:8:1$V2nVoAAdo8l32oyc$280f1e21abd221e8f5533526ae8e9ffef9146b3bdd56c04cbeee02552c78fc2b793a6ebf9a1ee78d556e6982cad086c5fc83ccab4c688bbfd2d854b09dff6dbb'),
(26, 'Manpreet Singh', 'Doctor', 'manpreetsinghmbbs@gmail.com', 'scrypt:32768:8:1$hWvlP8alp4yxlosM$5eb60dd4cfaa13392387b036e95c605f166a75af5b59ac795d79f371111faad3cb401d29f53450c892ca37319d7e5aa98b7275df756a08cc30ecfe6c4b986bb1'),
(27, 'Arjun Nagarjuna', 'Doctor', 'arjunmbbs@gmail.com', 'scrypt:32768:8:1$hmAtNWB7som3zsFI$99edbe5456cfd04b0e6dfef280349d6efae0201a283a172c00f1304e2e480fa978623a385f908b597975ec90b77e9d9cfc2e95b15cb343ef1ba51e2a0362d582'),
(28, 'Kanan Thakur', 'Doctor', 'kananmbbs@gmail.com', 'scrypt:32768:8:1$yTFnHfgL1nvuOxWh$017f90603fc75ca0c54822cba88862f952caf807be5879b8fe075bc67b7a469530c9152b526806459ff47ca3533bc943c224898af020bfa0c8947d399d554b73'),
(29, 'Gourav Mishra', 'Doctor', 'gouravmbbs@gmail.com', 'scrypt:32768:8:1$bULhjx2H2FKwuRN6$475503347ca31d60cb822cef028065097ae24d970acb6666625e89794e9509eb58719b9df361a7dff92b6dc4c9f7e6a02bcb8f519894eedd7d1f8429bb9daabf'),
(30, 'Gunjan Ahluwalia', 'Doctor', 'gunjanmbbs@gmail.com', 'scrypt:32768:8:1$ItRgdkIu0tDcNQdw$762bea9025a5f56524a7b12ddf95ba019e4e8dd51e62da4589f404992dc1c243af619d78571f72095122e702bb1eed6204bfcc497aeacd8ae7b018fa004dab09'),
(31, 'Bhupender Jogi', 'Doctor', 'bhupendermbbs@gmail.com', 'scrypt:32768:8:1$bmkKJ6BaFjx8eXml$7daf0dcdee5ec5dd0a1a0f2b6d912707d332064caee99035a9a96b23e373f5d5315534e47ff3c1aa4e5ce0aff19f2e60671acae5cba3770964bda5f1c1774059'),
(32, 'Rohit Sharma', 'Patient', 'rohitsharma45@gmail.com', 'scrypt:32768:8:1$lDpyf7iJUZnAWNV1$7a45fba539c210f423ccf8c43fad0cc7247304dd74f11c328b4db19c3665d24fb1f9206fb826bd80b16fdf7307d7634f4306916a94c9c66221d7fbf4ff670030'),
(33, 'Sachin Tendulkar', 'Patient', 'sachintendulkar10@gmail.comj', 'scrypt:32768:8:1$keDgRi1MsLC5dq0P$34eb1a4f400de56386a46f9ba68845b2ab25ef6acf2de08152673cc35207c1f8649a92ed2f325ce42392129d5371a9d11bf6d4a3ef80137c65d7329751dc5a05'),
(34, 'Katrina Kaif', 'Patient', 'kaifkatrina@gmail.com', 'scrypt:32768:8:1$TRYJs8K9ElwHdCGO$a7d831123f75ca7d29a4810a7c8b59ca7c53646aa3b6d6a665f3850c71b65d7d01eb035407f47570e06ec969fbe40ef549c82cf648deca2f69b4c27e175454b3'),
(35, 'Gautam Singhania', 'Patient', 'singhaniagautam@gmail.com', 'scrypt:32768:8:1$7vIjqedmqvbYi7sP$97f102e1b7d6161633cebe6e1ed52a860b38dc45e7f304971309ef2c240899ca7d0c7ba0dc62978c2da353c599f8cb1838444465c7993de07cc74a29904b7d3a'),
(36, 'Gautam Gambhir', 'Patient', 'gautamgambhir97@gmail.com', 'scrypt:32768:8:1$jfGdMVGChDIeQJYE$489431d7c57aad930fcf42836434bfa301566d53bab15f29109fa2c9fbc8618f4baab4a9f4c7223733616c66480c4b0c0b505bcf11da79fbf114177eba466cc1'),
(37, 'Sunil Chhetri', 'Patient', 'sunilchhetri11@gmail.com', 'scrypt:32768:8:1$3YTM5Py667gmykXr$63b7f4f8de4bb92e6e267715bb90b7e808ba0afa34dae1de9d465ef037f0d0262f356eefa6ae42021d1a0d0a3871ed512e2c25acc8aafe33d796afe4f77aee62'),
(38, 'Ratan Tata', 'Patient', 'ratantata@gmail.com', 'scrypt:32768:8:1$xRj2m9P2SbdGPO58$1f00b65214b8e07abe0bc05680a4cfd45a4dca7e3317055649f61fda1138dba086ce8162f5a0ba0f890fb73920012e5a051e8b22b9368abc81477d9b7184c41a'),
(39, 'Reema Diwan', 'Patient', 'reemadiwan@gmail.com', 'scrypt:32768:8:1$CFR4UHpgY0etETa8$27617ab118295eafe69c70db6fb315bc5c75623f74cd3ba6415c3a954f67afe72775584a41a16e303a25516e860f81b22cc0ece8adab8c3006fb1037593b9f17'),
(40, 'Saina Nehwal', 'Patient', 'nehwalsaina@gmail.com', 'scrypt:32768:8:1$fX6VJxRyB1zmxX89$b30b86b22fdda09d7cb707200588a7474524553cc6426b9f00406a274d00994b99db72281b383f0d4386cd52a8b00b410741ef61ba73ecc44efaa59d81475f57'),
(41, 'karan', 'Patient', 'karan37evil@gmail.com', 'scrypt:32768:8:1$AHVQmcOjFentC0nt$728e8f66712538268298340f9ef4a224722380c246f1c1e0ea3f94993cbdd7fac28651921c6bfc17f9714f5172f8971a1a7beb91aaee5d5f0af1bbc10d9f9cb3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
