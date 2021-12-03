/**********************************************************/
-- Author: Marco Ortiz
-- Date: 09/14/2021
-- Script: demodb.sql - hey!!
--      creates datadabse: demodb
--      creates table: es_table
/**********************************************************/

SET NOCOUNT ON
GO

PRINT 'CREATING DATABASE demodb'
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'demodb')
    CREATE DATABASE demodb;
GO

IF EXISTS (SELECT 1 FROM SYS.DATABASES WHERE NAME = 'demodb')
DROP DATABASE demodb
GO
CREATE DATABASE demodb
GO

PRINT 'CREATING TABLE'
GO

-- Check if the table exists
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='es_table' and xtype='U')
BEGIN

    USE [demodb]

    SET ANSI_NULLS ON

    SET QUOTED_IDENTIFIER ON

    CREATE TABLE [dbo].[es_table]
    (
        [id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
        [client_name] [varchar](32) NOT NULL,
        [zRevised_date] [datetime] NULL,
        [zDeleted_date] [datetime] NULL,
        CONSTRAINT [PK_dbo_test_table] PRIMARY KEY CLUSTERED 
    (
        [id] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
    ) ON [PRIMARY]
    
    INSERT INTO es_table (client_name, zRevised_date) VALUES ('Jim Carrey', getdate());
    INSERT INTO es_table (client_name, zRevised_date) VALUES ('Mike Myers', getdate());
    INSERT INTO es_table (client_name, zRevised_date) VALUES ('Bryan Adams', getdate());

END



