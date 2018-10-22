
# ORIE 4741 Project Proposal: NASDAQ 100 Prediction

## Backgound:
The NASDAQ 100 is a index in stock market, which consist of 100 equity securities from the 100 of the largest financial companies.
The NASDAQ 100 is a modified capitalization-weighted index, which means the stocks' weight in the index depends on the market capitalization.
The index is based on the exchange, and not limited to the US-based companies.
And also, the NASDAQ 100 doesn't include financial companies, which is the main deffirence with S&P 500.
So, the NASDAQ 100 is a good barometer for stock market and financial market, and it is why we want to predict the NASDAQ 100.

## Data:
The dataset we will analyze is cralwed from Quandl website. (https://www.quandl.com/)
Because there are many factors related to the NASDAQ 100, we need to add many features in order to predict the index, and analysis the
correlation of the factors. At first step, we want to use factors below as our feature:
Rate of RMB to USD, 
Rate of EUR to USD, 
Rate of JPY to USD, 
Real Yield Curve, 
Price of Crude Oil, 
Unemployement Rate, 
Gold Price, 
Consumer Price Index, 
S&P 500, 
FTSE 100 Index, 
Nikkei 225 Index, 
SSEC Index, 
VIX, and
USD Index

Because we need to crawl data from the website, the dataset requires cleaning and handling missing data. Also, we need to analysis how to 
translate different type of data to daily data. (For example, the unemployment rate is annual data)

## Target:
The targets of our data analysis include:

1.Find out the relationship between the features above and the NASDAQ 100 index, and the correlation between the features.

2.Build models for prediction of NASDAQ 100 index, compare and select the best model for the test data. The models we will use for prediction include Logistic Regression and Support Vector Machine(SVM). For each model, we will select the effective factors to make predictions. 
