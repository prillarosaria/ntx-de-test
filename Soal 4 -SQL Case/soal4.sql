#Test Case 1
WITH Top5Countries AS (
    SELECT
        country,
        SUM(totalTransactionRevenue) AS totalRevenue
    FROM
        ecommerce
    WHERE
        totalTransactionRevenue IS NOT NULL
    GROUP BY
        country
    ORDER BY
        totalRevenue DESC
    LIMIT 5
)
SELECT
    t.country,
    c.channelGrouping,
    SUM(c.totalTransactionRevenue) AS totalRevenue
FROM
    ecommerce AS c
JOIN
    Top5Countries AS t
ON
    c.country = t.country
GROUP BY
    t.country, c.channelGrouping
ORDER BY
    t.country, totalRevenue DESC;




#Test Case 2
SELECT 
    fullVisitorId, 
    AVG(timeOnSite), 
    AVG(sessionQualityDim), 
    AVG(pageviews) 
FROM mytable 
GROUP BY fullVisitorId;




#Test Case 3
# a
SELECT 
    v2ProductName, 
    SUM(productRevenue) 
FROM mytable 
GROUP BY v2ProductName;

# b
SELECT 
    v2ProductName, 
    SUM(itemQuantity) as quantity 
FROM mytable 
GROUP BY v2ProductName 
ORDER BY `quantity` DESC

#c
SELECT 
    v2ProductName, 
    SUM(productRefundAmount) as total_refund 
FROM mytable 
GROUP BY v2ProductName 
ORDER BY total_refund DESC;