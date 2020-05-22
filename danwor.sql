-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-05-2020 a las 21:11:52
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `danwor`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestrocliente`
--

CREATE TABLE `maestrocliente` (
  `CodigoCliente` int(11) UNSIGNED NOT NULL,
  `NombreCliente` text NOT NULL,
  `UnidadDeNegocio` int(11) NOT NULL,
  `CUIT` varchar(13) NOT NULL,
  `FormaDePago` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maestrocliente`
--

INSERT INTO `maestrocliente` (`CodigoCliente`, `NombreCliente`, `UnidadDeNegocio`, `CUIT`, `FormaDePago`) VALUES
(2, 'Matias Martin', 25, '20408720630', 'efectivo papa'),
(3, 'pepito', 0, '20408720660', 'Debito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maestrounidades`
--

CREATE TABLE `maestrounidades` (
  `CodigoUnidadNegocio` int(11) NOT NULL,
  `UnidadDeNegocio` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `maestrounidades`
--

INSERT INTO `maestrounidades` (`CodigoUnidadNegocio`, `UnidadDeNegocio`) VALUES
(0, 'AxisOne'),
(25, 'Analytics');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `rol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `rol`) VALUES
(6, 'administrador danwor'),
(7, 'Recursos Humanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(70) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `email`, `rol_id`) VALUES
(4, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', 'admin@danword.com', 6),
(5, 'rrhh', 'fe01ce2a7fbac8fafaed7c982a04e229', 'rrhh@danword.com', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `maestrocliente`
--
ALTER TABLE `maestrocliente`
  ADD PRIMARY KEY (`CodigoCliente`),
  ADD KEY `UnidadDeNegocio` (`UnidadDeNegocio`);

--
-- Indices de la tabla `maestrounidades`
--
ALTER TABLE `maestrounidades`
  ADD PRIMARY KEY (`CodigoUnidadNegocio`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rol_id` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `maestrocliente`
--
ALTER TABLE `maestrocliente`
  MODIFY `CodigoCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `maestrounidades`
--
ALTER TABLE `maestrounidades`
  MODIFY `CodigoUnidadNegocio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `maestrocliente`
--
ALTER TABLE `maestrocliente`
  ADD CONSTRAINT `maestrocliente_ibfk_1` FOREIGN KEY (`UnidadDeNegocio`) REFERENCES `maestrounidades` (`CodigoUnidadNegocio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
