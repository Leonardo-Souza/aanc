-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 27-Jun-2016 às 18:39
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbaanc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `advertencias`
--

CREATE TABLE IF NOT EXISTS `advertencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  `data` date NOT NULL,
  `funcionario` int(11) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `detalhes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adv_funcionario_idx` (`funcionario`),
  KEY `adv_aluno_idx` (`aluno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE IF NOT EXISTS `alunos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `curso` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  `cmpendereco` tinyint(1) NOT NULL DEFAULT '0',
  `reservista` tinyint(1) NOT NULL DEFAULT '0',
  `hitorico` tinyint(1) NOT NULL DEFAULT '0',
  `identidade` tinyint(1) NOT NULL DEFAULT '0',
  `conclusaoem` tinyint(1) NOT NULL DEFAULT '0',
  `eleitor` tinyint(1) NOT NULL DEFAULT '0',
  `certidao` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  KEY `aluno_curso_idx` (`curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `alunos`
--

INSERT INTO `alunos` (`id`, `nome`, `cpf`, `nascimento`, `curso`, `email`, `telefone`, `logradouro`, `numero`, `bairro`, `cidade`, `cep`, `senha`, `ativo`, `cmpendereco`, `reservista`, `hitorico`, `identidade`, `conclusaoem`, `eleitor`, `certidao`) VALUES
(4, 'Chaves do Oito', '50762556676', '2000-10-12', 1, 'chaves@outlook.com', '(50) 7625-56676', '', 0, '', '', 0, '$2y$10$XEsrEnBck362sJuR00B4vOgcSBxeimeYOOs6eCjR.e3fu.Rw9cSWC', 1, 1, 1, 1, 1, 1, 1, 1),
(5, 'Kiko da Buchecha', '81338554549', '2016-06-01', 2, 'kiko@gmail.com', '(81) 3385-54549', '', 0, '', '', 0, '$2y$10$oi2wGebm1tEp1PRd6hbf6eM1GjtIPz8cMXIK59MnqUSDykasT4uUm', 1, 1, 0, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `chamada`
--

CREATE TABLE IF NOT EXISTS `chamada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  `viagem` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `chamada_aluno_idx` (`aluno`),
  KEY `chamda_viagem_idx` (`viagem`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `chamada`
--

INSERT INTO `chamada` (`id`, `aluno`, `viagem`, `status`) VALUES
(1, 4, 1, 1),
(2, 5, 1, 0),
(3, 4, 2, 1),
(4, 5, 2, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome`, `descricao`) VALUES
(1, 'Analise e Desenvolvimento de Sistemas', 'Duração de 3 anos\r\n'),
(2, 'Processos Quimícos', 'Duração de 3,5 anos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE IF NOT EXISTS `funcionarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `area` enum('1','2','3') NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `cidade` varchar(30) DEFAULT NULL,
  `cep` int(11) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`id`, `nome`, `cpf`, `nascimento`, `area`, `email`, `telefone`, `logradouro`, `numero`, `bairro`, `cidade`, `cep`, `senha`, `ativo`) VALUES
(4, 'Marcia Andrade', '13433174369', '1970-02-02', '1', 'marcia@iftm.edu.br', '(13) 4331-74369', '', 0, '', '', 0, '$2y$10$4CcLgflYFd2plqSqUHvELebaoDJkNkmtUznQDSKAhzTox1UxBEyzu', 1),
(5, 'Chiquinha da Badia', '77874268539', '0000-00-00', '2', 'badia@iftm.edu.br', '(77) 8742-68539', '', 0, '', '', 0, '$2y$10$4CcLgflYFd2plqSqUHvELebaoDJkNkmtUznQDSKAhzTox1UxBEyzu', 1),
(6, 'Gilberto GiIdeão', '48117486113', '0000-00-00', '3', 'gilberto@iftm.edu.br', '(48) 1174-86113', '', 0, '', '', 0, '$2y$10$W1/wxXfimr8Ujh3HKwpiX.UlBjIY53ufU0nJHTgyotrACdxakmqk6', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE IF NOT EXISTS `historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  `horario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `apoio` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `historico_aluno_idx` (`aluno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id`, `aluno`, `horario`, `apoio`) VALUES
(1, 4, '0000-00-00 00:00:00', '2016-06-27 13:23:13'),
(2, 5, '2016-06-27 18:26:43', '2016-06-27 13:23:15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `liberados`
--

CREATE TABLE IF NOT EXISTS `liberados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  `horario` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `liberados_aluno_idx` (`aluno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notificacaos`
--

CREATE TABLE IF NOT EXISTS `notificacaos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  `tipo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requisicao_aluno_idx` (`aluno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `notificacaos`
--

INSERT INTO `notificacaos` (`id`, `aluno`, `tipo`) VALUES
(2, 5, 0),
(3, 4, 1),
(4, 4, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE IF NOT EXISTS `permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aluno` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissao_alunos_idx` (`aluno`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `permissao`
--

INSERT INTO `permissao` (`id`, `aluno`) VALUES
(9, 4),
(7, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `viagens`
--

CREATE TABLE IF NOT EXISTS `viagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `alunos` int(11) NOT NULL,
  `disponivel` int(11) NOT NULL,
  `ida` date NOT NULL,
  `volta` date NOT NULL,
  `instrutor` int(11) NOT NULL,
  `verba` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `viagens_funcionario_idx` (`instrutor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `viagens`
--

INSERT INTO `viagens` (`id`, `nome`, `descricao`, `alunos`, `disponivel`, `ida`, `volta`, `instrutor`, `verba`) VALUES
(1, 'Congresso Nacional de Brasília', '', 12, 10, '2016-12-12', '2016-12-14', 6, 100),
(2, 'Vila do Chaves', '', 10, 8, '2016-05-30', '2016-05-31', 6, 100);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `advertencias`
--
ALTER TABLE `advertencias`
  ADD CONSTRAINT `adv_aluno` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adv_funcionario` FOREIGN KEY (`funcionario`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `aluno_curso` FOREIGN KEY (`curso`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `chamada`
--
ALTER TABLE `chamada`
  ADD CONSTRAINT `chamada_aluno` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chamda_viagem` FOREIGN KEY (`viagem`) REFERENCES `viagens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_aluno` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `liberados`
--
ALTER TABLE `liberados`
  ADD CONSTRAINT `liberados_aluno` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `notificacaos`
--
ALTER TABLE `notificacaos`
  ADD CONSTRAINT `requisicao_aluno` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `permissao`
--
ALTER TABLE `permissao`
  ADD CONSTRAINT `permissao_alunos` FOREIGN KEY (`aluno`) REFERENCES `alunos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `viagens`
--
ALTER TABLE `viagens`
  ADD CONSTRAINT `viagens_funcionario` FOREIGN KEY (`instrutor`) REFERENCES `funcionarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `resetaLiberacao` ON SCHEDULE EVERY 1 DAY STARTS '2016-06-27 00:00:01' ON COMPLETION NOT PRESERVE ENABLE DO DELETE FROM liberados$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
