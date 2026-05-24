# PostgreSQL Learning Plan

## Context

Frontend dev going full-stack. Goal is skill-building, not shipping a specific product.
Bootcamp pace: 15+ hrs/week. Full roadmap: ~16 weeks, ~240 hrs.

---

## Decisions

| Decision | Choice | Reason |
|---|---|---|
| Local setup | Docker Desktop | Clean, no native install, easy to nuke/recreate per concept |
| IDE | Beekeeper Studio | GUI client for running SQL and browsing schema |
| Learning approach | Themed mini-databases per concept | Isolated, fast to set up, scenario motivates the query |
| DB naming | `learn_{db}` prefix (e.g. `learn_library`) | Avoids collision with real/system DBs; simple and readable |
| DB lifecycle | Create → learn → optionally drop | Teardown is a choice, not a requirement; multiple DBs can coexist |
| Project thread | None (skill-building) | Focus on concepts, not maintaining a growing codebase |
| SQL-first | Raw SQL only — no code | No API, no ORM, no backend integration |
| Out of scope | Phases 5 & 7 | API integration and DevOps are not part of this learning goal |

---

## Learning Approach

Each concept gets a **themed mini-database**:
- Schema that makes sense for the concept
- Pre-loaded seed data (no staring at empty tables)
- Focused exercises that target exactly what's being learned
- One "boss challenge" query to tie it together

---

## Roadmap

### Phase 1 — Foundations (~2 weeks, ~30 hrs)
*Goal: Think in tables, not objects*

| Topic | Sample DB | Status |
|---|---|---|
| Relational model, psql CLI | `learn_library` (books, members, checkouts) | |
| Data types | `learn_library` | |
| CRUD | `learn_library` | |
| Filtering, sorting, nulls | `learn_library` | |
| Basic functions (COUNT, SUM, AVG, COALESCE) | `learn_library` | |

**Milestone:** Build a `users + posts` schema from scratch and query it via Beekeeper Studio.

---

### Phase 2 — Relational Thinking & Schema Design (~2 weeks, ~30 hrs)
*Goal: Design schemas that won't embarrass you in code review*

| Topic | Sample DB | Status |
|---|---|---|
| Primary & foreign keys | `learn_hr` (employees, departments) | |
| JOIN types | `learn_hr` | |
| Normalization (1NF → 3NF) | `learn_hr` | |
| Constraints | `learn_hr` | |
| Sequences, serials, UUID strategies | `learn_hr` | |
| GROUP BY + HAVING | `learn_ecommerce` (orders, products) | |

**Milestone:** Design a full e-commerce schema with proper relationships.

---

### Phase 3 — Intermediate SQL & Postgres Power Features (~3 weeks, ~45 hrs)
*Goal: Write SQL that senior devs respect*

| Topic | Sample DB | Status |
|---|---|---|
| Subqueries & CTEs | `learn_ecommerce` | |
| Window functions (ROW_NUMBER, RANK, LAG, LEAD) | `learn_ecommerce` | |
| JSONB deep dive | `learn_products` (semi-structured catalog) | |
| Full-text search | `learn_jobs_board` (listings, search) | |
| Transactions | `learn_bank` (accounts, transfers) | |
| Views (regular vs materialized) | `learn_analytics` | |
| Stored procedures & triggers | `learn_bank` | |

**Milestone:** Build a reporting query system — leaderboard, activity feed, search — all in SQL.

---

### Phase 4 — Performance & Indexing (~2 weeks, ~30 hrs)
*Goal: Make slow queries fast*

| Topic | Sample DB | Status |
|---|---|---|
| EXPLAIN / EXPLAIN ANALYZE | `learn_analytics` (event logs) | |
| Index types (B-Tree, GIN, GiST, BRIN, Hash) | `learn_analytics` | |
| Composite & partial indexes | `learn_analytics` | |
| Query optimization, N+1 patterns | `learn_analytics` | |
| Connection pooling (PgBouncer) | `learn_analytics` | |
| Vacuuming & bloat | `learn_analytics` | |
| Partitioning | `learn_analytics` | |

**Milestone:** Take a slow query (>2s), profile it, get it under 50ms.

---

### Phase 5 — API Backend Integration ⛔ NOT IN PLAN
*Skipped — out of scope. Pure SQL focus only.*

| Topic | Sample DB | Status |
|---|---|---|
| ORMs vs raw SQL (Prisma, Drizzle) | `saas` | |
| Node.js + pg / postgres.js | `saas` | |
| Migration strategies | `saas` | |
| REST pagination (cursor-based) | `saas` | |
| Row-level security (RLS) | `saas` (multi-tenant) | |
| Optimistic locking | `saas` | |

**Milestone:** Fully functional REST API backed by Postgres with migrations.

---

### Phase 6 — Advanced Architecture & Scaling (~3 weeks, ~45 hrs)
*Goal: Design systems that survive traffic*

| Topic | Sample DB | Status |
|---|---|---|
| Replication (primary/replica) | | |
| Read replicas | | |
| High availability (Patroni) | | |
| Event sourcing (LISTEN/NOTIFY, CDC) | | |
| pg_cron, audit logging | | |

---

### Phase 7 — DevOps & Cloud Deployment ⛔ NOT IN PLAN
*Skipped — out of scope. Pure SQL focus only.*

| Topic | Notes | Status |
|---|---|---|
| Docker + Postgres | Local dev, docker-compose | |
| Managed services (RDS, Neon, Supabase, Railway) | | |
| Backup strategies (pg_dump, WAL, PITR) | | |
| Monitoring (pg_stat_statements, Grafana) | | |
| Security hardening (roles, SSL, pg_hba.conf) | | |
| CI/CD with zero-downtime migrations | | |

**Milestone:** Deploy a Postgres-backed API with automated backups, monitoring, and a migration pipeline.

---

## Timeline

| Phase | Weeks | Hours |
|---|---|---|
| 1. Foundations | 1–2 | 30 |
| 2. Relational Design | 3–4 | 30 |
| 3. Intermediate SQL | 5–7 | 45 |
| 4. Performance | 8–9 | 30 |
| 5. API Integration | ⛔ skipped | — |
| 6. Architecture | 10–12 | 45 |
| 7. DevOps & Cloud | ⛔ skipped | — |
| **Total** | **~12 weeks** | **~180 hrs** |

---

## Tools to Install

- [x] Docker Desktop — run Postgres locally in a container
- [x] Beekeeper Studio — GUI client for running SQL and browsing schema
- [ ] psql — CLI (optional, useful for scripting)
- [ ] Neon.tech — free serverless Postgres for cloud experiments
