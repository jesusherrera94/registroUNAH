-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 12-05-2018 a las 11:53:59
-- Versión del servidor: 5.7.22-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_unah`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ALUMNOS`
--

CREATE TABLE `TBL_ALUMNOS` (
  `CODIGO_ALUMNO` int(11) NOT NULL,
  `NUMERO_CUENTA` varchar(11) NOT NULL,
  `PROMEDIO` double DEFAULT NULL,
  `CONTRASE` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_ALUMNOS`
--

INSERT INTO `TBL_ALUMNOS` (`CODIGO_ALUMNO`, `NUMERO_CUENTA`, `PROMEDIO`, `CONTRASE`) VALUES
(8, '20121003010', 70, 'ff545ebe7e40766f0d874fe121f73229aa1344c4'),
(16, '20181003540', 80, '8d5004c9c74259ab775f63f7131da077814a7636'),
(20, '20181002030', 80, 'bcdcb29ed2aab16d48c11485264df665e906bdd9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_AREA_ESPECIALIZACIONES`
--

CREATE TABLE `TBL_AREA_ESPECIALIZACIONES` (
  `CODIGO_ESPECIALIZACION` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_AREA_ESPECIALIZACIONES`
--

INSERT INTO `TBL_AREA_ESPECIALIZACIONES` (`CODIGO_ESPECIALIZACION`, `DESCRIPCION`) VALUES
(1, 'Economia'),
(2, 'Ciencias de la computacion'),
(3, 'Biología'),
(4, 'Ciencias médicas'),
(5, 'Educación Superior'),
(6, 'Física'),
(7, 'Matemáticas'),
(8, 'Ciencias Sociales'),
(9, 'Lenguas Extranjeras'),
(10, 'Leyes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ASIGNATURAS`
--

CREATE TABLE `TBL_ASIGNATURAS` (
  `CODIGO_ASIGNATURA` int(11) NOT NULL,
  `CODIGO_ALTERNO` varchar(200) DEFAULT NULL,
  `NOMBRE_ASIGNATURA` varchar(4000) DEFAULT NULL,
  `CANTIDAD_UNIDADES_VALORATIVAS` int(11) DEFAULT NULL,
  `DIAS` varchar(200) DEFAULT NULL,
  `CODIGO_CARRERA` int(11) NOT NULL,
  `CODIGO_TIPO_ASIGNATURA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_AULAS`
--

CREATE TABLE `TBL_AULAS` (
  `CODIGO_AULA` int(11) NOT NULL,
  `NUMERO_AULA` varchar(100) NOT NULL,
  `CODIGO_TIPO_AULA` int(11) NOT NULL,
  `CODIGO_EDIFICIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_AULAS`
--

INSERT INTO `TBL_AULAS` (`CODIGO_AULA`, `NUMERO_AULA`, `CODIGO_TIPO_AULA`, `CODIGO_EDIFICIO`) VALUES
(1, '1', 2, 1),
(2, '4', 3, 1),
(3, '1', 8, 3),
(4, '2', 8, 1),
(5, '1', 10, 2),
(6, '1', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_CAMPUS`
--

CREATE TABLE `TBL_CAMPUS` (
  `CODIGO_CAMPUS` int(11) NOT NULL,
  `NOMBRE_CAMPUS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_CAMPUS`
--

INSERT INTO `TBL_CAMPUS` (`CODIGO_CAMPUS`, `NOMBRE_CAMPUS`) VALUES
(2, 'CU'),
(3, 'UNAH-VS'),
(4, 'DANLI'),
(5, 'COPAN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_CARGOS`
--

CREATE TABLE `TBL_CARGOS` (
  `CODIGO_CARGO` int(11) NOT NULL,
  `CODIGO_CARGO_SUPERIOR` int(11) DEFAULT NULL,
  `NOMBRE_CARGO` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_CARGOS`
--

INSERT INTO `TBL_CARGOS` (`CODIGO_CARGO`, `CODIGO_CARGO_SUPERIOR`, `NOMBRE_CARGO`) VALUES
(1, 1, 'Administrador'),
(2, 2, 'Decano'),
(3, 3, 'Jefe de carrera'),
(4, 4, 'Coordinador de Carrera'),
(5, 5, 'Maestro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_CARRERAS`
--

CREATE TABLE `TBL_CARRERAS` (
  `CODIGO_CARRERA` int(11) NOT NULL,
  `CODIGO_AUXILIAR` varchar(20) NOT NULL,
  `CODIGO_FACULTAD` int(11) NOT NULL,
  `NOMBRE_CARRERA` varchar(200) DEFAULT NULL,
  `CANTIDAD_ASIGNATURAS` int(11) NOT NULL,
  `CANTIDAD_UNIDADES_VALORATIVAS` int(11) DEFAULT NULL,
  `CODIGO_GRADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_CARRERAS`
--

INSERT INTO `TBL_CARRERAS` (`CODIGO_CARRERA`, `CODIGO_AUXILIAR`, `CODIGO_FACULTAD`, `NOMBRE_CARRERA`, `CANTIDAD_ASIGNATURAS`, `CANTIDAD_UNIDADES_VALORATIVAS`, `CODIGO_GRADO`) VALUES
(1, '115', 1, 'Ingenieria En Sistemas', 57, 224, 1),
(2, '110', 2, 'Ingenieria Civil', 64, 300, 1),
(3, '50', 2, 'Mercadotecnia', 52, 220, 1),
(4, '345', 4, 'Nutricion', 50, 200, 1),
(5, '123', 4, 'Medicina', 60, 300, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_CARRERAS_X_ALUMNOS`
--

CREATE TABLE `TBL_CARRERAS_X_ALUMNOS` (
  `CODIGO_CARRERA` int(11) NOT NULL,
  `CODIGO_ALUMNO` int(11) NOT NULL,
  `FECHA_REGISTRO_CARRERA` datetime NOT NULL,
  `PROMEDIO_CARRERA` double DEFAULT NULL,
  `CANTIDAD_CLASES_APROBADAS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_CARRERAS_X_ALUMNOS`
--

INSERT INTO `TBL_CARRERAS_X_ALUMNOS` (`CODIGO_CARRERA`, `CODIGO_ALUMNO`, `FECHA_REGISTRO_CARRERA`, `PROMEDIO_CARRERA`, `CANTIDAD_CLASES_APROBADAS`) VALUES
(1, 8, '2018-05-10 22:13:42', 70, 50),
(1, 16, '2018-05-12 00:21:59', 80, 25),
(1, 20, '2018-05-12 00:42:07', 80, 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_EDIFICIOS`
--

CREATE TABLE `TBL_EDIFICIOS` (
  `CODIGO_EDIFICIO` int(11) NOT NULL,
  `NOMBRE_EDIFICIO` varchar(200) DEFAULT NULL,
  `ALIAS_EDIFICIO` varchar(200) DEFAULT NULL,
  `CODIGO_CAMPUS` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_EDIFICIOS`
--

INSERT INTO `TBL_EDIFICIOS` (`CODIGO_EDIFICIO`, `NOMBRE_EDIFICIO`, `ALIAS_EDIFICIO`, `CODIGO_CAMPUS`) VALUES
(2, 'B2', 'B2', 2),
(3, 'A1', 'A1', 3),
(4, 'B1', 'B1', 2),
(6, 'A3', 'A3', 2),
(7, 'J1', 'J1', 2),
(8, 'F1-edificio', 'F1', 2),
(9, 'A1-DANLI', 'A1', 4),
(10, 'B1-COPAN', 'B1', 5),
(11, 'B2-COPAN', 'B2', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_EMPLEADOS`
--

CREATE TABLE `TBL_EMPLEADOS` (
  `CODIGO_EMPLEADO` int(11) NOT NULL,
  `NUMERO_EMPLEADO` int(11) NOT NULL,
  `SUELDO_BASE` double NOT NULL,
  `CODIGO_TIPO_EMPLEADO` int(11) NOT NULL,
  `CODIGO_CARGO` int(11) NOT NULL,
  `CONTRASENIA` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_EMPLEADOS`
--

INSERT INTO `TBL_EMPLEADOS` (`CODIGO_EMPLEADO`, `NUMERO_EMPLEADO`, `SUELDO_BASE`, `CODIGO_TIPO_EMPLEADO`, `CODIGO_CARGO`, `CONTRASENIA`) VALUES
(5, 3457, 20000, 1, 2, 'ff545ebe7e40766f0d874fe121f73229aa1344c4'),
(6, 6, 25000, 1, 1, 'asd@asd'),
(7, 4444, 19000, 1, 1, 'ff545ebe7e40766f0d874fe121f73229aa1344c4'),
(9, 5698, 20000, 1, 1, 'qwer.lo'),
(11, 1596, 25000, 1, 1, 'ff545ebe7e40766f0d874fe121f73229aa1344c4'),
(12, 5678, 123456789, 1, 1, '1161e6ffd3637b302a5cd74076283a7bd1fc20d3'),
(13, 1111, 453656, 1, 1, 'dde93f95d664df0c518e10bff196d9111e30e7ad'),
(14, 2334, 665656, 1, 1, 'a0646f580a081cc585a7acbe29ac64013f05d3c1'),
(15, 3435, 45646, 1, 3, 'b90e4138a0cbfb73d70b6a6b27b847db04c1b855'),
(18, 1515, 25000, 1, 1, 'ff545ebe7e40766f0d874fe121f73229aa1344c4'),
(19, 2255, 300000, 1, 5, '8d5004c9c74259ab775f63f7131da077814a7636');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ESTADOS_CIVILES`
--

CREATE TABLE `TBL_ESTADOS_CIVILES` (
  `CODIGO_ESTADO_CIVIL` int(11) NOT NULL,
  `NOMBRE_ESTADO_CIVIL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_ESTADOS_CIVILES`
--

INSERT INTO `TBL_ESTADOS_CIVILES` (`CODIGO_ESTADO_CIVIL`, `NOMBRE_ESTADO_CIVIL`) VALUES
(1, 'Soltero(a)'),
(2, 'Casado(a)'),
(3, 'Divorciado(a)'),
(4, 'Viudo(a)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_ESTADOS_MATRICULA`
--

CREATE TABLE `TBL_ESTADOS_MATRICULA` (
  `CODIGO_ESTADO_MATRICULA` int(11) NOT NULL,
  `NOMBRE_ESTADO` varchar(200) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_ESTADOS_MATRICULA`
--

INSERT INTO `TBL_ESTADOS_MATRICULA` (`CODIGO_ESTADO_MATRICULA`, `NOMBRE_ESTADO`, `DESCRIPCION`) VALUES
(1, 'Matriculado', 'El alumno está matriculado en la clase'),
(2, 'Espera', 'El alumno está en lista de espera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_FACULTADES`
--

CREATE TABLE `TBL_FACULTADES` (
  `CODIGO_FACULTAD` int(11) NOT NULL,
  `NOMBRE_FACULTAD` varchar(200) DEFAULT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_FACULTADES`
--

INSERT INTO `TBL_FACULTADES` (`CODIGO_FACULTAD`, `NOMBRE_FACULTAD`, `DESCRIPCION`) VALUES
(1, 'Ingenieria', 'Ingenieria'),
(2, 'Ciencias Economicas', 'Ciencias Economicas'),
(3, 'Ciencias Sociales', 'Ciencias Sociales'),
(4, 'Ciencias Medicas', 'Ciencias Medicas'),
(5, 'Humanidades', 'Humanidades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_GENEROS`
--

CREATE TABLE `TBL_GENEROS` (
  `CODIGO_GENERO` int(11) NOT NULL COMMENT 'IDENTIFICADOR UNICO PARA EL CAMPO GENERO',
  `NOMBRE_GENERO` varchar(60) NOT NULL,
  `ABREVIATURA` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_GENEROS`
--

INSERT INTO `TBL_GENEROS` (`CODIGO_GENERO`, `NOMBRE_GENERO`, `ABREVIATURA`) VALUES
(1, 'Masculino', 'M'),
(2, 'Femenino', 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_GRADOS`
--

CREATE TABLE `TBL_GRADOS` (
  `CODIGO_GRADO` int(11) NOT NULL,
  `NOMBRE_GRADO` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_GRADOS`
--

INSERT INTO `TBL_GRADOS` (`CODIGO_GRADO`, `NOMBRE_GRADO`) VALUES
(1, 'Pre-Grado'),
(2, 'Post-Grado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_HISTORIAL`
--

CREATE TABLE `TBL_HISTORIAL` (
  `CODIGO_HISTORIAL` int(11) NOT NULL,
  `CODIGO_ALUMNO` int(11) NOT NULL,
  `CODIGO_SECCION` int(11) NOT NULL,
  `CODIGO_PERIODO` int(11) NOT NULL,
  `PROMEDIO` double NOT NULL,
  `TIPO_EVALUACION` varchar(3) NOT NULL,
  `VALOR_NOTA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_MAESTROS`
--

CREATE TABLE `TBL_MAESTROS` (
  `CODIGO_MAESTRO` int(11) NOT NULL,
  `CODIGO_ESPECIALIZACION` int(11) NOT NULL,
  `CODIGO_TITULARIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_MAESTROS`
--

INSERT INTO `TBL_MAESTROS` (`CODIGO_MAESTRO`, `CODIGO_ESPECIALIZACION`, `CODIGO_TITULARIDAD`) VALUES
(5, 2, 2),
(15, 1, 1),
(17, 2, 2),
(19, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_MATRICULA`
--

CREATE TABLE `TBL_MATRICULA` (
  `FECHA_MATRICULA` datetime DEFAULT NULL,
  `CODIGO_SECCION` int(11) NOT NULL,
  `CODIGO_ALUMNO` int(11) NOT NULL,
  `CODIGO_ESTADO_MATRICULA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_PERIODOS`
--

CREATE TABLE `TBL_PERIODOS` (
  `CODIGO_PERIODO` int(11) NOT NULL,
  `NOMBRE_PERIODO` varchar(200) DEFAULT NULL,
  `FECHA_INICIO` datetime DEFAULT NULL,
  `FECHA_FIN` datetime DEFAULT NULL,
  `CODIGO_TIPO_PERIODO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_PERSONAS`
--

CREATE TABLE `TBL_PERSONAS` (
  `CODIGO_PERSONA` int(11) NOT NULL,
  `CODIGO_GENERO` int(11) NOT NULL,
  `CODIGO_CAMPUS` int(11) NOT NULL,
  `CODIGO_ESTADO_CIVIL` int(11) NOT NULL,
  `NOMBRE` varchar(200) NOT NULL,
  `APELLIDO` varchar(200) NOT NULL,
  `FECHA_NACIMIENTO` datetime NOT NULL,
  `IDENTIDAD` varchar(13) NOT NULL,
  `DIRECCION` varchar(800) NOT NULL,
  `TELEFONO` varchar(30) NOT NULL,
  `CORREO_ELECTRONICO` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_PERSONAS`
--

INSERT INTO `TBL_PERSONAS` (`CODIGO_PERSONA`, `CODIGO_GENERO`, `CODIGO_CAMPUS`, `CODIGO_ESTADO_CIVIL`, `NOMBRE`, `APELLIDO`, `FECHA_NACIMIENTO`, `IDENTIDAD`, `DIRECCION`, `TELEFONO`, `CORREO_ELECTRONICO`) VALUES
(1, 2, 2, 1, 'Jesus', 'Herrera', '1009-02-15 00:00:00', '0801199403872', 'Donde Sea', '88225577', 'algo@algo.com'),
(2, 2, 2, 1, 'Jesus', 'Herrera', '1009-02-15 00:00:00', '0801199403872', 'Donde Sea', '88225577', 'algo@algo.com'),
(3, 2, 2, 1, 'Jesus', 'Herrera', '1009-02-15 00:00:00', '0801199403872', 'Donde Sea', '88225577', 'algo@algo.com'),
(4, 2, 2, 1, 'Jesus', 'Herrera', '1009-02-15 00:00:00', '0801199403872', 'Donde Sea', '88225577', 'algo@algo.com'),
(5, 2, 2, 1, 'Jesus', 'Herrera', '1994-02-15 00:00:00', '0801199403872', 'asdsdfds', '23445645', 'asd@asd.com'),
(6, 2, 2, 1, 'Mario', 'Morazán', '1990-03-15 00:00:00', '1515199003258', 'sad', '1122334455', 'asd@asd.com'),
(7, 2, 2, 1, 'Alex', 'Mendoza', '1980-02-25 00:00:00', '1234567891011', 'asd', 'q3435689', 'asd@asd.com'),
(8, 2, 2, 1, 'Jesus Alberto', 'Herrera ', '1994-12-02 00:00:00', '0801199403872', 'Altos de Santa Rosa', '12343', 'jesus_herrera@unah.com'),
(9, 2, 2, 1, 'Roberto', 'Zapata', '1994-10-15 00:00:00', '0102199404578', 'Res Santa Cruz', '33454631', 'robert@unah.hn'),
(10, 1, 2, 1, 'Skarlet', 'Johanson', '1980-02-15 00:00:00', '108045963578', 'California', '123456789', 'skarlet@unah.hn'),
(11, 2, 2, 1, 'Goku', 'Rodriguez', '1998-02-02 00:00:00', '1025896325', 'Namekuseí', '12345678', 'goku@unah.hn'),
(12, 2, 2, 1, 'asdfsdf', 'asfdfds', '2222-05-05 00:00:00', '482588256256', 'asdsafsd', '6216135', 'asdas@asdsd.com'),
(13, 2, 2, 1, 'fhdfh', 'fgjghj', '3355-05-04 00:00:00', '45345345345', '45345345', '45345345', 'zsfsdg@asdasd'),
(14, 2, 2, 1, 'dfhgfh', 'gjghjg', '3535-05-04 00:00:00', '315353153153', '453453563', '5635635656', 'asd@asd.com'),
(15, 1, 2, 1, 'sdgdfhfg', 'gkhjljkl', '6556-05-04 00:00:00', '456456565', '4564645', '54645645645', 'adas@asdas.com'),
(16, 2, 4, 4, 'Roshi', 'kah', '1960-05-02 00:00:00', '1212196012456', 'Tegucigalpa', '3557664', 'asd@asd.com'),
(17, 2, 3, 1, 'Krilin', 'Montez', '1989-06-05 00:00:00', '321219893540', 'SPS', '3455557', 'krilin@unah.hn'),
(18, 2, 2, 1, 'Goku', 'Rodriguez', '1989-02-05 00:00:00', '1212198912456', 'Tegucigalpa', '89898989', 'goku@unah.hn'),
(19, 2, 2, 4, 'Roshi', 'kan', '1960-02-02 00:00:00', '1212196012345', 'Tegucigalpa', '11111111', 'roshi@unah.hn'),
(20, 2, 2, 1, 'Krilin', 'Jimenez', '1989-03-05 00:00:00', '1212198903548', 'Carrizal', '89875645', 'krilin@unah.hn');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_REQUISITOS`
--

CREATE TABLE `TBL_REQUISITOS` (
  `CODIGO_ASIGNATURA` int(11) NOT NULL,
  `CODIGO_ASIGNATURA_REQUISITO` int(11) DEFAULT NULL,
  `CODIGO_CARRERA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_SECCION`
--

CREATE TABLE `TBL_SECCION` (
  `CODIGO_SECCION` int(11) NOT NULL,
  `CODIGO_ALTERNO` varchar(200) NOT NULL,
  `HORA_INICIO` datetime DEFAULT NULL,
  `HORA_FIN` datetime DEFAULT NULL,
  `DIAS` varchar(200) DEFAULT NULL,
  `CODIGO_AULA` int(11) NOT NULL,
  `CODIGO_ASIGNATURA` int(11) NOT NULL,
  `CODIGO_MAESTRO` int(11) NOT NULL,
  `CODIGO_PERIODO` int(11) NOT NULL,
  `CANTIDAD_CUPOS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TIPOS_AULAS`
--

CREATE TABLE `TBL_TIPOS_AULAS` (
  `CODIGO_TIPO_AULA` int(11) NOT NULL,
  `TIPO_AULA` varchar(200) NOT NULL,
  `DESCRIPCION` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TIPOS_AULAS`
--

INSERT INTO `TBL_TIPOS_AULAS` (`CODIGO_TIPO_AULA`, `TIPO_AULA`, `DESCRIPCION`) VALUES
(1, 'Magistral', 'Aula común y corriente'),
(2, 'Laboratorio', 'Aula dedicada para Laboratorios'),
(3, 'Auditorio', 'Aula dedicado como auditorio de exposiciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TIPOS_PERIODOS`
--

CREATE TABLE `TBL_TIPOS_PERIODOS` (
  `CODIGO_TIPO_PERIODO` int(11) NOT NULL COMMENT 'Campo que identifica de forma unica un tipo de periodo',
  `TIPO_PERIODO` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TIPOS_PERIODOS`
--

INSERT INTO `TBL_TIPOS_PERIODOS` (`CODIGO_TIPO_PERIODO`, `TIPO_PERIODO`) VALUES
(1, 'Normal'),
(2, 'Corto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TIPO_ASIGNATURA`
--

CREATE TABLE `TBL_TIPO_ASIGNATURA` (
  `CODIGO_TIPO_ASIGNATURA` int(11) NOT NULL,
  `TIPO_ASIGNATURA` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TIPO_ASIGNATURA`
--

INSERT INTO `TBL_TIPO_ASIGNATURA` (`CODIGO_TIPO_ASIGNATURA`, `TIPO_ASIGNATURA`) VALUES
(1, 'Principal'),
(2, 'Electiva'),
(3, 'Optativa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TIPO_EMPLEADO`
--

CREATE TABLE `TBL_TIPO_EMPLEADO` (
  `CODIGO_TIPO_EMPLEADO` int(11) NOT NULL,
  `NOMBRE_TIPO_EMPLEADO` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TIPO_EMPLEADO`
--

INSERT INTO `TBL_TIPO_EMPLEADO` (`CODIGO_TIPO_EMPLEADO`, `NOMBRE_TIPO_EMPLEADO`) VALUES
(1, 'Permanente'),
(2, 'Contrato');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TIPO_IDENTIFICACION`
--

CREATE TABLE `TBL_TIPO_IDENTIFICACION` (
  `CODIGO_TIPO_IDENTIFICACION` int(11) NOT NULL,
  `TIPO_IDENTIFICACION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TIPO_IDENTIFICACION`
--

INSERT INTO `TBL_TIPO_IDENTIFICACION` (`CODIGO_TIPO_IDENTIFICACION`, `TIPO_IDENTIFICACION`) VALUES
(1, 'RNP'),
(2, 'Pasaporte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TITULARIDAD`
--

CREATE TABLE `TBL_TITULARIDAD` (
  `CODIGO_TITULARIDAD` int(11) NOT NULL,
  `NOMBRE_TITULARIDAD` varchar(200) DEFAULT NULL,
  `SALARIO_MINIMO` double DEFAULT NULL,
  `SALARIO_MAXIMO` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `TBL_TITULARIDAD`
--

INSERT INTO `TBL_TITULARIDAD` (`CODIGO_TITULARIDAD`, `NOMBRE_TITULARIDAD`, `SALARIO_MINIMO`, `SALARIO_MAXIMO`) VALUES
(1, 'Licenciado', 8000, 15000),
(2, 'Ingeniero', 20000, 40000),
(3, 'Master', 25000, 45000),
(4, 'Doctor', 30000, 60000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TBL_TITULOS_X_EMPLEADO`
--

CREATE TABLE `TBL_TITULOS_X_EMPLEADO` (
  `CODIGO_TITULO` int(11) NOT NULL,
  `CODIGO_EMPLEADO` int(11) NOT NULL,
  `CODIGO_UNIVERSIDAD` int(11) NOT NULL,
  `FECHA` datetime DEFAULT NULL,
  `NUMERO_REGISTRO` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `TBL_ALUMNOS`
--
ALTER TABLE `TBL_ALUMNOS`
  ADD PRIMARY KEY (`CODIGO_ALUMNO`);

--
-- Indices de la tabla `TBL_AREA_ESPECIALIZACIONES`
--
ALTER TABLE `TBL_AREA_ESPECIALIZACIONES`
  ADD PRIMARY KEY (`CODIGO_ESPECIALIZACION`);

--
-- Indices de la tabla `TBL_ASIGNATURAS`
--
ALTER TABLE `TBL_ASIGNATURAS`
  ADD PRIMARY KEY (`CODIGO_ASIGNATURA`),
  ADD KEY `TBL_ASIGNATURAS_TBL_CARRERAS_FK` (`CODIGO_CARRERA`),
  ADD KEY `TBL_ASIGNATURAS_TBL_TIPO_ASIGNATURA_FK` (`CODIGO_TIPO_ASIGNATURA`);

--
-- Indices de la tabla `TBL_AULAS`
--
ALTER TABLE `TBL_AULAS`
  ADD PRIMARY KEY (`CODIGO_AULA`),
  ADD KEY `TBL_AULAS_TBL_EDIFICIOS_FK` (`CODIGO_EDIFICIO`),
  ADD KEY `TBL_AULAS_TBL_TIPOS_AULAS_FK` (`CODIGO_TIPO_AULA`);

--
-- Indices de la tabla `TBL_CAMPUS`
--
ALTER TABLE `TBL_CAMPUS`
  ADD PRIMARY KEY (`CODIGO_CAMPUS`);

--
-- Indices de la tabla `TBL_CARGOS`
--
ALTER TABLE `TBL_CARGOS`
  ADD PRIMARY KEY (`CODIGO_CARGO`),
  ADD KEY `TBL_CARGOS_TBL_CARGOS_FK` (`CODIGO_CARGO_SUPERIOR`);

--
-- Indices de la tabla `TBL_CARRERAS`
--
ALTER TABLE `TBL_CARRERAS`
  ADD PRIMARY KEY (`CODIGO_CARRERA`),
  ADD KEY `TBL_CARRERAS_TBL_FACULTADES_FK` (`CODIGO_FACULTAD`),
  ADD KEY `TBL_CARRERAS_TBL_GRADOS_FK` (`CODIGO_GRADO`);

--
-- Indices de la tabla `TBL_CARRERAS_X_ALUMNOS`
--
ALTER TABLE `TBL_CARRERAS_X_ALUMNOS`
  ADD PRIMARY KEY (`CODIGO_CARRERA`,`CODIGO_ALUMNO`),
  ADD KEY `TBL_CARRERAS_X_ALUMNOS_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO`);

--
-- Indices de la tabla `TBL_EDIFICIOS`
--
ALTER TABLE `TBL_EDIFICIOS`
  ADD PRIMARY KEY (`CODIGO_EDIFICIO`),
  ADD KEY `TBL_EDIFICIOS_TBL_CAMPUS_FK` (`CODIGO_CAMPUS`);

--
-- Indices de la tabla `TBL_EMPLEADOS`
--
ALTER TABLE `TBL_EMPLEADOS`
  ADD PRIMARY KEY (`CODIGO_EMPLEADO`),
  ADD KEY `TBL_EMPLEADOS_TBL_CARGOS_FK` (`CODIGO_CARGO`),
  ADD KEY `TBL_EMPLEADOS_TBL_TIPO_EMPLEADO_FK` (`CODIGO_TIPO_EMPLEADO`);

--
-- Indices de la tabla `TBL_ESTADOS_CIVILES`
--
ALTER TABLE `TBL_ESTADOS_CIVILES`
  ADD PRIMARY KEY (`CODIGO_ESTADO_CIVIL`);

--
-- Indices de la tabla `TBL_ESTADOS_MATRICULA`
--
ALTER TABLE `TBL_ESTADOS_MATRICULA`
  ADD PRIMARY KEY (`CODIGO_ESTADO_MATRICULA`);

--
-- Indices de la tabla `TBL_FACULTADES`
--
ALTER TABLE `TBL_FACULTADES`
  ADD PRIMARY KEY (`CODIGO_FACULTAD`);

--
-- Indices de la tabla `TBL_GENEROS`
--
ALTER TABLE `TBL_GENEROS`
  ADD PRIMARY KEY (`CODIGO_GENERO`);

--
-- Indices de la tabla `TBL_GRADOS`
--
ALTER TABLE `TBL_GRADOS`
  ADD PRIMARY KEY (`CODIGO_GRADO`);

--
-- Indices de la tabla `TBL_HISTORIAL`
--
ALTER TABLE `TBL_HISTORIAL`
  ADD PRIMARY KEY (`CODIGO_HISTORIAL`),
  ADD KEY `TBL_HISTORIAL_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO`),
  ADD KEY `TBL_HISTORIAL_TBL_PERIODOS_FK` (`CODIGO_PERIODO`),
  ADD KEY `TBL_HISTORIAL_TBL_SECCION_FK` (`CODIGO_SECCION`);

--
-- Indices de la tabla `TBL_MAESTROS`
--
ALTER TABLE `TBL_MAESTROS`
  ADD PRIMARY KEY (`CODIGO_MAESTRO`),
  ADD KEY `TBL_MAESTROS_TBL_AREA_ESPECIALIZACIONES_FK` (`CODIGO_ESPECIALIZACION`),
  ADD KEY `TBL_MAESTROS_TBL_TITULARIDAD_FK` (`CODIGO_TITULARIDAD`);

--
-- Indices de la tabla `TBL_MATRICULA`
--
ALTER TABLE `TBL_MATRICULA`
  ADD KEY `TBL_MATRICULA_TBL_ALUMNOS_FK` (`CODIGO_ALUMNO`),
  ADD KEY `TBL_MATRICULA_TBL_ESTADOS_MATRICULA_FK` (`CODIGO_ESTADO_MATRICULA`),
  ADD KEY `TBL_MATRICULA_TBL_SECCION_FK` (`CODIGO_SECCION`);

--
-- Indices de la tabla `TBL_PERIODOS`
--
ALTER TABLE `TBL_PERIODOS`
  ADD PRIMARY KEY (`CODIGO_PERIODO`),
  ADD KEY `TBL_PERIODOS_TBL_TIPOS_PERIODOS_FK` (`CODIGO_TIPO_PERIODO`);

--
-- Indices de la tabla `TBL_PERSONAS`
--
ALTER TABLE `TBL_PERSONAS`
  ADD PRIMARY KEY (`CODIGO_PERSONA`),
  ADD KEY `TBL_ALUMNOS_TBL_CAMPUS_FK` (`CODIGO_CAMPUS`),
  ADD KEY `TBL_ALUMNOS_TBL_ESTADOS_CIVILES_FK` (`CODIGO_ESTADO_CIVIL`),
  ADD KEY `TBL_ALUMNOS_TBL_GENEROS_FK` (`CODIGO_GENERO`);

--
-- Indices de la tabla `TBL_REQUISITOS`
--
ALTER TABLE `TBL_REQUISITOS`
  ADD KEY `TBL_REQUISITOS__IDX` (`CODIGO_ASIGNATURA`),
  ADD KEY `TBL_REQUISITOS_TBL_ASIGNATURAS_FKv1` (`CODIGO_ASIGNATURA_REQUISITO`),
  ADD KEY `TBL_REQUISITOS_TBL_CARRERAS_FK` (`CODIGO_CARRERA`);

--
-- Indices de la tabla `TBL_SECCION`
--
ALTER TABLE `TBL_SECCION`
  ADD PRIMARY KEY (`CODIGO_SECCION`),
  ADD KEY `TBL_SECCION_TBL_ASIGNATURAS_FK` (`CODIGO_ASIGNATURA`),
  ADD KEY `TBL_SECCION_TBL_AULAS_FK` (`CODIGO_AULA`),
  ADD KEY `TBL_SECCION_TBL_MAESTROS_FK` (`CODIGO_MAESTRO`),
  ADD KEY `TBL_SECCION_TBL_PERIODOS_FK` (`CODIGO_PERIODO`);

--
-- Indices de la tabla `TBL_TIPOS_AULAS`
--
ALTER TABLE `TBL_TIPOS_AULAS`
  ADD PRIMARY KEY (`CODIGO_TIPO_AULA`);

--
-- Indices de la tabla `TBL_TIPOS_PERIODOS`
--
ALTER TABLE `TBL_TIPOS_PERIODOS`
  ADD PRIMARY KEY (`CODIGO_TIPO_PERIODO`);

--
-- Indices de la tabla `TBL_TIPO_ASIGNATURA`
--
ALTER TABLE `TBL_TIPO_ASIGNATURA`
  ADD PRIMARY KEY (`CODIGO_TIPO_ASIGNATURA`);

--
-- Indices de la tabla `TBL_TIPO_EMPLEADO`
--
ALTER TABLE `TBL_TIPO_EMPLEADO`
  ADD PRIMARY KEY (`CODIGO_TIPO_EMPLEADO`);

--
-- Indices de la tabla `TBL_TIPO_IDENTIFICACION`
--
ALTER TABLE `TBL_TIPO_IDENTIFICACION`
  ADD PRIMARY KEY (`CODIGO_TIPO_IDENTIFICACION`);

--
-- Indices de la tabla `TBL_TITULARIDAD`
--
ALTER TABLE `TBL_TITULARIDAD`
  ADD PRIMARY KEY (`CODIGO_TITULARIDAD`);

--
-- Indices de la tabla `TBL_TITULOS_X_EMPLEADO`
--
ALTER TABLE `TBL_TITULOS_X_EMPLEADO`
  ADD PRIMARY KEY (`CODIGO_TITULO`,`CODIGO_EMPLEADO`),
  ADD KEY `TBL_TITULOS_X_EMPLEADO_TBL_EMPLEADOS_FK` (`CODIGO_EMPLEADO`),
  ADD KEY `TBL_TITULOS_X_EMPLEADO_TBL_UNIVERSIDADES_FK` (`CODIGO_UNIVERSIDAD`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `TBL_AREA_ESPECIALIZACIONES`
--
ALTER TABLE `TBL_AREA_ESPECIALIZACIONES`
  MODIFY `CODIGO_ESPECIALIZACION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `TBL_ASIGNATURAS`
--
ALTER TABLE `TBL_ASIGNATURAS`
  MODIFY `CODIGO_ASIGNATURA` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TBL_AULAS`
--
ALTER TABLE `TBL_AULAS`
  MODIFY `CODIGO_AULA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `TBL_CAMPUS`
--
ALTER TABLE `TBL_CAMPUS`
  MODIFY `CODIGO_CAMPUS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_CARGOS`
--
ALTER TABLE `TBL_CARGOS`
  MODIFY `CODIGO_CARGO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_CARRERAS`
--
ALTER TABLE `TBL_CARRERAS`
  MODIFY `CODIGO_CARRERA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_EDIFICIOS`
--
ALTER TABLE `TBL_EDIFICIOS`
  MODIFY `CODIGO_EDIFICIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `TBL_ESTADOS_CIVILES`
--
ALTER TABLE `TBL_ESTADOS_CIVILES`
  MODIFY `CODIGO_ESTADO_CIVIL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `TBL_ESTADOS_MATRICULA`
--
ALTER TABLE `TBL_ESTADOS_MATRICULA`
  MODIFY `CODIGO_ESTADO_MATRICULA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `TBL_FACULTADES`
--
ALTER TABLE `TBL_FACULTADES`
  MODIFY `CODIGO_FACULTAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `TBL_GRADOS`
--
ALTER TABLE `TBL_GRADOS`
  MODIFY `CODIGO_GRADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `TBL_HISTORIAL`
--
ALTER TABLE `TBL_HISTORIAL`
  MODIFY `CODIGO_HISTORIAL` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TBL_PERSONAS`
--
ALTER TABLE `TBL_PERSONAS`
  MODIFY `CODIGO_PERSONA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `TBL_SECCION`
--
ALTER TABLE `TBL_SECCION`
  MODIFY `CODIGO_SECCION` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `TBL_TIPOS_AULAS`
--
ALTER TABLE `TBL_TIPOS_AULAS`
  MODIFY `CODIGO_TIPO_AULA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `TBL_TIPO_ASIGNATURA`
--
ALTER TABLE `TBL_TIPO_ASIGNATURA`
  MODIFY `CODIGO_TIPO_ASIGNATURA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `TBL_TIPO_EMPLEADO`
--
ALTER TABLE `TBL_TIPO_EMPLEADO`
  MODIFY `CODIGO_TIPO_EMPLEADO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `TBL_TITULARIDAD`
--
ALTER TABLE `TBL_TITULARIDAD`
  MODIFY `CODIGO_TITULARIDAD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
