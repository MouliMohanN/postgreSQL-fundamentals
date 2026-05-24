-- Phase 1 | Seed data
-- Database: learn_library
-- Run this after 01_schema.sql, connected to learn_library.

INSERT INTO books (title, author, genre, published_year, total_copies, available_copies) VALUES
    ('The Pragmatic Programmer',  'Andrew Hunt',         'Technology',  1999, 3, 2),
    ('Clean Code',                'Robert C. Martin',    'Technology',  2008, 2, 0),
    ('Dune',                      'Frank Herbert',       'Sci-Fi',      1965, 4, 4),
    ('1984',                      'George Orwell',       'Dystopian',   1949, 5, 3),
    ('Sapiens',                   'Yuval Noah Harari',   'Non-Fiction', 2011, 3, 1),
    ('The Alchemist',             'Paulo Coelho',        'Fiction',     1988, 2, 2),
    ('Thinking, Fast and Slow',   'Daniel Kahneman',     'Psychology',  2011, 2, 2),
    ('Deep Work',                 'Cal Newport',         'Non-Fiction', 2016, 1, 1),
    ('Refactoring',               'Martin Fowler',       'Technology',  1999, 2, 2),
    ('Meditations',               'Marcus Aurelius',     NULL,          180,  3, 3);

INSERT INTO members (name, email, joined_at, is_active) VALUES
    ('Alice Johnson',   'alice@example.com',   '2023-01-15', TRUE),
    ('Bob Smith',       'bob@example.com',     '2023-03-22', TRUE),
    ('Carol White',     'carol@example.com',   '2022-11-05', TRUE),
    ('David Brown',     'david@example.com',   '2024-02-10', FALSE),
    ('Eva Martinez',    'eva@example.com',     '2023-07-30', TRUE),
    ('Frank Lee',       'frank@example.com',   '2022-06-18', FALSE),
    ('Grace Kim',       'grace@example.com',   '2024-01-01', TRUE),
    ('Henry Davis',     'henry@example.com',   '2023-09-14', TRUE);

INSERT INTO checkouts (book_id, member_id, checked_out_at, due_date, returned_at) VALUES
    -- returned
    (1, 1, '2024-01-10 09:00:00', '2024-01-24', '2024-01-20 14:00:00'),
    (3, 2, '2024-01-12 10:30:00', '2024-01-26', '2024-01-25 11:00:00'),
    (4, 1, '2024-02-01 08:00:00', '2024-02-15', '2024-02-14 16:00:00'),
    (5, 3, '2024-02-05 13:00:00', '2024-02-19', '2024-02-18 10:00:00'),
    (7, 5, '2024-02-10 15:00:00', '2024-02-24', '2024-02-22 09:00:00'),
    -- currently checked out (returned_at is NULL)
    (2, 1, '2024-03-01 09:00:00', '2024-03-15', NULL),
    (2, 5, '2024-03-05 11:00:00', '2024-03-19', NULL),
    (4, 7, '2024-03-10 14:00:00', '2024-03-24', NULL),
    (5, 2, '2024-03-12 10:00:00', '2024-03-26', NULL),
    -- overdue (due_date in the past, not returned)
    (1, 8, '2024-02-20 09:00:00', '2024-03-05', NULL),
    (4, 3, '2024-02-22 11:00:00', '2024-03-07', NULL);
