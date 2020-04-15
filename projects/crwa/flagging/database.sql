-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 15, 2020 at 12:16 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `flagging`
--

-- --------------------------------------------------------

--
-- Table structure for table `crwa_notification.eventdata`
--

CREATE TABLE `crwa_notification.eventdata` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `startdate` varchar(255) NOT NULL,
  `enddate` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crwa_notification.modeldata`
--

CREATE TABLE `crwa_notification.modeldata` (
  `id` int(11) NOT NULL,
  `indx` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `datetime` varchar(255) NOT NULL,
  `watertemp_C` double NOT NULL,
  `airtemp_C` double NOT NULL,
  `rain_in` double NOT NULL,
  `raindays` double NOT NULL,
  `windspeed_mph` double NOT NULL,
  `flow_cfs` double NOT NULL,
  `par_uE` double NOT NULL,
  `lg_prb_R2_pct` double NOT NULL,
  `lg_prb_R3_pct` double NOT NULL,
  `lg_prb_R4_pct` double NOT NULL,
  `li_conc_LF_cfu` double NOT NULL,
  `lg_prb_LF_pct` double NOT NULL,
  `cso_CP` double NOT NULL,
  `cyano_NewtonYC` double DEFAULT NULL,
  `cyano_WatertownYC` double DEFAULT NULL,
  `cyano_CommRowing` double DEFAULT NULL,
  `cyano_CRCK` double DEFAULT NULL,
  `cyano_HarvardWeld` double DEFAULT NULL,
  `cyano_RiversideBC` double DEFAULT NULL,
  `cyano_CRYC` double DEFAULT NULL,
  `cyano_UnionBC` double DEFAULT NULL,
  `cyano_CommBoating` double DEFAULT NULL,
  `cyano_CRCKKendall` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crwa_notification.rawdata`
--

CREATE TABLE `crwa_notification.rawdata` (
  `id` int(11) NOT NULL,
  `site` varchar(255) NOT NULL,
  `datetime` varchar(255) NOT NULL,
  `watertemp_F` double DEFAULT NULL,
  `pressure_inHg` double DEFAULT NULL,
  `par_uE` double DEFAULT NULL,
  `rain_in` double DEFAULT NULL,
  `airtemp_F` double DEFAULT NULL,
  `relhumidity_pct` double DEFAULT NULL,
  `dewpoint_F` double DEFAULT NULL,
  `windspeed_mph` double DEFAULT NULL,
  `gustspeed_mph` double DEFAULT NULL,
  `winddir_deg` double DEFAULT NULL,
  `flow_cfs` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

