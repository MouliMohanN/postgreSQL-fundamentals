# PostgreSQL Fundamentals

A personal learning repo for PostgreSQL — raw SQL only, no ORMs, no backend code.

## Stack

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) — runs Postgres locally
- [Beekeeper Studio](https://www.beekeeperstudio.io/) — SQL IDE
- [PostgreSQL 16](https://www.postgresql.org/docs/16/index.html)

## Structure

```
docs/           learning plan + setup guide
phase1/         Foundations — learn_library DB
phase2/         Relational Design — learn_hr, learn_ecommerce DBs
phase3/         Intermediate SQL — learn_bank, learn_analytics DBs
phase4/         Performance & Indexing — learn_analytics DB
phase6/         Advanced Architecture
```

Each phase folder contains:
- `01_schema.sql` — create database + tables
- `02_seed.sql` — insert sample data
- `03_exercises.sql` — guided exercises + boss challenge
- `04_teardown.sql` — drop the database (optional)

## Getting Started

See [docs/01_setup_and_phase1_guide.md](docs/01_setup_and_phase1_guide.md) for the full step-by-step setup.

Quick start:
```bash
docker compose up -d
```

Then open Beekeeper Studio, connect to `localhost:5432`, and run the files in `phase1/` in order.

## Learning Plan

See [docs/00_learning_plan.md](docs/00_learning_plan.md) for the full roadmap (~12 weeks, ~180 hrs).

## Resources

- [PostgreSQL 16 Docs](https://www.postgresql.org/docs/16/index.html)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [Use The Index, Luke](https://use-the-index-luke.com/) — indexing and query performance
- [SQL Style Guide](https://www.sqlstyle.guide/) — consistent SQL formatting
