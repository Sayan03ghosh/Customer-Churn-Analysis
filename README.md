# Customer Churn Analysis & Retention Strategy Dashboard

## 1. Problem Statement
Telecom customer churn reduces recurring revenue and increases acquisition cost.  
This project identifies churn patterns, compares churn vs non-churn customer features (tenure, usage, complaints), and provides business actions through a Power BI dashboard.

## 2. Dataset Source
- Source file: `data/Telco Customer Churn Dataset.csv`
- Cleaned analysis file: `notebooks/clean_telco_churn.csv`
- Total records: `7,043`
- Total features: `49`

## 3. Tools & Skills Used
- SQL (SSMS): segmentation and churn KPI queries
- Python (`pandas`, `numpy`, `matplotlib`): cleaning, EDA, feature comparison
- Power BI: interactive churn dashboard

## 4. Project Structure
- `data/` raw dataset
- `notebooks/` analysis notebooks + cleaned data
- `sql/` analysis queries
- `powerbi/` dashboard file (`.pbix`)
- `reports/` summary report

## 5. Data Cleaning Steps
Performed in notebook workflow before dashboarding:
1. Standardized column names and string values (trim/format).
2. Checked missing values and data types.
3. Converted numeric columns such as tenure, charges, revenue, and churn score.
4. Removed duplicates.
5. Created binary churn flag for modeling/aggregation:
   - `is_churn = 1` if `Churn Label = Yes`, else `0`.
6. Validated category values for contract, payment method, internet type, churn category, churn reason.

## 6. Analysis Tasks Covered
1. Identify churn patterns.
2. Feature comparison:
   - Tenure
   - Usage/revenue metrics
   - Complaint/experience signals (churn reasons/categories)
3. Create dashboard for retention decisions.

## 7. Key Insights (Evidence-based)
From the cleaned table (`clean_telco_churn`):

1. Overall churn rate is `26.54%` (`1,869` churned out of `7,043`).
2. Churned customers have much shorter relationship length:
   - Avg tenure (churned): `17.98` months
   - Avg tenure (non-churned): `37.59` months
3. Churn risk is highest early in lifecycle:
   - `0-6` months churn rate: `53.33%`
   - `61+` months churn rate: `6.61%`
4. Contract type is a major churn driver:
   - `Month-to-Month`: `45.84%`
   - `One Year`: `10.71%`
   - `Two Year`: `2.55%`
5. Payment method risk differs significantly:
   - `Mailed Check`: `36.88%`
   - `Bank Withdrawal`: `34.00%`
   - `Credit Card`: `14.48%`
6. Product/usage context:
   - `Fiber Optic` customers show high churn (`40.72%`), indicating potential quality/value competition risk.
7. Complaint/competitive churn is dominant:
   - Top churn category: `Competitor`
   - Frequent reasons: better devices, better offer, higher speeds.
8. Revenue impact:
   - Estimated revenue from churned customers: `3,684,459.82`
   - Avg revenue per churned customer: `1,971.35`

## 8. Business Recommendations
1. Build first-6-month retention program:
   - onboarding check-ins, usage nudges, proactive support.
2. Convert month-to-month customers to annual plans via targeted discounts.
3. Create competitor defense offers for Fiber Optic segment:
   - speed/price bundles, loyalty upgrades.
4. Improve support quality and complaint resolution (attitude/service issues).
5. Prioritize high-risk cohorts:
   - low satisfaction score
   - high churn score
   - low tenure.
6. Payment migration campaigns:
   - encourage movement away from high-churn payment methods.

## 9. Power BI Dashboard
Dashboard file: `powerbi/churn_dashboard.pbix`

Suggested report pages:
1. KPI Overview (churn rate, churned customers, revenue lost).
2. Churn Segments (contract, internet type, payment method).
3. Feature Comparison (tenure, usage, satisfaction).
4. Churn Reasons & Category Analysis.

Recommended slicers:
- Contract
- Internet Type
- Offer
- Payment Method
- State/City

## 10. SQL Analysis
Main query file: `sql/churn_queries.sql`  
Includes:
- Churn KPI
- Contract/payment/internet churn breakdowns
- Tenure-band churn analysis
- Satisfaction impact
- Revenue lost
- Churn reason/category ranking



## 11. How to Run
1. Import cleaned CSV into SQL Server table `clean_telco_churn`.
2. Execute `sql/churn_queries.sql` in SSMS.
3. Run notebook analysis in `notebooks/churn_feature_analysis.ipynb`.

