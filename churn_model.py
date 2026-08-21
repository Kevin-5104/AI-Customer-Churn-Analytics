
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score, precision_score, recall_score, f1_score, confusion_matrix

df = pd.read_csv("data/processed/telco_churn_clean.csv")
target = "ChurnFlag"
drop_cols = ["customerID","Churn","ChurnFlag","TenureGroup","MonthlyRevenue","AnnualizedMonthlyRevenue"]
X = df.drop(columns=drop_cols)
y = df[target]

num_cols = X.select_dtypes(include=["int64","float64"]).columns.tolist()
cat_cols = X.select_dtypes(include=["object"]).columns.tolist()

pre = ColumnTransformer([
 ("num", Pipeline([("imputer",SimpleImputer(strategy="median")),
                   ("scaler",StandardScaler())]), num_cols),
 ("cat", Pipeline([("imputer",SimpleImputer(strategy="most_frequent")),
                   ("onehot",OneHotEncoder(handle_unknown="ignore"))]), cat_cols)
])
pipe = Pipeline([("preprocessor",pre),
                 ("model",LogisticRegression(max_iter=1000,class_weight="balanced",random_state=42))])

Xtr,Xte,ytr,yte=train_test_split(X,y,test_size=.2,stratify=y,random_state=42)
pipe.fit(Xtr,ytr)
p=pipe.predict_proba(Xte)[:,1]
pred=(p>=.5).astype(int)

metrics = {
 "ROC_AUC":roc_auc_score(yte,p),
 "Precision":precision_score(yte,p),
 "Recall":recall_score(yte,p),
 "F1":f1_score(yte,p)
}
print(metrics)
print(confusion_matrix(yte,p))

df["ChurnProbability"]=pipe.predict_proba(df.drop(columns=drop_cols))[:,1]
df["RiskSegment"]=pd.cut(df["ChurnProbability"],[-.01,.30,.60,1],
                         labels=["Low Risk","Medium Risk","High Risk"])
df.to_csv("data/processed/telco_churn_scored.csv",index=False)
pd.DataFrame([metrics]).to_csv("docs/model_metrics.csv",index=False)
