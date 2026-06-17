# PakMart Retail Analysis
A self-built SQL + Tableau project simulating a Pakistani retail chain (PakMart) with realistic product categories, customer names, store locations, and promotional events — built entirely from scratch by M. Ammar.

Note: Sales data is randomly generated via a stored procedure (pakmart_sales.sql) and does not reflect real business insights. All other data (products, customers, stores, promotions) uses realistic Pakistani names and locations.


## Dashboard
![Dashboard](PakMart_Retail_Dashboard.png)

Live Dashboard: [View on Tableau Public](https://public.tableau.com/app/profile/muhammad.ammar.saleem/viz/PakMartRetailAnalytics/PakMartRetailAnalytics)

## Database Schema
![ER Diagram 1](PakMart_Retail_ER1.png)
![ER Diagram 2](PakMart_Retail_ER2.png)

## Business Questions & SQL Analysis
| # | Business Question | Technique Used |
|---|---|---|
| 1 | What is the total revenue per promotion? | GROUP BY, SUM |
| 2 | What is the revenue per product category? | JOIN, GROUP BY |
| 3 | Which product ranks highest in each category? | Window Function — RANK() |
| 4 | What is the revenue by city during promotions? | Multi-table JOIN, CASE |
| 5 | What is the monthly revenue trend? | DATE functions, GROUP BY |
| 6 | What is the month-over-month revenue change? | Window Function — LAG() |
| 7 | Which store ranks highest per city? | Window Function — DENSE_RANK() |
| 8 | How does revenue compare: promotion vs non-promotion? | CASE, GROUP BY |
| 9 | Who are the top 5 customers by spending? | ROUND(), ORDER BY, LIMIT |

## Data Generation
- Products, stores, promotions inserted manually via `PakMart_Retail_Schema&Queries.sql`
- 1000 customers imported via `customer.csv`
- 7000 sales rows generated using a stored procedure (`pakmart_sales.sql`) which auto-assigns promotions based on Pakistani calendar events and calculates real prices from category tables

---

## Built By
**M. Ammar** — BSCS Data Science, KSBL Karachi  
[GitHub](https://github.com/m2ammar) • [Tableau Public](https://public.tableau.com/app/profile/muhammad.ammar.saleem/vizzes) • [LinkedIn](https://linkedin.com/in/muhammad-ammar-b533a0323/)
