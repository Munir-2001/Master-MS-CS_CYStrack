-- Sample data for Library Management System

-- Insert sample users
INSERT INTO users (name, surname, email) VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com'),
    ('Bob', 'Smith', 'bob.smith@example.com'),
    ('Charlie', 'Brown', 'charlie.brown@example.com'),
    ('Diana', 'Williams', 'diana.williams@example.com');

-- Insert sample books
INSERT INTO books (isbn, title, author) VALUES
    ('9781234567890', 'The Great Gatsby', 'F. Scott Fitzgerald'),
    ('9781234567891', 'To Kill a Mockingbird', 'Harper Lee'),
    ('9781234567892', '1984', 'George Orwell'),
    ('9781234567893', 'Pride and Prejudice', 'Jane Austen'),
    ('9781234567894', 'The Catcher in the Rye', 'J.D. Salinger'),
    ('9781234567895', 'Lord of the Flies', 'William Golding'),
    ('9781234567896', 'Animal Farm', 'George Orwell'),
    ('9781234567897', 'Brave New World', 'Aldous Huxley');

-- Insert sample loans
-- Note: Make sure the user IDs and book ISBNs exist before running this
-- User IDs should be 1, 2, 3, 4 (assuming the users were inserted in order)
INSERT INTO loans ("userId", "bookId", "leaseDate", "returnDate") VALUES
    (1, '9781234567890', '2025-01-01', '2025-01-15'),
    (1, '9781234567891', '2025-01-10', '2025-01-25'),
    (2, '9781234567892', '2025-01-05', '2025-01-20'),
    (2, '9781234567893', '2025-01-15', '2025-02-01'),
    (3, '9781234567894', '2025-01-20', '2025-02-05'),
    (3, '9781234567890', '2025-02-01', '2025-02-15'),
    (4, '9781234567895', '2025-01-12', '2025-01-27'),
    (4, '9781234567896', '2025-02-01', '2025-02-16');

