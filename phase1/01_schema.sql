-- Phase 1 | Foundations
-- Database: learn_library
-- Tables: books, members, checkouts

CREATE DATABASE learn_library;

-- NOTE: After running this file, switch your Beekeeper connection to learn_library,
-- then run 02_seed.sql and 03_exercises.sql.

\c learn_library

CREATE TABLE IF NOT EXISTS books (
    id               SERIAL PRIMARY KEY,
    title            VARCHAR(255) NOT NULL,
    author           VARCHAR(255) NOT NULL,
    genre            VARCHAR(100),
    published_year   INTEGER,
    total_copies     INTEGER NOT NULL DEFAULT 1,
    available_copies INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE IF NOT EXISTS members (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(255) NOT NULL,
    email       VARCHAR(255) UNIQUE NOT NULL,
    joined_at   DATE NOT NULL DEFAULT CURRENT_DATE,
    is_active   BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS checkouts (
    id             SERIAL PRIMARY KEY,
    book_id        INTEGER NOT NULL REFERENCES books(id),
    member_id      INTEGER NOT NULL REFERENCES members(id),
    checked_out_at TIMESTAMP NOT NULL DEFAULT NOW(),
    due_date       DATE NOT NULL,
    returned_at    TIMESTAMP
);
