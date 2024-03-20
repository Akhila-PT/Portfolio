## Analysing data
SELECT * FROM public.international_debt

-- The analysis reveals that there are 124 distinct countries represented in the "international_debt" table.

## num_distinct_countries
SELECT 
COUNT(DISTINCT country_name ) AS total_distinct_countries
FROM international_debt;

## distinct_debt_indicators
SELECT DISTINCT indicator_code AS distinct_debt_indicators
FROM international_debt;


## total_debt
SELECT ROUND(SUM(debt) / 1000000, 2) AS total_debt
FROM international_debt;
-- The total debt identified in the data is approximately $3,079,734.49 million.


## highest_debt_country
SELECT country_name, 
       SUM(debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;
-- We can see that China has the highest total debt among all countries in the dataset, with a total debt of approximately $285.79 billion.

## avg_debt_per_indicator
SELECT indicator_code AS debt_indicator,
		indicator_name,
		AVG(debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

## highest_principal_repayment

SELECT country_name, 
	   indicator_name
FROM international_debt
WHERE  debt = (SELECT MAX(debt) 
            FROM international_debt 
            WHERE indicator_code = 'DT.AMT.DLXF.CD');

-- The query identifies the country with the highest principal repayment on external debt, long-term, in terms of current US dollars. 
-- The result indicates that China has the highest principal repayment among the countries listed with the indicator specifically focusing on the principal repayments on external debt. 
-- This insight sheds light on China's significant financial commitments and obligations in servicing its external debt.