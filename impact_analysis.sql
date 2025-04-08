-- Impact Analysis of GoodThought NGO Initiatives

-- highest_donation_assignments
SELECT
	assignment_name
	,region
	,ROUND(SUM(amount), 2) AS rounded_total_donation_amount
	,donor_type
FROM
	assignments AS a
JOIN donations AS d
ON a.assignment_id = d.assignment_id
JOIN donors AS dn
ON d.donor_id = dn.donor_id
GROUP BY
	1, 2, 4
ORDER BY
	3 DESC
LIMIT 5;



-- top_regional_impact_assignments
WITH donations_cnt AS (
SELECT
	assignment_id
	,COUNT(donation_id) AS num_total_donations
FROM 
	donations
GROUP BY 
	assignment_id
),

ranked_assignments AS (
SELECT
	assignment_name
	,a.assignment_id
	,region
	,ROW_NUMBER() OVER(PARTITION BY region ORDER BY impact_score DESC) AS rank
	,impact_score
FROM
	assignments AS a
JOIN donations_cnt AS cnt
	ON a.assignment_id = cnt.assignment_id
WHERE num_total_donations > 0
)

SELECT
	ra.assignment_name
	,region
	,impact_score
	,num_total_donations
FROM
	ranked_assignments AS ra
JOIN donations_cnt AS dc
ON ra.assignment_id = dc.assignment_id
WHERE rank = 1
ORDER BY
	region ASC



-- Identify funding trends over time
SELECT
	EXTRACT(YEAR FROM donation_date) AS year
	,donor_type
	,ROUND(SUM(amount), 2) AS total_donations
FROM
	donations d
JOIN donors dn
	ON d.donor_id = dn.donor_id
GROUP BY 
	1, 2



-- detect underperforming assignmnets
WITH average_score AS (
	SELECT AVG(impact_score) AS score_avg
	FROM assignments
), 

SELECT
	assignment_name
	,region
	,AVG(budget) AS budget
	,AVG(impact_score) AS impact_score
	,SUM(amount) AS total_donations
FROM
	assignments a
JOIN donations d
	ON a.assignment_id = d.assignment_id
WHERE budget > 50000
	AND impact_score < (SELECT score_avg FROM average_score)
GROUP BY 
	1, 2;


SELECT
	a.assignment_id
	,COUNT(d.donation_id) AS donations_cnt
FROM
	assignments a
FULL JOIN 
	donations d
	ON a.assignment_id = d.assignment_id
GROUP BY
	a.assignment_id
ORDER BY
	2;
