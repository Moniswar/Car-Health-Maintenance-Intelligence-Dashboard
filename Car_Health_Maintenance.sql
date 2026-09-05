USE CarHealthAnalytics;


SELECT COUNT(DISTINCT Car_ID) AS Total_Cars FROM CarHealthMaintenance;


-- 2. Average car health score across the entire fleet
SELECT ROUND(AVG(CAST(Health_Score AS FLOAT)), 2) AS Avg_Health_Score FROM CarHealthMaintenance;


-- 3. Distribution of cars by condition (Healthy vs Warning vs Critical)
SELECT Conditions, COUNT(DISTINCT Car_ID) AS Car_Csount, ROUND(COUNT(DISTINCT Car_ID) * 100.0 / (SELECT COUNT(DISTINCT Car_ID) FROM CarHealthMaintenance), 2) AS Percentage FROM CarHealthMaintenance GROUP BY Conditions ORDER BY Car_Count DESC;

-- 4. Total maintenance cost incurred across all service records
SELECT ROUND(SUM(Maintenance_Cost), 2) AS Total_Maintenance_Cost FROM CarHealthMaintenance;


-- 5. Average maintenance cost per service event
SELECT ROUND(AVG(Maintenance_Cost), 2) AS Avg_Maintenance_Cost FROM CarHealthMaintenance;


-- 6. Total and average maintenance cost broken down by component
SELECT Component, COUNT(*) AS Service_Events, ROUND(SUM(Maintenance_Cost), 2) AS Total_Cost, ROUND(AVG(Maintenance_Cost), 2) AS Avg_Cost FROM CarHealthMaintenance GROUP BY Component ORDER BY Total_Cost DESC;

-- 7. Most frequently failing components
SELECT Component, COUNT(*) AS Failure_Count FROM CarHealthMaintenance WHERE Failure_Type <> 'No Failure' GROUP BY Component ORDER BY Failure_Count DESC;


-- 8. Top 10 cars with the highest cumulative maintenance cost
SELECT  Car_ID, Car_Model, COUNT(*) AS Service_Events, ROUND(SUM(Maintenance_Cost), 2) AS Total_Cost FROM CarHealthMaintenance GROUP BY Car_ID, Car_Model ORDER BY Total_Cost DESC;


-- 9. Top 10 cars with the highest cumulative downtime hours
SELECT  Car_ID, Car_Model, SUM(Downtime_Hours) AS Total_Downtime_Hours FROM CarHealthMaintenance GROUP BY Car_ID, Car_Model ORDER BY Total_Downtime_Hours DESC;


-- 10. Cars with the lowest average health score
SELECT  Car_ID, Car_Model, ROUND(AVG(CAST(Health_Score AS FLOAT)), 2) AS Avg_Health_Score FROM CarHealthMaintenance GROUP BY Car_ID, Car_Model ORDER BY Avg_Health_Score ASC;


-- 11. Breakdown of maintenance types (Preventive vs Corrective vs Emergency)
SELECT Maintenance_Type, COUNT(*) AS Record_Count, ROUND(SUM(Maintenance_Cost), 2) AS Total_Cost, ROUND(AVG(Downtime_Hours), 1) AS Avg_Downtime_Hours FROM CarHealthMaintenance GROUP BY Maintenance_Type ORDER BY Total_Cost DESC;

-- 12. Average downtime hours by component
SELECT Component, ROUND(AVG(CAST(Downtime_Hours AS FLOAT)), 1) AS Avg_Downtime FROM CarHealthMaintenance GROUP BY Component ORDER BY Avg_Downtime DESC;


-- 13. Failure count breakdown by failure type
SELECT Failure_Type, COUNT(*) AS Frequency FROM CarHealthMaintenance WHERE Failure_Type <> 'No Failure' GROUP BY Failure_Type ORDER BY Frequency DESC;


-- 14. Total maintenance cost and service events by geographic region
SELECT Region, COUNT(*) AS Service_Events, ROUND(SUM(Maintenance_Cost), 2) AS Total_Cost, ROUND(AVG(Maintenance_Cost), 2) AS Avg_Cost FROM CarHealthMaintenance GROUP BY Region ORDER BY Total_Cost DESC;


-- 15. Maintenance workload and cost performance by service center
SELECT Service_Center, COUNT(*) AS Total_Services, ROUND(SUM(Maintenance_Cost), 2) AS Total_Revenue, ROUND(AVG(Downtime_Hours), 1) AS Avg_Downtime FROM CarHealthMaintenance GROUP BY Service_Center ORDER BY Total_Services DESC;


-- 16. Monthly maintenance cost trend over the 3-year period
SELECT FORMAT(Failure_Date, 'yyyy-MM') AS Maintenance_Month, COUNT(*) AS Service_Count, ROUND(SUM(Maintenance_Cost), 2) AS Monthly_Cost FROM CarHealthMaintenance GROUP BY FORMAT(Failure_Date, 'yyyy-MM') ORDER BY Maintenance_Month;


-- 17. Cars currently requiring immediate attention (Critical condition or Needs Inspection status)
SELECT DISTINCT Car_ID, Car_Model, Car_Age, Mileage_KM, Health_Score, Conditions, Car_Status FROM CarHealthMaintenance WHERE Conditions = 'Critical' OR Car_Status = 'Needs Inspection' ORDER BY Health_Score ASC;


-- 18. Components with the highest failure frequency ratio relative to total checks
SELECT Component, COUNT(*) AS Total_Checks, SUM(CASE WHEN Failure_Type <> 'No Failure' THEN 1 ELSE 0 END) AS Failures, ROUND(SUM(CASE WHEN Failure_Type <> 'No Failure' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Failure_Rate_Pct FROM CarHealthMaintenance GROUP BY Component ORDER BY Failure_Rate_Pct DESC;


-- 19. Cars with repeated component failures (more than 2 failures recorded)
SELECT Car_ID, Car_Model, COUNT(*) AS Total_Failures FROM CarHealthMaintenance WHERE Failure_Type <> 'No Failure' GROUP BY Car_ID, Car_Model HAVING COUNT(*) > 2 ORDER BY Total_Failures DESC;


