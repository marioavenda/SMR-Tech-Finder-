-- ============================================================================
-- SMR Tech Finder - Esquema de Base de Datos (MySQL / MariaDB)
-- Proyecto Intermodular 2º SMR
-- Integrantes: Aitor Escudero, Alfredo Brito, Mario Avendaño y Miguel Fernández
-- ============================================================================

CREATE DATABASE IF NOT EXISTS smr_tech_finder
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE smr_tech_finder;

-- Tabla principal de resultados del test de orientación
CREATE TABLE IF NOT EXISTS resultados_test (
  id_test INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  plan_post_smr ENUM('gs', 'work', 'cert', 'unsure') NOT NULL,
  vocacion_inicial ENUM('hw', 'net', 'web', 'sec') NOT NULL,
  pts_hardware TINYINT UNSIGNED NOT NULL CHECK (pts_hardware <= 100),
  pts_redes TINYINT UNSIGNED NOT NULL CHECK (pts_redes <= 100),
  pts_web_bd TINYINT UNSIGNED NOT NULL CHECK (pts_web_bd <= 100),
  pts_seguridad TINYINT UNSIGNED NOT NULL CHECK (pts_seguridad <= 100),
  pts_total SMALLINT UNSIGNED NOT NULL CHECK (pts_total <= 400),
  rama_destacada ENUM('hw', 'net', 'web', 'sec') NOT NULL,
  recomendacion_gs VARCHAR(30) NOT NULL,
  fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Consulta de ejemplo para estadísticas de orientación del centro
-- SELECT rama_destacada, COUNT(*) AS alumnos, ROUND(AVG(pts_total), 1) AS media_total
-- FROM resultados_test
-- GROUP BY rama_destacada;
