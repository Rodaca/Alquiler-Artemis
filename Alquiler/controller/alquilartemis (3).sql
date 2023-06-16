-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 16, 2023 at 09:36 AM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alquilartemis`
--

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `nombre`) VALUES
(1, 'Marvel'),
(2, 'guimera contructor');

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `empleado_id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `empleado`
--

INSERT INTO `empleado` (`empleado_id`, `nombre`, `user`, `password`) VALUES
(1, 'ronald', 'ronald', '123'),
(2, 'juan', 'juan', '123');

-- --------------------------------------------------------

--
-- Table structure for table `entrada`
--

CREATE TABLE `entrada` (
  `entrada_id` int NOT NULL,
  `salida_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha_entrada` int NOT NULL,
  `hora_entrada` int NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  `empleado_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrada_detalle`
--

CREATE TABLE `entrada_detalle` (
  `id` int NOT NULL,
  `entrada_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `obra_id` int NOT NULL,
  `entrada_cantidad` int NOT NULL,
  `entrada_cantidad_propia` int NOT NULL,
  `entrada_cantidad_subalquilada` int NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `producto_id` int NOT NULL,
  `CantidadInicial` int NOT NULL,
  `CantidadIngresos` int NOT NULL,
  `CantidadSalidas` int NOT NULL,
  `CantidadFinal` int NOT NULL,
  `FechaInventario` date NOT NULL,
  `TipoOperacion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`producto_id`, `CantidadInicial`, `CantidadIngresos`, `CantidadSalidas`, `CantidadFinal`, `FechaInventario`, `TipoOperacion`) VALUES
(1, 10, 10, 0, 10, '2023-06-16', 'revision'),
(2, 10, 10, 0, 10, '2023-06-16', 'revision'),
(3, 10, 10, 0, 10, '2023-06-16', 'revision'),
(4, 10, 10, 0, 10, '2023-06-16', 'revision');

-- --------------------------------------------------------

--
-- Table structure for table `obra`
--

CREATE TABLE `obra` (
  `obra_id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_cliente` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `obra`
--

INSERT INTO `obra` (`obra_id`, `nombre`, `id_cliente`) VALUES
(1, 'edifico piedecueta', 1),
(2, 'edificio giron', 1),
(3, 'edifico bucaramanga', 2),
(4, 'edificio floridablanca', 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `producto_id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`producto_id`, `nombre`) VALUES
(1, 'grua'),
(2, 'voqueta'),
(3, 'camion'),
(4, 'cementadora');

-- --------------------------------------------------------

--
-- Table structure for table `salida`
--

CREATE TABLE `salida` (
  `salida_id` int NOT NULL,
  `cliente_id` int NOT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  `subtotalPeso` int NOT NULL,
  `empleado_id` int NOT NULL,
  `placatransporte` varchar(10) NOT NULL,
  `observaciones` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salida_detalle`
--

CREATE TABLE `salida_detalle` (
  `id` int NOT NULL,
  `salida_id` int NOT NULL,
  `producto_id` int NOT NULL,
  `obra_id` int NOT NULL,
  `cantidad_salida` int NOT NULL,
  `cantidad_propia` int NOT NULL,
  `cantidad_subalquilada` int NOT NULL,
  `valorUnidad` int NOT NULL,
  `fecha_standBye` date NOT NULL,
  `estado` varchar(50) NOT NULL,
  `empleado_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`empleado_id`);

--
-- Indexes for table `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`entrada_id`),
  ADD KEY `salida_id` (`salida_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indexes for table `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entrada_id` (`entrada_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `obra_id` (`obra_id`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indexes for table `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`obra_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indexes for table `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`salida_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `empleado_id` (`empleado_id`);

--
-- Indexes for table `salida_detalle`
--
ALTER TABLE `salida_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_id` (`salida_id`),
  ADD KEY `producto_id` (`producto_id`),
  ADD KEY `empleado_id` (`empleado_id`),
  ADD KEY `obra_id` (`obra_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `empleado_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `entrada`
--
ALTER TABLE `entrada`
  MODIFY `entrada_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `producto_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `obra`
--
ALTER TABLE `obra`
  MODIFY `obra_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salida`
--
ALTER TABLE `salida`
  MODIFY `salida_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salida_detalle`
--
ALTER TABLE `salida_detalle`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`salida_id`) REFERENCES `salida` (`salida_id`),
  ADD CONSTRAINT `entrada_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `entrada_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`);

--
-- Constraints for table `entrada_detalle`
--
ALTER TABLE `entrada_detalle`
  ADD CONSTRAINT `entrada_detalle_ibfk_1` FOREIGN KEY (`entrada_id`) REFERENCES `entrada` (`entrada_id`),
  ADD CONSTRAINT `entrada_detalle_ibfk_2` FOREIGN KEY (`entrada_id`) REFERENCES `entrada` (`entrada_id`),
  ADD CONSTRAINT `entrada_detalle_ibfk_3` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `entrada_detalle_ibfk_4` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`obra_id`);

--
-- Constraints for table `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Constraints for table `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `salida_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `salida_ibfk_4` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `salida_ibfk_5` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`);

--
-- Constraints for table `salida_detalle`
--
ALTER TABLE `salida_detalle`
  ADD CONSTRAINT `salida_detalle_ibfk_1` FOREIGN KEY (`salida_id`) REFERENCES `salida` (`salida_id`),
  ADD CONSTRAINT `salida_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `salida_detalle_ibfk_3` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `salida_detalle_ibfk_4` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`empleado_id`),
  ADD CONSTRAINT `salida_detalle_ibfk_5` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`obra_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
