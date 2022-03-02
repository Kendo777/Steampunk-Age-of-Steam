-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2022 a las 22:20:24
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `onlineshop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `addressId` int(11) NOT NULL,
  `user` varchar(128) NOT NULL,
  `direction` varchar(128) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `city` varchar(128) NOT NULL,
  `country` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `addresses`
--

INSERT INTO `addresses` (`addressId`, `user`, `direction`, `zipCode`, `city`, `country`) VALUES
(1, 'CrapiKodaa', 'C/AVENIDA CASTEJON DE VALDEJASA, 65', 50830, 'VILLANUEVA DE GALLEGO', 'España'),
(3, 'CrapiKodaa', '0000', 0, '00', '00'),
(4, 'leyo', 'C/AVENIDA CASTEJON DE VALDEJASA, 65', 50830, 'VILLANUEVA DE GALLEGO', 'España'),
(5, 'Bivago', 'Universidad San Jorge', 50830, 'VILLANUEVA DE GALLEGO', 'España');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `attributes`
--

CREATE TABLE `attributes` (
  `attributeId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `attributes`
--

INSERT INTO `attributes` (`attributeId`, `categoryId`, `name`) VALUES
(1, 5, 'ml'),
(3, 3, 'Number of parts'),
(4, 1, 'Material'),
(5, 5, 'Taste'),
(6, 5, 'Color'),
(7, 1, 'Size'),
(8, 6, 'Glass Color'),
(9, 5, 'Container'),
(10, 5, 'Main Ingridient');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`categoryId`, `name`) VALUES
(1, 'Hat'),
(3, 'Gears and Artefacts'),
(5, 'Potion'),
(6, 'Glasses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriesrelation`
--

CREATE TABLE `categoriesrelation` (
  `categoryId` int(11) NOT NULL,
  `subCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `categoriesrelation`
--

INSERT INTO `categoriesrelation` (`categoryId`, `subCategoryId`) VALUES
(3, 5),
(5, 7),
(1, 1),
(1, 2),
(1, 6),
(1, 9),
(1, 3),
(1, 12),
(3, 16),
(3, 17),
(5, 18),
(6, 21),
(6, 22),
(6, 23),
(3, 24),
(3, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `classification`
--

CREATE TABLE `classification` (
  `itemId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `classification`
--

INSERT INTO `classification` (`itemId`, `categoryId`) VALUES
(1, 1),
(2, 5),
(11, 1),
(12, 5),
(9, 3),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 6),
(20, 6),
(21, 6),
(22, 6),
(23, 6),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 6),
(55, 6),
(56, 6),
(57, 6),
(58, 6),
(59, 6),
(60, 6),
(61, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(66, 6),
(67, 6),
(68, 6),
(69, 6),
(70, 6),
(71, 6),
(72, 6),
(73, 6),
(74, 5),
(75, 5),
(76, 5),
(77, 5),
(78, 5),
(79, 5),
(80, 5),
(81, 5),
(82, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(88, 5),
(89, 5),
(90, 5),
(91, 5),
(92, 5),
(93, 5),
(94, 3),
(95, 3),
(96, 3),
(97, 3),
(98, 3),
(99, 3),
(100, 3),
(101, 3),
(102, 3),
(103, 3),
(104, 3),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 3),
(110, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(127, 1),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1),
(134, 6),
(135, 6),
(136, 6),
(137, 6),
(138, 6),
(139, 6),
(140, 6),
(141, 6),
(142, 6),
(143, 6),
(144, 6),
(145, 6),
(146, 6),
(147, 6),
(148, 6),
(149, 6),
(150, 6),
(151, 6),
(152, 6),
(153, 6),
(154, 5),
(155, 5),
(156, 5),
(157, 5),
(158, 5),
(159, 5),
(160, 5),
(161, 5),
(162, 5),
(163, 5),
(164, 5),
(165, 5),
(166, 5),
(167, 5),
(168, 5),
(169, 5),
(170, 5),
(171, 5),
(172, 5),
(173, 5),
(174, 3),
(175, 3),
(176, 3),
(177, 3),
(178, 3),
(179, 3),
(180, 3),
(181, 3),
(182, 3),
(183, 3),
(184, 3),
(185, 3),
(186, 3),
(187, 3),
(188, 3),
(189, 3),
(190, 3),
(191, 3),
(192, 3),
(193, 3),
(115, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditcard`
--

CREATE TABLE `creditcard` (
  `creditCardId` int(11) NOT NULL,
  `user` varchar(128) NOT NULL,
  `number` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `date` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `creditcard`
--

INSERT INTO `creditcard` (`creditCardId`, `user`, `number`, `name`, `date`) VALUES
(1, 'CrapiKodaa', 123456789, 'Marc Lozano', '2020-12'),
(3, 'leyo', 2147483647, 'dsfisdfjksn', '2020-02'),
(4, 'Bivago', 2147483647, 'Bivago', '2021-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itemattribute`
--

CREATE TABLE `itemattribute` (
  `itemId` int(11) NOT NULL,
  `attributeId` int(11) NOT NULL,
  `value` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `itemattribute`
--

INSERT INTO `itemattribute` (`itemId`, `attributeId`, `value`) VALUES
(2, 1, '1.5'),
(12, 1, '0.5'),
(1, 4, 'Furr'),
(12, 5, 'Fresa'),
(12, 6, 'Pink'),
(14, 4, 'Velvet'),
(14, 7, 'S'),
(15, 4, 'Leather'),
(15, 7, 'XL'),
(16, 4, 'Felt'),
(16, 7, 'M'),
(17, 4, 'Furr'),
(17, 7, 'XM'),
(18, 4, 'Furr'),
(18, 7, 'XL'),
(19, 8, 'Dark Blue'),
(20, 8, 'Red'),
(21, 8, 'Black'),
(22, 8, 'Dark Blue'),
(23, 8, 'Dark Blue'),
(24, 1, '120'),
(24, 5, 'Lime'),
(24, 6, 'Red'),
(24, 9, 'Bottle'),
(24, 10, 'Toad\'s breath'),
(25, 1, '60'),
(25, 5, 'Lemon'),
(25, 6, 'Red'),
(25, 9, 'Bottle'),
(25, 10, 'Spider legs'),
(26, 1, '60'),
(26, 5, 'Lime'),
(26, 6, 'Yellow'),
(26, 9, 'Bottle'),
(26, 10, 'Toad\'s breath'),
(27, 1, '100'),
(27, 5, 'Strawberry'),
(27, 6, 'Black'),
(27, 9, 'Pyramidal'),
(27, 10, 'BAT wings'),
(28, 1, '60'),
(28, 5, 'Sweet'),
(28, 6, 'Red'),
(28, 9, 'Spherical'),
(28, 10, 'Spider legs'),
(29, 3, '17'),
(30, 3, '2'),
(31, 3, '11'),
(32, 3, '13'),
(33, 3, '16'),
(34, 4, 'Leather'),
(34, 7, 'XL'),
(35, 4, 'Leather'),
(35, 7, 'XL'),
(36, 4, 'Felt'),
(36, 7, 'S'),
(37, 4, 'Furr'),
(37, 7, 'XS'),
(38, 4, 'Leather'),
(38, 7, 'M'),
(39, 4, 'Furr'),
(39, 7, 'S'),
(40, 4, 'Furr'),
(40, 7, 'XL'),
(41, 4, 'Felt'),
(41, 7, 'XL'),
(42, 4, 'Felt'),
(42, 7, 'XS'),
(43, 4, 'Velvet'),
(43, 7, 'M'),
(44, 4, 'Felt'),
(44, 7, 'L'),
(45, 4, 'Leather'),
(45, 7, 'S'),
(46, 4, 'Leather'),
(46, 7, 'S'),
(47, 4, 'Furr'),
(47, 7, 'XS'),
(48, 4, 'Felt'),
(48, 7, 'L'),
(49, 4, 'Furr'),
(49, 7, 'XL'),
(50, 4, 'Felt'),
(50, 7, 'XM'),
(51, 4, 'Furr'),
(51, 7, 'S'),
(52, 4, 'Velvet'),
(52, 7, 'S'),
(53, 4, 'Felt'),
(53, 7, 'XM'),
(54, 8, 'Green'),
(55, 8, 'Dark Blue'),
(56, 8, 'Green'),
(57, 8, 'Red'),
(58, 8, 'Black'),
(59, 8, 'Red'),
(60, 8, 'Green'),
(61, 8, 'Red'),
(62, 8, 'Dark Blue'),
(63, 8, 'Black'),
(64, 8, 'Dark Blue'),
(65, 8, 'Dark Blue'),
(66, 8, 'Red'),
(67, 8, 'Black'),
(68, 8, 'Dark Blue'),
(69, 8, 'Black'),
(70, 8, 'Red'),
(71, 8, 'Dark Blue'),
(72, 8, 'Green'),
(73, 8, 'Dark Blue'),
(74, 1, '60'),
(74, 5, 'Sweet'),
(74, 6, 'Yellow'),
(74, 9, 'Spherical'),
(74, 10, 'BAT wings'),
(75, 1, '20'),
(75, 5, 'Lime'),
(75, 6, 'Yellow'),
(75, 9, 'Spherical'),
(75, 10, 'Spider legs'),
(76, 1, '100'),
(76, 5, 'Strawberry'),
(76, 6, 'Red'),
(76, 9, 'Rectangular'),
(76, 10, 'Spider legs'),
(77, 1, '100'),
(77, 5, 'Strawberry'),
(77, 6, 'Red'),
(77, 9, 'Bottle'),
(77, 10, 'Toad\'s breath'),
(78, 1, '20'),
(78, 5, 'Sweet'),
(78, 6, 'Red'),
(78, 9, 'Rectangular'),
(78, 10, 'Blood'),
(79, 1, '60'),
(79, 5, 'Lemon'),
(79, 6, 'Red'),
(79, 9, 'Pyramidal'),
(79, 10, 'Spider legs'),
(80, 1, '20'),
(80, 5, 'Lime'),
(80, 6, 'Black'),
(80, 9, 'Rectangular'),
(80, 10, 'Blood'),
(81, 1, '100'),
(81, 5, 'Sweet'),
(81, 6, 'Yellow'),
(81, 9, 'Pyramidal'),
(81, 10, 'Blood'),
(82, 1, '100'),
(82, 5, 'Sweet'),
(82, 6, 'Black'),
(82, 9, 'Bottle'),
(82, 10, 'Blood'),
(83, 1, '60'),
(83, 5, 'Lemon'),
(83, 6, 'Yellow'),
(83, 9, 'Bottle'),
(83, 10, 'BAT wings'),
(84, 1, '120'),
(84, 5, 'Sweet'),
(84, 6, 'Red'),
(84, 9, 'Spherical'),
(84, 10, 'Blood'),
(85, 1, '20'),
(85, 5, 'Strawberry'),
(85, 6, 'Yellow'),
(85, 9, 'Spherical'),
(85, 10, 'BAT wings'),
(86, 1, '120'),
(86, 5, 'Sweet'),
(86, 6, 'Black'),
(86, 9, 'Spherical'),
(86, 10, 'Blood'),
(87, 1, '100'),
(87, 5, 'Lime'),
(87, 6, 'Red'),
(87, 9, 'Spherical'),
(87, 10, 'Toad\'s breath'),
(88, 1, '100'),
(88, 5, 'Lemon'),
(88, 6, 'Yellow'),
(88, 9, 'Pyramidal'),
(88, 10, 'Toad\'s breath'),
(89, 1, '60'),
(89, 5, 'Sweet'),
(89, 6, 'Black'),
(89, 9, 'Rectangular'),
(89, 10, 'Spider legs'),
(90, 1, '60'),
(90, 5, 'Lemon'),
(90, 6, 'Black'),
(90, 9, 'Bottle'),
(90, 10, 'BAT wings'),
(91, 1, '60'),
(91, 5, 'Strawberry'),
(91, 6, 'Black'),
(91, 9, 'Rectangular'),
(91, 10, 'Spider legs'),
(92, 1, '120'),
(92, 5, 'Strawberry'),
(92, 6, 'Yellow'),
(92, 9, 'Bottle'),
(92, 10, 'Toad\'s breath'),
(93, 1, '100'),
(93, 5, 'Sweet'),
(93, 6, 'Yellow'),
(93, 9, 'Bottle'),
(93, 10, 'Toad\'s breath'),
(94, 3, '6'),
(95, 3, '4'),
(96, 3, '15'),
(97, 3, '5'),
(98, 3, '19'),
(99, 3, '2'),
(100, 3, '5'),
(101, 3, '9'),
(102, 3, '10'),
(103, 3, '1'),
(104, 3, '3'),
(105, 3, '17'),
(106, 3, '9'),
(107, 3, '19'),
(108, 3, '7'),
(109, 3, '3'),
(110, 3, '15'),
(111, 3, '8'),
(112, 3, '14'),
(113, 3, '8'),
(114, 4, 'Furr'),
(114, 7, 'S'),
(115, 4, 'Leather'),
(115, 7, 'L'),
(116, 4, 'Leather'),
(116, 7, 'L'),
(117, 4, 'Leather'),
(117, 7, 'XM'),
(118, 4, 'Leather'),
(118, 7, 'XM'),
(119, 4, 'Velvet'),
(119, 7, 'L'),
(120, 4, 'Furr'),
(120, 7, 'L'),
(121, 4, 'Furr'),
(121, 7, 'M'),
(122, 4, 'Furr'),
(122, 7, 'XM'),
(123, 4, 'Velvet'),
(123, 7, 'XL'),
(124, 4, 'Furr'),
(124, 7, 'XL'),
(125, 4, 'Leather'),
(125, 7, 'M'),
(126, 4, 'Leather'),
(126, 7, 'XM'),
(127, 4, 'Velvet'),
(127, 7, 'XM'),
(128, 4, 'Furr'),
(128, 7, 'S'),
(129, 4, 'Velvet'),
(129, 7, 'L'),
(130, 4, 'Velvet'),
(130, 7, 'M'),
(131, 4, 'Leather'),
(131, 7, 'XS'),
(132, 4, 'Felt'),
(132, 7, 'XS'),
(133, 4, 'Leather'),
(133, 7, 'S'),
(134, 8, 'Red'),
(135, 8, 'Dark Blue'),
(136, 8, 'Green'),
(137, 8, 'Dark Blue'),
(138, 8, 'Black'),
(139, 8, 'Green'),
(140, 8, 'Red'),
(141, 8, 'Dark Blue'),
(142, 8, 'Dark Blue'),
(143, 8, 'Green'),
(144, 8, 'Black'),
(145, 8, 'Black'),
(146, 8, 'Red'),
(147, 8, 'Red'),
(148, 8, 'Green'),
(149, 8, 'Black'),
(150, 8, 'Dark Blue'),
(151, 8, 'Dark Blue'),
(152, 8, 'Dark Blue'),
(153, 8, 'Dark Blue'),
(154, 1, '20'),
(154, 5, 'Strawberry'),
(154, 6, 'Red'),
(154, 9, 'Spherical'),
(154, 10, 'Blood'),
(155, 1, '60'),
(155, 5, 'Lemon'),
(155, 6, 'White'),
(155, 9, 'Bottle'),
(155, 10, 'Spider legs'),
(156, 1, '120'),
(156, 5, 'Lime'),
(156, 6, 'Yellow'),
(156, 9, 'Spherical'),
(156, 10, 'Toad\'s breath'),
(157, 1, '60'),
(157, 5, 'Sweet'),
(157, 6, 'Black'),
(157, 9, 'Rectangular'),
(157, 10, 'Spider legs'),
(158, 1, '120'),
(158, 5, 'Lime'),
(158, 6, 'Black'),
(158, 9, 'Spherical'),
(158, 10, 'Spider legs'),
(159, 1, '100'),
(159, 5, 'Lemon'),
(159, 6, 'Red'),
(159, 9, 'Rectangular'),
(159, 10, 'Spider legs'),
(160, 1, '20'),
(160, 5, 'Lemon'),
(160, 6, 'Black'),
(160, 9, 'Bottle'),
(160, 10, 'BAT wings'),
(161, 1, '120'),
(161, 5, 'Strawberry'),
(161, 6, 'Red'),
(161, 9, 'Bottle'),
(161, 10, 'Toad\'s breath'),
(162, 1, '60'),
(162, 5, 'Sweet'),
(162, 6, 'Black'),
(162, 9, 'Spherical'),
(162, 10, 'Toad\'s breath'),
(163, 1, '20'),
(163, 5, 'Lemon'),
(163, 6, 'Yellow'),
(163, 9, 'Spherical'),
(163, 10, 'Toad\'s breath'),
(164, 1, '20'),
(164, 5, 'Lemon'),
(164, 6, 'White'),
(164, 9, 'Bottle'),
(164, 10, 'Spider legs'),
(165, 1, '60'),
(165, 5, 'Lemon'),
(165, 6, 'Yellow'),
(165, 9, 'Pyramidal'),
(165, 10, 'Toad\'s breath'),
(166, 1, '120'),
(166, 5, 'Lime'),
(166, 6, 'Black'),
(166, 9, 'Rectangular'),
(166, 10, 'Spider legs'),
(167, 1, '60'),
(167, 5, 'Strawberry'),
(167, 6, 'Red'),
(167, 9, 'Rectangular'),
(167, 10, 'BAT wings'),
(168, 1, '120'),
(168, 5, 'Strawberry'),
(168, 6, 'White'),
(168, 9, 'Spherical'),
(168, 10, 'Spider legs'),
(169, 1, '100'),
(169, 5, 'Lime'),
(169, 6, 'Red'),
(169, 9, 'Pyramidal'),
(169, 10, 'Spider legs'),
(170, 1, '20'),
(170, 5, 'Lime'),
(170, 6, 'Black'),
(170, 9, 'Bottle'),
(170, 10, 'Blood'),
(171, 1, '100'),
(171, 5, 'Lime'),
(171, 6, 'Black'),
(171, 9, 'Bottle'),
(171, 10, 'Blood'),
(172, 1, '60'),
(172, 5, 'Sweet'),
(172, 6, 'Red'),
(172, 9, 'Spherical'),
(172, 10, 'Blood'),
(173, 1, '60'),
(173, 5, 'Lemon'),
(173, 6, 'White'),
(173, 9, 'Rectangular'),
(173, 10, 'Blood'),
(174, 3, '18'),
(175, 3, '7'),
(176, 3, '20'),
(177, 3, '13'),
(178, 3, '6'),
(179, 3, '14'),
(180, 3, '12'),
(181, 3, '7'),
(182, 3, '15'),
(183, 3, '3'),
(184, 3, '14'),
(185, 3, '1'),
(186, 3, '10'),
(187, 3, '13'),
(188, 3, '11'),
(189, 3, '16'),
(190, 3, '9'),
(191, 3, '5'),
(192, 3, '14'),
(193, 3, '18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `items`
--

CREATE TABLE `items` (
  `itemId` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `prize` double NOT NULL,
  `description` varchar(300) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `extra` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `items`
--

INSERT INTO `items` (`itemId`, `itemName`, `prize`, `description`, `stock`, `extra`) VALUES
(1, 'Gorro de pluma', 25, 'si', 1, 1.5),
(2, 'Pocion de crecimiento', 5, 'porque yolo', 0, 0),
(9, 'CP-2091', 1, 'si', 375, 1),
(11, 'Sombrero Alicia', 30, 'Alicia en el pais de las maravillas', 0, 0),
(12, 'Pocion de amor', 20, 'Pos eso', 0, 0),
(13, 'Sombrero Alicia 2', 30, 'dsfishf', 0, 0),
(14, 'Gorro con Orejas Gotico', 112.62, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 8.87),
(15, 'Sombrero con Orejas Noble', 36.78, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 8.43),
(16, 'Sombrero con Engranajes Resulton', 324.05, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 2, 4.32),
(17, 'Sombrero de Fiesta Alto', 466.64, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 1.54),
(18, 'Bombin de Tecnico Negro', 368.77, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 24, 5.79),
(19, 'Lentes con Tornillos Sin goma', 28.4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 26.33),
(20, 'Oculos de Espejo Cristal Verde', 42.1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 26.56),
(21, 'Lentes con Pinchos Plateadas', 34.46, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 35.39),
(22, 'Lentes de Cobre Cristal Verde', 94.54, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 19.19),
(23, 'Oculos de Vision Nocturna Plateadas', 90.41, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 20.38),
(24, 'Mejunje de Memoria', 38.58, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 4.9),
(25, 'Farmaco  Crece-Pelo', 9.78, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 3.77),
(26, 'Pocion de Olvido', 64.49, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 3.8),
(27, 'Pocima de Engrasado', 59.72, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 21, 0),
(28, 'Filtro  Doxycida', 10.48, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 2.01),
(29, 'Gun ZZ-2308', 717.58, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 8.49),
(30, 'Owl XZ.0971', 519.25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 2.73),
(31, 'Cane QP-907', 651.24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 0.89),
(32, 'Root GA-77', 132.81, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 0),
(33, 'Pet CQ.1', 154.71, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 7.8),
(34, 'Bombin con Manchas Sobresaliente', 191.42, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 6.7),
(35, 'Gorro con Linterna Nuevo', 79.28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 2, 1.45),
(36, 'Gorro de Copa Alto', 62.71, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 4.92),
(37, 'Bombin con Hebillas Resulton', 329.01, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 1.99),
(38, 'Gorro de Mecanico Nuevo', 394.45, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 0.88),
(39, 'Gorro de Bronce Verde', 120.34, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 10),
(40, 'Bombin con Reloj Plebe', 190.11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 10, 6.26),
(41, 'Sombrero con Velo Rojo', 108.43, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 4.41),
(42, 'Gorro de Ala ancha Gris', 457.94, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 9, 1.52),
(43, 'Bombin de Tecnico Sobresaliente', 27.85, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 8.8),
(44, 'Bombin de Terciopelo Verde', 73.37, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 2.13),
(45, 'Gorro de Bronce Bajo', 482.02, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 6.1),
(46, 'Bombin con Costuras Pobre', 423.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 15, 1.16),
(47, 'Gorro con Velo Grande', 27.85, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 8.05),
(48, 'Bombin con Pociones Verde', 491.36, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 15, 3),
(49, 'Sombrero de Tecnico Negro', 320.54, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 6.89),
(50, 'Gorro de Cuerda Grande', 425.6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 0.77),
(51, 'Sombrero de Costurero Noble', 260.93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 8.03),
(52, 'Sombrero de Vapor Alto', 271.4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 21, 0.96),
(53, 'Bombin de Tecnico Nuevo', 390, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 2.36),
(54, 'Lentes de Soldador Cristal Verde', 30.05, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 3.32),
(55, 'Lentes de Espejo Cristal Negro', 93.04, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 13, 34.33),
(56, 'Oculos de Vidrio Cristal Arcoiris', 36.35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 15.37),
(57, 'Oculos de Vision Pequeñas', 87.64, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 45.12),
(58, 'Oculos de Pasta Pequeñas', 79.21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 10, 49.58),
(59, 'Lentes con Goma elastica Cobre', 72.97, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 10.93),
(60, 'Gafas de Pasta Mate', 45.7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 18.31),
(61, 'Gafas de Cobre Cristal Azul', 44.7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 26.54),
(62, 'Oculos con Lupa Doradas', 86.31, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 8, 13.88),
(63, 'Gafas de Vision Grandes', 85.4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 34.34),
(64, 'Lentes con Engranajes Todo en uno', 20.6, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 14.81),
(65, 'Gafas de Soldador Cristal Arcoiris', 98.8, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 4.51),
(66, 'Oculos con Cinta de cuero Todo en uno', 61.84, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 24, 8.27),
(67, 'Oculos de Vision Nocturna Mate', 19.11, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 24.87),
(68, 'Oculos con Proteccion Cristal Rojo', 95.67, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 6.27),
(69, 'Oculos de Metal Plateadas', 41.67, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 18, 0),
(70, 'Lentes de Vision Nocturna Ajustadas', 30.17, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 21.56),
(71, 'Lentes con Proteccion Cuadradas', 16.87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 49.36),
(72, 'Lentes de Aviador Todo en uno', 98.09, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 18, 48.88),
(73, 'Oculos de Vidrio Cristal Arcoiris', 67.76, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 19.94),
(74, 'Elixir  Amortentia', 62.55, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 1.77),
(75, 'Filtro de Reliquia', 26.96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 2.4),
(76, 'Elixir  para Encoger', 55.24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 1.03),
(77, 'Remedio de Amarre', 61.18, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 4.03),
(78, 'Tonico  Mopsus', 16.21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 4.66),
(79, 'Filtro  Envejecedora', 49.08, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 0),
(80, 'Pocima  Explosivo', 64.96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 2.4),
(81, 'Infusion  Crece-Huesos', 26.68, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 9, 3.08),
(82, 'Remedio  para Encoger', 68.77, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 2.07),
(83, 'Filtro  Amortentia', 34.35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 3.05),
(84, 'Pocima  Pimentónica', 61.05, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 2.48),
(85, 'Pocion  Chispeante', 31.08, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 4.99),
(86, 'Jarabe de Reliquia', 38.38, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 2, 1.59),
(87, 'Pocima de Wiggenweld', 47.82, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 10, 4.05),
(88, 'Balsamo de Envalsamar', 18.7, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 4.74),
(89, 'Filtro de Envalsamar', 5.87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 9, 0),
(90, 'Pocima  Mopsus', 37.96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 1.67),
(91, 'Farmaco  para Arpías', 65.07, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 2.31),
(92, 'Remedio  Explosivo', 27.92, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 0),
(93, 'Farmaco  Pimentónica', 29.69, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 27, 0),
(94, 'GE-8', 549.24, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 1, 11.75),
(95, 'Pet HN-82', 54.46, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 16.47),
(96, 'Encrypt UD-10', 167.41, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 11, 15.36),
(97, 'Revolver WO.5', 603.74, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 2.82),
(98, 'Encrypt HI-8615', 343.46, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 9, 10.81),
(99, 'Pet FE.98', 181.12, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 6.98),
(100, 'Rifle QG.065', 171.29, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 2, 8.06),
(101, 'IY-9262', 327.55, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 16.46),
(102, 'Gear TY.6', 599.22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 7.89),
(103, 'Mechanic Protesis CH-313', 444.05, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 3.06),
(104, 'Encrypt EM-4', 643.81, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 16.12),
(105, 'IA.213', 113.52, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 15.88),
(106, 'Cane OH.74', 109.09, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 15.08),
(107, 'Pet QX-37', 377.77, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 8.39),
(108, 'Cane MV.6', 466.07, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 1.49),
(109, 'Cane JX.3707', 474.26, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 19.22),
(110, 'Cane HS.8795', 764.21, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 17.31),
(111, 'Cane JN-285', 796.55, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 21, 6.42),
(112, 'Owl NG.73', 251.89, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 7.14),
(113, 'Gun OY-949', 773.03, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 5.95),
(114, 'Bombin de Mujer Azul', 93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 2.19),
(115, 'Bombin con Cadenas Viejo', 157.34, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 5.39),
(116, 'Bombin con Pinchos Negro', 438.4, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 5.94),
(117, 'Gorro de Tren Gris', 334.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 8.51),
(118, 'Bombin de Mujer Negro', 225.01, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 3, 2.8),
(119, 'Gorro de Te Alto', 396.81, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 8.23),
(120, 'Sombrero con Orejas Nuevo', 121.25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 0),
(121, 'Bombin con Reloj Marron', 126.74, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 1, 1.89),
(122, 'Bombin con Manchas Marron', 492.77, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 3.64),
(123, 'Bombin con Velo Nuevo', 269.61, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 8.72),
(124, 'Bombin de Alicia Alto', 42.34, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 13, 0.84),
(125, 'Gorro con Costuras Gris', 138.41, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 15, 7.71),
(126, 'Sombrero de Mecanico ', 163.99, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 3.99),
(127, 'Bombin con Plumas Bajo', 160.78, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 2.78),
(128, 'Sombrero de Mecanico ', 176.62, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 9.31),
(129, 'Bombin de Mujer ', 25.87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 23, 5.75),
(130, 'Gorro de Cuero Bajo', 16.93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 6.67),
(131, 'Gorro de Vapor Azul', 72, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 8.24),
(132, 'Gorro con Gafas Marron', 351.96, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 7.74),
(133, 'Gorro con Reloj Grande', 324.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 7.97),
(134, 'Lentes con Tornillos Cuadradas', 51.93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 14.54),
(135, 'Lentes con Lupas Cristal Rojo', 29.65, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 8.51),
(136, 'Lentes con Aumentos Cristal Verde', 54.52, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 11.61),
(137, 'Gafas de Metal Cristal Negro', 73.03, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 7, 43.91),
(138, 'Lentes de Pasta Mate', 65.79, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 10, 48.6),
(139, 'Lentes con Engranajes Pequeñas', 50.44, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 1.65),
(140, 'Gafas de Espejo Cristal Arcoiris', 41.47, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 10, 22.8),
(141, 'Oculos de Metal Cuadradas', 51.91, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 21, 13.54),
(142, 'Oculos de Vision Cobre', 35.75, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 1, 5.01),
(143, 'Oculos con Lupas Cristal Rojo', 77.28, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 9.32),
(144, 'Gafas de Sol ', 35.54, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 23.72),
(145, 'Lentes con Lupas Cuadradas', 90.84, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 6, 11.54),
(146, 'Oculos con Tornillos Redondas', 98.56, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 47.46),
(147, 'Gafas con Lupas Ajustadas', 12.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 35.16),
(148, 'Oculos con Tornillos Todo en uno', 60.35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 28.61),
(149, 'Oculos de Aviador Mate', 55.39, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 30.56),
(150, 'Gafas con Lupa Cuadradas', 55.48, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 13, 49.18),
(151, 'Lentes de Metal Pequeñas', 99.35, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 3.85),
(152, 'Gafas de Vidrio Mate', 15.82, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 43.52),
(153, 'Oculos con Pinchos Pequeñas', 86.88, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 25, 40.03),
(154, 'Elixir  Alisadora', 58.3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 0.98);
INSERT INTO `items` (`itemId`, `itemName`, `prize`, `description`, `stock`, `extra`) VALUES
(155, 'Infusion  para Arpías', 65.22, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 13, 2.23),
(156, 'Tonico  Explosivo', 29.37, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 3.27),
(157, 'Remedio  para Encoger', 31.29, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 2.2),
(158, 'Elixir  Amortentia', 22.78, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 3.35),
(159, 'Pocion  para Arpías', 68.46, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 2.81),
(160, 'Infusion de Amor', 47, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 27, 4.22),
(161, 'Pocima de Rue', 35.18, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 2.35),
(162, 'Remedio de Envalsamar', 67.37, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 0.78),
(163, 'Pocima de Amor', 39.44, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 1.12),
(164, 'Pocion de Engrasado', 53.73, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 28, 1.61),
(165, 'Pocima  Crece-Huesos', 51.47, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 4.86),
(166, 'Fluido  Matalobos', 68.64, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 27, 1.45),
(167, 'Elixir  Agudizadora de Ingenio', 64.69, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 2.69),
(168, 'Remedio  Paz', 52.13, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 11, 3.79),
(169, 'Balsamo de Reliquia', 26.67, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 18, 4.02),
(170, 'Elixir  Explosivo', 65.87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 17, 4.06),
(171, 'Infusion de Memoria', 26.1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 1, 1.06),
(172, 'Elixir  Paz', 8.48, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 3.7),
(173, 'Infusion de Rue', 43.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 8, 1.22),
(174, 'KQ.0718', 147.31, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 10.94),
(175, 'Gear UV-40', 776.5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 5.77),
(176, 'PP-82', 778.89, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 13.8),
(177, 'Gear WP.4639', 436.65, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 20, 11.45),
(178, 'QF.03', 242.87, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 30, 8.01),
(179, 'Encrypt RC-058', 614.93, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 2, 4.34),
(180, 'Encrypt GB-4', 611.41, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 17, 9.12),
(181, 'NB-1238', 264.9, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 16.28),
(182, 'Tesla ZF-308', 93.41, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 12, 4.48),
(183, 'Cane JN.2', 105.43, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 29, 5.53),
(184, 'Mechanic Protesis OE-1519', 194.81, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 5, 10.2),
(185, 'Gun OS-549', 188.14, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 22, 0.62),
(186, 'Pet EH.22', 796.92, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 2.28),
(187, 'Mechanism AF-9', 692.3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 26, 0),
(188, 'Pet QG.250', 144.32, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 16, 3.23),
(189, 'Mechanic Protesis IL.3', 333.45, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 11, 8.53),
(190, 'Mechanic Protesis NL.73', 44.06, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 19, 17.3),
(191, 'Root US-86', 585.44, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 14, 18.91),
(192, 'DZ-8', 265.25, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 4, 7.01),
(193, 'Gun VL-5', 157.48, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the ', 9, 10.5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `creditCardId` int(11) DEFAULT NULL,
  `user` varchar(128) NOT NULL,
  `addressId` int(11) DEFAULT NULL,
  `cuantity` int(11) NOT NULL,
  `totalPrize` double NOT NULL,
  `date` datetime NOT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `send` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`orderId`, `itemId`, `creditCardId`, `user`, `addressId`, `cuantity`, `totalPrize`, `date`, `paid`, `send`) VALUES
(27, 13, 1, 'CrapiKodaa', 1, 1, 30, '2020-12-23 21:21:54', 1, 1),
(28, 1, 1, 'CrapiKodaa', 1, 2, 51.5, '2020-12-24 00:08:31', 1, 0),
(39, 41, 3, 'leyo', 4, 1, 112.84, '2020-12-28 17:20:25', 1, 0),
(44, 2, 4, 'Bivago', 5, 1, 5, '2021-01-29 00:46:15', 1, 0),
(45, 89, 4, 'Bivago', 5, 3, 17.61, '2021-01-29 01:15:06', 1, 0),
(46, 25, 4, 'Bivago', 5, 1, 13.549999999999999, '2021-01-29 01:21:21', 1, 0),
(47, 89, 4, 'Bivago', 5, 1, 5.87, '2021-01-29 01:21:21', 1, 0),
(48, 172, 4, 'Bivago', 5, 1, 12.18, '2021-01-29 14:05:24', 1, 0),
(49, 29, 4, 'Bivago', 5, 1, 726.07, '2021-01-29 17:13:07', 1, 0),
(50, 29, 4, 'Bivago', 5, 1, 726.07, '2021-01-29 17:20:02', 1, 0),
(51, 9, 4, 'Bivago', 5, 25, 26, '2021-01-29 18:39:09', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategories`
--

CREATE TABLE `subcategories` (
  `subCategoryId` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `subcategories`
--

INSERT INTO `subcategories` (`subCategoryId`, `name`) VALUES
(1, 'Feather'),
(2, 'Glasses'),
(3, 'Gears'),
(5, 'Cobalt'),
(6, 'Orejas'),
(7, 'Transparent'),
(9, 'Cards'),
(12, 'Top'),
(16, 'Spring'),
(17, 'Sprocket'),
(18, 'Bright'),
(19, 'Cold'),
(20, 'Hot'),
(21, 'Spikes'),
(22, 'Magnifying glass'),
(23, 'Adhesive'),
(24, 'Steam'),
(25, 'Electricity');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subclasification`
--

CREATE TABLE `subclasification` (
  `itemId` int(11) NOT NULL,
  `subCategoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `subclasification`
--

INSERT INTO `subclasification` (`itemId`, `subCategoryId`) VALUES
(1, 1),
(11, 9),
(11, 6),
(1, 9),
(14, 9),
(14, 12),
(14, 6),
(15, 3),
(16, 9),
(17, 3),
(17, 2),
(18, 12),
(18, 3),
(18, 6),
(19, 22),
(20, 22),
(21, 22),
(22, 21),
(22, 22),
(23, 21),
(23, 22),
(23, 23),
(24, 7),
(25, 7),
(28, 7),
(28, 18),
(29, 25),
(29, 17),
(30, 5),
(30, 16),
(30, 25),
(31, 25),
(31, 24),
(34, 6),
(34, 2),
(34, 12),
(34, 3),
(36, 9),
(36, 3),
(36, 2),
(36, 12),
(36, 6),
(37, 1),
(37, 12),
(37, 3),
(37, 6),
(37, 2),
(38, 9),
(38, 2),
(38, 3),
(38, 6),
(38, 1),
(39, 3),
(39, 1),
(39, 6),
(39, 2),
(39, 9),
(39, 12),
(40, 9),
(40, 3),
(40, 12),
(41, 12),
(41, 3),
(41, 6),
(41, 1),
(43, 6),
(44, 1),
(44, 3),
(44, 12),
(44, 2),
(44, 9),
(45, 1),
(45, 3),
(45, 9),
(46, 1),
(47, 12),
(47, 6),
(47, 2),
(48, 6),
(48, 2),
(48, 1),
(48, 3),
(49, 3),
(49, 9),
(49, 12),
(50, 1),
(50, 9),
(50, 3),
(50, 2),
(51, 2),
(51, 6),
(52, 3),
(52, 1),
(53, 1),
(56, 23),
(56, 22),
(56, 21),
(58, 23),
(58, 22),
(59, 23),
(59, 21),
(59, 22),
(60, 22),
(61, 23),
(61, 22),
(62, 23),
(62, 21),
(62, 22),
(63, 22),
(64, 21),
(65, 23),
(65, 22),
(65, 21),
(67, 23),
(67, 22),
(67, 21),
(68, 22),
(68, 23),
(68, 21),
(69, 21),
(69, 22),
(70, 23),
(73, 23),
(74, 18),
(75, 7),
(75, 18),
(76, 18),
(81, 18),
(82, 18),
(85, 18),
(88, 7),
(89, 18),
(89, 7),
(90, 18),
(90, 7),
(91, 18),
(91, 7),
(92, 7),
(92, 18),
(93, 18),
(93, 7),
(95, 25),
(95, 17),
(96, 25),
(96, 16),
(96, 17),
(96, 24),
(96, 5),
(97, 17),
(98, 24),
(98, 5),
(98, 16),
(98, 25),
(98, 17),
(99, 5),
(99, 16),
(104, 17),
(104, 5),
(104, 25),
(104, 24),
(104, 16),
(105, 24),
(105, 17),
(105, 5),
(105, 16),
(105, 25),
(106, 16),
(106, 24),
(106, 17),
(106, 5),
(107, 17),
(107, 24),
(107, 25),
(107, 5),
(107, 16),
(108, 24),
(108, 25),
(108, 5),
(109, 16),
(110, 24),
(110, 5),
(110, 17),
(110, 16),
(111, 16),
(111, 17),
(112, 5),
(112, 16),
(112, 17),
(114, 6),
(114, 12),
(114, 2),
(114, 9),
(114, 3),
(115, 6),
(115, 1),
(115, 3),
(117, 3),
(117, 2),
(117, 6),
(119, 2),
(119, 6),
(119, 1),
(119, 12),
(119, 3),
(120, 2),
(120, 3),
(120, 1),
(120, 6),
(120, 9),
(121, 9),
(121, 2),
(121, 6),
(124, 2),
(124, 3),
(124, 12),
(124, 6),
(124, 1),
(124, 9),
(125, 12),
(125, 3),
(125, 2),
(125, 1),
(125, 6),
(126, 6),
(126, 2),
(126, 1),
(126, 3),
(126, 9),
(126, 12),
(127, 3),
(127, 2),
(128, 2),
(128, 12),
(128, 9),
(128, 6),
(129, 3),
(129, 1),
(129, 6),
(129, 12),
(129, 9),
(129, 2),
(130, 3),
(130, 6),
(130, 2),
(132, 2),
(132, 9),
(133, 12),
(133, 6),
(133, 1),
(133, 2),
(133, 3),
(134, 23),
(134, 22),
(136, 22),
(136, 23),
(136, 21),
(137, 22),
(138, 23),
(138, 21),
(139, 21),
(140, 21),
(141, 21),
(141, 22),
(141, 23),
(142, 21),
(144, 21),
(144, 23),
(145, 21),
(145, 23),
(145, 22),
(146, 21),
(146, 22),
(148, 22),
(149, 23),
(150, 23),
(150, 21),
(151, 21),
(151, 23),
(152, 23),
(152, 22),
(154, 7),
(154, 18),
(155, 18),
(155, 7),
(157, 7),
(158, 7),
(160, 7),
(160, 18),
(161, 7),
(161, 18),
(162, 18),
(162, 7),
(163, 7),
(163, 18),
(166, 18),
(166, 7),
(168, 18),
(169, 7),
(169, 18),
(170, 18),
(171, 7),
(174, 16),
(174, 24),
(174, 17),
(174, 5),
(176, 5),
(176, 17),
(176, 24),
(177, 17),
(177, 5),
(178, 25),
(179, 16),
(180, 25),
(180, 5),
(181, 5),
(181, 17),
(181, 16),
(183, 16),
(183, 24),
(184, 24),
(184, 17),
(184, 25),
(184, 5),
(184, 16),
(185, 5),
(185, 17),
(185, 25),
(185, 24),
(186, 24),
(188, 17),
(188, 16),
(188, 24),
(188, 5),
(189, 5),
(189, 16),
(189, 17),
(189, 24),
(190, 17),
(191, 5),
(191, 16),
(191, 24),
(191, 25),
(192, 16),
(192, 5),
(192, 24),
(192, 17),
(193, 17),
(193, 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `userName` varchar(128) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `valid` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user`, `email`, `password`, `userName`, `phone`, `valid`) VALUES
('Bivago', 'Bivago@bivago.com', '$2y$10$t22FiQ7SsQDoMG9q2OczweMFxwpPT/qZRJRbRr0LhWwlYcnX.h4c6', 'Bivago', '987654321', 0),
('CrapiKodaa', 'mmartinez@edu.lapinamk.fi', '$2y$10$q4Xh3GfgORUMDrc8OCdhve74J1.K.ZgLfbgIEL0.aildVt4YQZoKy', 'Marc Lozano Martinez', '123456789', 0),
('leyo', 'leyo@gmail.com', '$2y$10$AoBqOCRyUUfAoV60QVRCrOohS7SyjNbIblLgs25uWEa94R.dKXvdu', 'YO', '987654321', 0),
('marclozano1', 'mmartinez@edu.lapinamk.f', '$2y$10$iiyxDusS3X8ZqufUVR5elOWHIFtnPLLAk6wQwY6wP1vTya.gfkdCm', 'Marc Lozano Martinez', '98456', 0),
('SteampunkAgeOfSteam', 'steampunkshoopofsteam@gmail.com', '$2y$10$F6nvp8eGAQI7VPvAlwqHDu4VuiInj0Rytv6SvXY8GLRwwgaCzJ6U2', 'Admin', '123456789', 1446);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usersdirections`
--

CREATE TABLE `usersdirections` (
  `user` varchar(128) NOT NULL,
  `addressId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`addressId`),
  ADD KEY `fk_addresses_user` (`user`);

--
-- Indices de la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`attributeId`),
  ADD KEY `fk_attributes_category_id` (`categoryId`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indices de la tabla `categoriesrelation`
--
ALTER TABLE `categoriesrelation`
  ADD KEY `fk_categoriesrelation_category_id` (`categoryId`) USING BTREE,
  ADD KEY `fk_categoriesrelation_subcategory_id` (`subCategoryId`) USING BTREE;

--
-- Indices de la tabla `classification`
--
ALTER TABLE `classification`
  ADD KEY `fk_classification_category_id` (`categoryId`),
  ADD KEY `fk_classification_item_id` (`itemId`);

--
-- Indices de la tabla `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`creditCardId`),
  ADD KEY `fk_creditcard_user` (`user`);

--
-- Indices de la tabla `itemattribute`
--
ALTER TABLE `itemattribute`
  ADD KEY `fk_itemattributes_item_id` (`itemId`),
  ADD KEY `fk_itemattributes_attribute_id` (`attributeId`);

--
-- Indices de la tabla `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemId`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `fk_ordera_address_id` (`addressId`),
  ADD KEY `fk_ordera_item_id` (`itemId`),
  ADD KEY `fk_ordera_creditCard_id` (`creditCardId`),
  ADD KEY `fk_ordera_user` (`user`);

--
-- Indices de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`subCategoryId`);

--
-- Indices de la tabla `subclasification`
--
ALTER TABLE `subclasification`
  ADD KEY `fk_subclasification_item_id` (`itemId`),
  ADD KEY `fk_subclasification_sub_id` (`subCategoryId`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `attributes`
--
ALTER TABLE `attributes`
  MODIFY `attributeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `creditcard`
--
ALTER TABLE `creditcard`
  MODIFY `creditCardId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `items`
--
ALTER TABLE `items`
  MODIFY `itemId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `subCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `fk_addresses_user` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `fk_attributes_category_id` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `categoriesrelation`
--
ALTER TABLE `categoriesrelation`
  ADD CONSTRAINT `fk_categories_category_id` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subcategories_subcategory_id` FOREIGN KEY (`subCategoryId`) REFERENCES `subcategories` (`subCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `classification`
--
ALTER TABLE `classification`
  ADD CONSTRAINT `fk_classification_category_id` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_classification_item_id` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `fk_creditcard_user` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `itemattribute`
--
ALTER TABLE `itemattribute`
  ADD CONSTRAINT `fk_itemattributes_attribute_id` FOREIGN KEY (`attributeId`) REFERENCES `attributes` (`attributeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_itemattributes_item_id` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_ordera_address_id` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`addressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordera_creditCard_id` FOREIGN KEY (`creditCardId`) REFERENCES `creditcard` (`creditCardId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordera_item_id` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordera_user` FOREIGN KEY (`user`) REFERENCES `users` (`user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `subclasification`
--
ALTER TABLE `subclasification`
  ADD CONSTRAINT `fk_subclasification_item_id` FOREIGN KEY (`itemId`) REFERENCES `items` (`itemId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_subclasification_sub_id` FOREIGN KEY (`subCategoryId`) REFERENCES `subcategories` (`subCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
