# Setup & Phase 1 Guide

## Prerequisites

Make sure you have both installed before starting:
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Beekeeper Studio](https://www.beekeeperstudio.io/)

---

## Part 1 — Start the Postgres Server

**1. Open a terminal and navigate to the project root:**

```bash
cd path/to/postgreSQL-fundamentals
```

**2. Start the Postgres container:**

```bash
docker compose up -d
```

The `-d` flag runs it in the background. You should see:
```
✔ Container pg_fundamentals  Started
```

**3. Verify it's running:**

```bash
docker ps
```

You should see `pg_fundamentals` in the list with status `Up`.

> To stop the server later: `docker compose down`
> Your data is preserved in the Docker volume — stopping the container doesn't delete anything.

---

## Part 2 — Connect Beekeeper Studio

**1. Open Beekeeper Studio**

**2. Click "New Connection"**

**3. Select "PostgreSQL" as the connection type**

**4. Fill in the connection details:**

| Field | Value |
|---|---|
| Host | `localhost` |
| Port | `5432` |
| User | `admin` |
| Password | `password` |
| Database | `postgres` |

**5. Click "Test Connection"** — you should see a green success message.

**6. Click "Save" and then "Connect"**

> You'll start connected to the `postgres` database. This is the admin database — you won't run your learning queries here. You'll switch to `learn_library` after the next step.

---

## Part 3 — Run the Phase 1 SQL Files

### Step 1 — Create the database and tables

**1.** In Beekeeper Studio, open `phase1/01_schema.sql`

**2.** You'll see this at the top:
```sql
CREATE DATABASE learn_library;
```

**3.** Select **only** the `CREATE DATABASE learn_library;` line and run it.

> In Beekeeper Studio: highlight the line → press `Ctrl+Enter` (Windows/Linux) or `Cmd+Enter` (Mac) to run just the selection.

**4.** Now switch your connection to `learn_library`:
- Click the database name in the top bar (it shows `postgres`)
- Select `learn_library` from the dropdown

**5.** Select all the remaining `CREATE TABLE` statements in `01_schema.sql` and run them.

**6.** Verify tables were created: in the left sidebar, expand `learn_library` → `Tables`. You should see:
```
books
checkouts
members
```

---

### Step 2 — Load the seed data

**1.** Open `phase1/02_seed.sql`

**2.** Select all (`Ctrl+A` / `Cmd+A`) and run (`Ctrl+Enter` / `Cmd+Enter`)

**3.** Verify data was inserted by running:
```sql
SELECT * FROM books;
```

You should see 10 rows.

---

### Step 3 — Run the exercises

**1.** Open `phase1/03_exercises.sql`

**2.** Work through it **one section at a time** — don't run the whole file at once.

**How to run a single query in Beekeeper Studio:**
- Place your cursor anywhere inside a query
- Press `Ctrl+Enter` / `Cmd+Enter` to run just that query
- Or highlight a block of lines and run the selection

---

## Part 4 — Tips for Using Beekeeper Studio

### Running queries

| Action | Shortcut |
|---|---|
| Run current query | `Ctrl+Enter` / `Cmd+Enter` |
| Run selected text | Highlight → `Ctrl+Enter` / `Cmd+Enter` |
| Format/prettify SQL | `Ctrl+Shift+F` / `Cmd+Shift+F` |
| New query tab | `Ctrl+T` / `Cmd+T` |

### Browsing your schema

- Left sidebar → expand `learn_library` → `Tables` → click any table to see its columns and data
- Right-click a table → "View Data" to browse rows without writing a query

### Switching databases

- Click the database name in the connection bar at the top
- Switch between `postgres` and `learn_library` as needed
- Always be on `learn_library` when running Phase 1 queries

### Saving your own queries

- Use `Ctrl+S` / `Cmd+S` to save a query tab — Beekeeper saves it locally
- Useful for saving your boss challenge attempts

---

## Part 5 — Reset or Teardown

### Reset (keep the DB, clear the data)

Run this while connected to `learn_library`:

```sql
TRUNCATE checkouts, members, books RESTART IDENTITY CASCADE;
```

Then re-run `02_seed.sql` to reload the data.

### Full teardown (drop the database)

**1.** Switch your Beekeeper connection back to `postgres`
   (you can't drop a database you're currently connected to)

**2.** Open and run `phase1/04_teardown.sql`:
```sql
DROP DATABASE IF EXISTS learn_library;
```

**3.** To start fresh: reconnect to `postgres`, then re-run `01_schema.sql` from the top.

---

## Part 6 — Moving to Phase 2

When you're done with Phase 1:

- `learn_library` can stay alive — you don't need to drop it
- Start Phase 2 by running `phase2/01_schema.sql` (creates `learn_hr`)
- Add a new connection in Beekeeper pointing to `learn_hr`, or just switch the database in your existing connection

Both `learn_library` and `learn_hr` will coexist in the same Docker container with no issues.
