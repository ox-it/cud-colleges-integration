USE master;
GO
CREATE DATABASE CUD_Receiver
ON
( NAME = Sales_dat,
    FILENAME = '<pathfile>CUD_Receiver_master.mdf',
    SIZE = 10,
    FILEGROWTH = 10% )
LOG ON
( NAME = Sales_log,
    FILENAME = '<pathfile>CUD_Receiver_log.ldf',
    SIZE = 5MB,
    FILEGROWTH = 10% ) ;
GO