-- Crear base de datos
CREATE DATABASE DB_BANCO;
GO

-- Login bdd
USE DB_BANCO;
GO

-- Crear tabla tbl_usuarios
CREATE TABLE tbl_usuarios (
    CodigoUsuario INT IDENTITY(1,1) PRIMARY KEY,
    UsuarioSistema NVARCHAR(100) NOT NULL,
    ClaveSistema NVARCHAR(255) NOT NULL,
    Estado NVARCHAR(15),
    FechaCreacion DATETIME,
    FechaModificacion DATETIME
);
GO

-- Crear tabla tbl_clientes
CREATE TABLE tbl_clientes (
    CodigoCliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(255),
    Departamento NVARCHAR(100),
    Pais NVARCHAR(100),
    Categoria NVARCHAR(50),
    Estado NVARCHAR(15)
);
GO

-- Crear tabla tbl_cuentas
CREATE TABLE tbl_cuentas (
    CodigoCuenta INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente INT NOT NULL,
    NumeroCuenta NVARCHAR(50) NOT NULL,
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(10, 2) DEFAULT 0,
    FechaApertura DATETIME,
    Estado NVARCHAR(15),
    FOREIGN KEY (CodigoCliente) REFERENCES tbl_clientes(CodigoCliente)
);
GO

-- Crear tabla tbl_movimientos
CREATE TABLE tbl_movimientos (
    CodigoMovimiento INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCuenta INT NOT NULL,
    TipoTransaccion NVARCHAR(50),
    Monto DECIMAL(10, 2) NOT NULL,
    Moneda NVARCHAR(10) NOT NULL,
    Estado NVARCHAR(15),
    FechaTransaccion DATETIME,
    FOREIGN KEY (CodigoCuenta) REFERENCES tbl_cuentas(CodigoCuenta)
);
GO

-- Crear tabla tbl_prestamos
CREATE TABLE tbl_prestamos (
    CodigoPrestamo INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente INT NOT NULL,
    MotivoPrestamo NVARCHAR(255),
    Monto DECIMAL(10, 2) NOT NULL,
    Moneda NVARCHAR(10) NOT NULL,
    TasaInteres DECIMAL(5, 2),
    PlazoMeses INT,
    FechaPrestamo DATETIME,
    Estado NVARCHAR(15),
    FOREIGN KEY (CodigoCliente) REFERENCES tbl_clientes(CodigoCliente)
);
GO

-- Crear tabla tbl_tarjetas
CREATE TABLE tbl_tarjetas (
    CodigoTarjeta INT IDENTITY(1,1) PRIMARY KEY,
    CodigoCliente INT NOT NULL,
    NumeroTarjeta NVARCHAR(50) NOT NULL,
    TipoTarjeta NVARCHAR(50),
    CategoriaTarjeta NVARCHAR(50),
    FechaExpiracion DATETIME,
    CVV NVARCHAR(4),
    Monto DECIMAL(10, 2) DEFAULT 0,
    Moneda NVARCHAR(10) NOT NULL,
    Estado NVARCHAR(15),
    FOREIGN KEY (CodigoCliente) REFERENCES tbl_clientes(CodigoCliente)
);
GO

-- Crear tabla tbl_pagos
CREATE TABLE tbl_pagos (
    CodigoPago INT IDENTITY(1,1) PRIMARY KEY,
    CodigoPrestamo INT,
    CodigoTarjeta INT,
    CodigoCuenta INT,
    Monto DECIMAL(10, 2) NOT NULL,
    MonedaPago NVARCHAR(10) NOT NULL,
    FechaPago DATETIME,
    Estado NVARCHAR(15),
    FOREIGN KEY (CodigoPrestamo) REFERENCES tbl_prestamos(CodigoPrestamo),
    FOREIGN KEY (CodigoTarjeta) REFERENCES tbl_tarjetas(CodigoTarjeta),
    FOREIGN KEY (CodigoCuenta) REFERENCES tbl_cuentas(CodigoCuenta)
);