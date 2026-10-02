-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-10-2026 a las 23:03:56
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ejercicios_python`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intentos`
--

CREATE TABLE `intentos` (
  `id` int(11) NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `mensaje` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `intentos`
--

INSERT INTO `intentos` (`id`, `numero`, `mensaje`) VALUES
(1, 45, 'El número secreto es menor'),
(2, 32, 'El número secreto es menor'),
(3, 20, 'El número secreto es menor'),
(4, 10, 'El número secreto es mayor'),
(5, 15, '¡Adivinaste!'),
(6, 13, 'El número secreto es mayor'),
(7, 20, 'El número secreto es mayor'),
(8, 19, 'El número secreto es mayor'),
(9, 40, 'El número secreto es mayor'),
(10, 60, 'El número secreto es menor'),
(11, 90, 'El número secreto es menor'),
(12, 55, 'El número secreto es menor'),
(13, 53, 'El número secreto es menor'),
(14, 51, 'El número secreto es menor'),
(15, 50, 'El número secreto es menor'),
(16, 45, 'El número secreto es mayor'),
(17, 47, '¡Adivinaste!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidas`
--

CREATE TABLE `partidas` (
  `id` int(11) NOT NULL,
  `secreto` int(11) NOT NULL,
  `intentos` int(11) DEFAULT 0,
  `ganada` tinyint(1) DEFAULT 0,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidas`
--

INSERT INTO `partidas` (`id`, `secreto`, `intentos`, `ganada`, `fecha`) VALUES
(1, 86, 7, 1, '2026-10-02 17:25:39'),
(2, 94, 8, 1, '2026-10-02 17:34:59'),
(3, 88, 7, 0, '2026-10-02 17:35:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `par_impar`
--

CREATE TABLE `par_impar` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `resultado` varchar(10) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `par_impar`
--

INSERT INTO `par_impar` (`id`, `numero`, `resultado`, `fecha`) VALUES
(1, 14, 'par', '2026-09-30 21:22:47'),
(2, 23, 'impar', '2026-10-02 17:24:03'),
(3, 41, 'impar', '2026-10-02 17:24:07'),
(4, 99, 'impar', '2026-10-02 17:34:01'),
(5, 100, 'par', '2026-10-02 17:34:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tablas`
--

CREATE TABLE `tablas` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tablas`
--

INSERT INTO `tablas` (`id`, `numero`, `fecha`) VALUES
(1, 10, '2026-10-02 17:24:12'),
(2, 10, '2026-10-02 17:25:23'),
(3, 23, '2026-10-02 17:34:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `intentos`
--
ALTER TABLE `intentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partidas`
--
ALTER TABLE `partidas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `par_impar`
--
ALTER TABLE `par_impar`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tablas`
--
ALTER TABLE `tablas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `intentos`
--
ALTER TABLE `intentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `partidas`
--
ALTER TABLE `partidas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `par_impar`
--
ALTER TABLE `par_impar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tablas`
--
ALTER TABLE `tablas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
