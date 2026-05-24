-- Phase 1 Exercises | learn_library
-- Run these one section at a time in Beekeeper Studio.
-- Try writing the query yourself before looking at the answer.

-- ============================================================
-- TOPIC 1: Relational Model
-- ============================================================
-- The learn_library DB has 3 tables:
--   books      → stores book info
--   members    → stores library card holders
--   checkouts  → links a member to a book (the JOIN table)
--
-- books and members don't know about each other directly.
-- checkouts.book_id references books.id
-- checkouts.member_id references members.id

-- Q: List all three tables to see what's in them.
SELECT * FROM books;
SELECT * FROM members;
SELECT * FROM checkouts;


-- ============================================================
-- TOPIC 2: Data Types
-- ============================================================
-- Notice the column types used in the schema:
--   SERIAL          → auto-incrementing integer (shorthand for INTEGER + SEQUENCE)
--   VARCHAR(n)      → variable-length string with a max length
--   INTEGER         → whole number
--   BOOLEAN         → true / false
--   DATE            → date only (no time)
--   TIMESTAMP       → date + time
--   NULL            → the absence of a value (Meditations has no genre)

-- Q: Which books have no genre set?
SELECT title, author FROM books WHERE genre IS NULL;

-- Q: What is the data type difference between checked_out_at and due_date?
--    checked_out_at is TIMESTAMP (date + time), due_date is DATE (date only).
--    Run this to see the difference:
SELECT title, checked_out_at, due_date FROM checkouts JOIN books ON books.id = checkouts.book_id LIMIT 3;


-- ============================================================
-- TOPIC 3: CRUD
-- ============================================================

-- CREATE (INSERT)
-- Add a new book:
INSERT INTO books (title, author, genre, published_year, total_copies, available_copies)
VALUES ('The Design of Everyday Things', 'Don Norman', 'Non-Fiction', 1988, 2, 2);

-- Add a new member:
INSERT INTO members (name, email, joined_at)
VALUES ('Test User', 'test@example.com', CURRENT_DATE);

-- READ (SELECT)
-- See the new book:
SELECT * FROM books WHERE title = 'The Design of Everyday Things';

-- UPDATE
-- Mark the new member as inactive:
UPDATE members SET is_active = FALSE WHERE email = 'test@example.com';

-- Verify:
SELECT name, is_active FROM members WHERE email = 'test@example.com';

-- DELETE
-- Remove the test member (only works if they have no checkouts):
DELETE FROM members WHERE email = 'test@example.com';


-- ============================================================
-- TOPIC 4: Filtering, Sorting, NULLs
-- ============================================================

-- Basic WHERE filter
-- Q: Find all Technology books.
SELECT title, author FROM books WHERE genre = 'Technology';

-- Compound conditions
-- Q: Find books published after 2000 that have more than 1 copy available.
SELECT title, published_year, available_copies FROM books
WHERE published_year > 2000 AND available_copies > 1;

-- NULL handling
-- Q: Find all checkouts that have NOT been returned yet.
SELECT * FROM checkouts WHERE returned_at IS NULL;

-- Q: Find checkouts that HAVE been returned.
SELECT * FROM checkouts WHERE returned_at IS NOT NULL;

-- COALESCE — replace NULL with a fallback value
-- Q: Show each book's genre, replacing NULL with 'Unknown'.
SELECT title, COALESCE(genre, 'Unknown') AS genre FROM books;

-- Sorting
-- Q: List all books sorted by published year, oldest first.
SELECT title, published_year FROM books ORDER BY published_year ASC;

-- Q: List members who joined most recently first.
SELECT name, joined_at FROM members ORDER BY joined_at DESC;

-- LIMIT
-- Q: Get the 3 most recently joined members.
SELECT name, joined_at FROM members ORDER BY joined_at DESC LIMIT 3;


-- ============================================================
-- TOPIC 5: Basic Aggregate Functions
-- ============================================================

-- COUNT
-- Q: How many books are in the library?
SELECT COUNT(*) AS total_books FROM books;

-- Q: How many books have a genre set?
SELECT COUNT(genre) AS books_with_genre FROM books;
-- COUNT(column) skips NULLs — compare to COUNT(*) above.

-- SUM
-- Q: What is the total number of copies across all books?
SELECT SUM(total_copies) AS total_copies FROM books;

-- AVG
-- Q: What is the average number of available copies per book?
SELECT ROUND(AVG(available_copies), 2) AS avg_available FROM books;

-- GROUP BY
-- Q: How many books does each genre have?
SELECT genre, COUNT(*) AS book_count FROM books GROUP BY genre;

-- Q: How many checkouts does each member have?
SELECT member_id, COUNT(*) AS checkout_count FROM checkouts GROUP BY member_id;

-- HAVING (filter on aggregated result)
-- Q: Which genres have more than 1 book?
SELECT genre, COUNT(*) AS book_count FROM books
GROUP BY genre
HAVING COUNT(*) > 1;


-- ============================================================
-- BOSS CHALLENGE
-- ============================================================
-- Combine everything from Phase 1 in a single query.
--
-- Goal: Find all active members who currently have a book checked out,
--       show the book title, member name, due date,
--       and replace any missing genre with 'Unknown'.
--       Sort by due date ascending.

SELECT
    m.name          AS member_name,
    b.title         AS book_title,
    COALESCE(b.genre, 'Unknown') AS genre,
    c.due_date
FROM checkouts c
JOIN books   b ON b.id = c.book_id
JOIN members m ON m.id = c.member_id
WHERE c.returned_at IS NULL
  AND m.is_active = TRUE
ORDER BY c.due_date ASC;
