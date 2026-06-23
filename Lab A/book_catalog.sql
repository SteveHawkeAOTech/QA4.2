USE master
GO

if exists (select * from sysdatabases where name ='book_catalog')
    ALTER DATABASE book_catalog SET SINGLE_USER WITH  ROLLBACK IMMEDIATE
    drop database book_catalog
GO
CREATE DATABASE book_catalog
GO

USE book_catalog
GO

-- CREATE TABLE books
CREATE TABLE books (
    isbn VARCHAR(13) NOT NULL,
    title NVARCHAR(100) NOT NULL,
    subtitle NVARCHAR(100) DEFAULT NULL,
    no_pages INT DEFAULT 0,
    PRIMARY KEY (isbn)
)
GO

-- CREATE TABLE authors
CREATE TABLE authors (
    id INT IDENTITY (1, 1) NOT NULL,
    author_name NVARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
)
GO

-- CREATE TABLE themes
CREATE TABLE themes(
    id INT IDENTITY (1, 1) NOT NULL,
    theme_name NVARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
)
GO

-- CREATE TABLE authors_books
CREATE TABLE authors_books (
    isbn VARCHAR(13),
    author_id INT,
    PRIMARY KEY (isbn, author_id),
    FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (author_id) REFERENCES authors(id)
)
GO

-- CREATE TABLE books_themes
CREATE TABLE books_themes (
    isbn VARCHAR(13),
    theme_id INT,
    PRIMARY KEY (isbn, theme_id),
    FOREIGN KEY (isbn) REFERENCES books(isbn),
    FOREIGN KEY (theme_id) REFERENCES themes(id)
)
GO
