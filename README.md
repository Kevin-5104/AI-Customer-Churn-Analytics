# AI Customer Churn Analytics

An end-to-end customer churn analytics project using **SQL, Python, Logistic Regression, and Power BI** to identify churn patterns, predict customer churn risk, and support retention decisions.

## 🎯 Objective

The objective of this project is to:

- Analyze customer churn patterns
- Identify major churn drivers
- Estimate customer churn probability
- Segment customers into Low, Medium, and High Risk
- Identify revenue exposure
- Support customer retention decisions through an interactive dashboard

## 🛠️ Tech Stack

- **Python** — Data preprocessing and Machine Learning
- **SQL / SQLite** — Business analysis
- **Scikit-learn** — Logistic Regression
- **Power BI** — Interactive dashboards
- **Excel** — Data preparation and analysis

## 🔄 Project Workflow

Customer Data
      ↓
Data Cleaning
      ↓
SQL Business Analysis
      ↓
Python Preprocessing
      ↓
Logistic Regression
      ↓
Churn Probability
      ↓
Risk Segmentation
      ↓
Power BI Dashboard
      ↓
Retention Strategy

🤖 Machine Learning

A Logistic Regression model was used for binary churn classification.

The preprocessing pipeline includes:

Missing-value handling
Numerical feature scaling
Categorical feature encoding
Stratified train-test split
Class balancing
Logistic Regression

The model generates a churn probability for each customer.

Risk Segmentation
Risk Segment	Churn Probability
Low Risk	≤ 30%
Medium Risk	>30% to 60%
High Risk	>60%
📊 Model Performance
Metric	Score
Accuracy	73.81%
ROC-AUC	84.13%
Precision	50.43%
Recall	78.34%
F1 Score	61.36%
Confusion Matrix
                 Predicted
                 No    Yes


Actual No       747   288
Actual Yes       81   293

The model achieved 78.34% recall, which is useful in a retention scenario because identifying a larger proportion of actual churners can help prioritize customers for retention actions.

🗄️ SQL Analysis

SQL was used to answer business questions including:

Overall customer churn rate
Churn by contract type
Churn by internet service
Churn by tenure group
Churn by payment method
Monthly charge comparison
Revenue impact of churn
Retention-priority customers
📈 Power BI Dashboard

The Power BI dashboard contains three main sections:

1. Executive Churn Overview
Total customers
Churned customers
Churn rate
Revenue at risk
Churn by contract
Churn by internet service
Churn by tenure
2. Customer Risk Analysis
Customer risk segmentation
High-risk customer count
Churn probability
Customer-level risk information
Contract and service filters
3. Retention Strategy
High-risk customers
Revenue at risk
Average churn probability
Revenue at risk by customer value tier
Customers requiring retention attention
💡 Business Value

The project combines:

Descriptive Analytics + Predictive Analytics + Business Visualization

This allows a retention team to identify high-risk customers and prioritize customers based on both churn probability and financial value.

⚠️ Limitations
The model is based on historical customer data.
Churn probability represents risk, not certainty.
The analysis does not establish causal relationships.
Retention actions should be validated through controlled experiments.
🚀 Future Improvements
Compare Logistic Regression with tree-based models
Hyperparameter tuning
Cross-validation
Optimize the probability threshold based on retention cost
Model monitoring and drift detection
Test retention campaigns using A/B experiments
📁 Project Files
AI-Customer-Churn-Analytics/
│
├── README.md
├── AI_Customer_Churn_Analytics.pbix
├── churn_analysis.sql
├── churn_model.py
├── telco_churn_clean.csv
└── telco_churn_scored.csv
📌 Key Takeaway

This project demonstrates an end-to-end analytics workflow where SQL is used for business analysis,
Python and Logistic Regression are used for predictive modeling, and Power BI is used to communicate actionable customer retention insights.
