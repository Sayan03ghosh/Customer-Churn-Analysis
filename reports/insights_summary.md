# Customer Churn Insights Summary

## Executive Summary
This report analyzes customer churn behavior using the `clean_telco_churn` dataset (`7,043` customers). Churn is concentrated in early-tenure, month-to-month customers and segments exposed to stronger competitive offers. Estimated revenue associated with churned customers is substantial, making early retention and contract conversion the highest-impact strategy.

## Data Scope
- Dataset: `notebooks/clean_telco_churn.csv`
- Total customers: `7,043`
- Churned customers: `1,869`
- Overall churn rate: `26.54%`

## Key Findings
1. Tenure is a strong churn predictor.
- Average tenure (churned): `17.98` months
- Average tenure (non-churned): `37.59` months
- Churn rate by tenure band:
  - `0-6` months: `53.33%`
  - `7-12` months: `35.34%`
  - `13-24` months: `28.71%`
  - `25-36` months: `21.63%`
  - `37-60` months: `16.62%`
  - `61+` months: `6.61%`

2. Contract type has the largest structural impact.
- Month-to-Month: `45.84%` churn
- One Year: `10.71%` churn
- Two Year: `2.55%` churn

3. Payment behavior is linked to churn risk.
- Mailed Check: `36.88%`
- Bank Withdrawal: `34.00%`
- Credit Card: `14.48%`

4. Internet segment differences indicate competitive pressure.
- Fiber Optic: `40.72%` churn (highest)
- Cable: `25.66%`
- DSL: `18.58%`
- No Internet: `7.40%`

5. Churn reasons are heavily competitor-driven.
- Top churn category: `Competitor` (`841` cases)
- Most common reasons:
  - Competitor had better devices (`313`)
  - Competitor made better offer (`311`)
  - Attitude of support person (`220`)

6. Revenue impact is material.
- Total revenue linked to churned customers: `3,684,459.82`
- Average revenue per churned customer: `1,971.35`

## Strategic Recommendations
1. Launch a first-180-day retention playbook.
- Onboarding milestones, proactive outreach, and targeted support during months `0-6`.

2. Convert Month-to-Month to fixed-term contracts.
- Offer annual-plan discounts, loyalty credits, and bundle incentives for high-risk cohorts.

3. Defend Fiber Optic base against competitor switching.
- Speed/value bundles, device-upgrade offers, and region-specific competitive campaigns.

4. Reduce service-friction churn.
- Improve frontline support quality and escalation handling for attitude/service complaints.

5. Prioritize risk-based interventions.
- Rank customers by low tenure + high churn score + low satisfaction for outbound retention actions.

6. Optimize payment-method mix.
- Promote lower-risk methods (such as card autopay) through incentives and messaging.

## Dashboard Alignment (Power BI)
Recommended dashboard pages:
1. KPI Overview (churn rate, churn count, revenue at risk)
2. Segmentation (contract, payment method, internet type)
3. Lifecycle Risk (tenure-band churn)
4. Churn Drivers (category and reason)

Recommended slicers:
- Contract
- Internet Type
- Payment Method
- Offer
- State/City

## Conclusion
Churn is not evenly distributed; it is concentrated in identifiable segments where targeted action is feasible. The strongest immediate gains should come from early-lifecycle retention and Month-to-Month conversion, supported by competitor-defense and service-quality improvements.
