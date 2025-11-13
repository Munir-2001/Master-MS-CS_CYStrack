-- Library Management System Database Schema

-- Drop tables if they exist (in reverse order of dependencies)
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

-- Create books table
CREATE TABLE books (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL
);

-- Create loans table (junction table for book loans)
CREATE TABLE loans (
    id SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    "bookId" VARCHAR(13) NOT NULL REFERENCES books(isbn) ON DELETE CASCADE,
    "leaseDate" DATE NOT NULL,
    "returnDate" DATE NOT NULL,
    CONSTRAINT check_return_after_lease CHECK ("returnDate" >= "leaseDate")
);

-- Create indexes for better query performance
CREATE INDEX idx_loans_userId ON loans("userId");
CREATE INDEX idx_loans_bookId ON loans("bookId");
CREATE INDEX idx_books_author ON books(author);

