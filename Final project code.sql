Use [780_Project]
Select * from dbo.Obesity_data

----Data cleaning
----Removing the nulls
DELETE FROM dbo.obesity_data
WHERE Age IS NULL
   OR gender IS NULL
   OR Veg_intake IS NULL
   OR No_of_meals_intake IS NULL
   OR Water_intake IS NULL
   or Physcial_Activity is null
   or Height is null
   or weight is null ---(o rows affected)

---Removing decimals from columns
update dbo.Obesity_data SET Age = Round(Age,0) ----(2111 rows affected)
update dbo.Obesity_data SET Veg_intake = Round(Veg_intake,0) ----(2111 rows affected)
update dbo.Obesity_data SET No_of_meals_intake = Round(No_of_meals_intake,0) ----(2111 rows affected)
update dbo.Obesity_data SET Water_intake = round(Water_intake,0) ----(2111 rows affected)
update dbo.Obesity_data SET Physcial_Activity = round (Physcial_Activity,0) ----(2111 rows affected)
update dbo.Obesity_data SET Tech_using_time= round (Tech_using_time, 0) ----(2111 rows affected)
ALTER TABLE dbo.obesity_data ALTER COLUMN Tech_using_time decimal(9,0)
ALTER TABLE dbo.obesity_data ALTER column Height decimal(9,2)
ALTER TABLE dbo.obesity_data ALTER COLUMN Weight decimal (9,0)
Select Age,Height,Weight,Veg_intake,No_of_meals_intake,Water_intake, Physcial_Activity,Tech_using_time from dbo.Obesity_data

-----BINARIZATION CODE:
----Family history with over weight
Select count (family_history_with_overweight) as freq_no from dbo.Obesity_data where family_history_with_overweight = 'no'---385
Select count (family_history_with_overweight) as freq_no from dbo.Obesity_data where family_history_with_overweight = 'yes'--1726

UPDATE dbo.Obesity_data SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'no','0') 
Select count (family_history_with_overweight) as freq_no from dbo.Obesity_data where family_history_with_overweight = '0' ---385

UPDATE dbo.Obesity_data SET family_history_with_overweight = REPLACE(family_history_with_overweight, 'yes','1')
Select count (family_history_with_overweight) as freq_no from dbo.Obesity_data where family_history_with_overweight = '1'---1726

----high cal intake:
Select count (High_Cal_intake) as freq_no from dbo.Obesity_data where High_Cal_intake = 'no'---245
Select count (High_Cal_intake) as freq_no from dbo.Obesity_data where High_Cal_intake = 'yes'--1866

UPDATE dbo.Obesity_data SET High_Cal_intake = REPLACE(High_Cal_intake, 'no','0') 
Select count (High_Cal_intake) as freq_no from dbo.Obesity_data where High_Cal_intake = '0' ---245

UPDATE dbo.Obesity_data SET High_Cal_intake = REPLACE(High_Cal_intake, 'yes','1')
Select count (High_Cal_intake) as freq_no from dbo.Obesity_data where High_Cal_intake = '1'----1866

-----Consu_food_intake_betw_Meals
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = 'no'---51
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = 'sometimes'--1765
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = 'Always'---53
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = 'Frequently'---242

UPDATE dbo.Obesity_data SET Consu_food_intake_betw_Meals = REPLACE(Consu_food_intake_betw_Meals, 'no','0') 
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = '0' ---51

UPDATE dbo.Obesity_data SET Consu_food_intake_betw_Meals = REPLACE(Consu_food_intake_betw_Meals, 'Sometimes','1')
UPDATE dbo.Obesity_data SET Consu_food_intake_betw_Meals = REPLACE(Consu_food_intake_betw_Meals, 'Always','1')
UPDATE dbo.Obesity_data SET Consu_food_intake_betw_Meals = REPLACE(Consu_food_intake_betw_Meals, 'Frequently','1')
Select count (Consu_food_intake_betw_Meals) as freq_no from dbo.Obesity_data where Consu_food_intake_betw_Meals = '1'---2060

-----Smoke
Select count (SMOKE) as freq_no from dbo.Obesity_data where SMOKE = 'no'---2067
Select count (SMOKE) as freq_no from dbo.Obesity_data where SMOKE = 'yes'--44

UPDATE dbo.Obesity_data SET SMOKE = REPLACE(SMOKE, 'no','0') 
Select count (SMOKE) as freq_no from dbo.Obesity_data where SMOKE = '0' ---2067

UPDATE dbo.Obesity_data SET SMOKE = REPLACE(SMOKE, 'yes','1')
Select count (SMOKE) as freq_no from dbo.Obesity_data where SMOKE = '1'----44
-----cal_intake
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring = 'no'
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring = 'yes'
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring= 'sometimes'--1401
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring= 'Always'---1
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring = 'Frequently'----70

UPDATE dbo.Obesity_data SET Cal_intake_Monitoring = REPLACE(Cal_intake_Monitoring, 'no','0') 
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring = '0' 

UPDATE dbo.Obesity_data SET Cal_intake_Monitoring= REPLACE(Cal_intake_Monitoring, 'yes','1')
UPDATE dbo.Obesity_data SET Cal_intake_Monitoring = REPLACE(Cal_intake_Monitoring, 'Sometimes','1')
UPDATE dbo.Obesity_data SET Cal_intake_Monitoring = REPLACE(Cal_intake_Monitoring, 'Always','1')
UPDATE dbo.Obesity_data SET Cal_intake_Monitoring = REPLACE(Cal_intake_Monitoring, 'Frequently','1')
Select count (Cal_intake_Monitoring) as freq_no from dbo.Obesity_data where Cal_intake_Monitoring = '1'---1472

----Alcohol
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = 'no'---639
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = 'sometimes'--1401
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = 'Always'---1
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = 'Frequently'---70

UPDATE dbo.Obesity_data SET Alcohol_intake = REPLACE(Alcohol_intake, 'no','0') 
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = '0' ---639

UPDATE dbo.Obesity_data SET Alcohol_intake = REPLACE(Alcohol_intake, 'Sometimes','1')
UPDATE dbo.Obesity_data SET Alcohol_intake = REPLACE(Alcohol_intake, 'Always','1')
UPDATE dbo.Obesity_data SET Alcohol_intake = REPLACE(Alcohol_intake, 'Frequently','1')
Select count (Alcohol_intake) as freq_no from dbo.Obesity_data where Alcohol_intake = '1'---1472

-----water intake
Select count (Water_intake) as freq_no from dbo.Obesity_data where Water_intake = '1'---485
Select count (Water_intake) as freq_no from dbo.Obesity_data where Water_intake = '2'--1110
Select count (Water_intake) as freq_no from dbo.Obesity_data where Water_intake = '3'---516

UPDATE dbo.Obesity_data SET Water_intake = REPLACE(Water_intake, '1','0') 
Select count (Water_intake) as freq_no from dbo.Obesity_data where Water_intake = '0' ---485

UPDATE dbo.Obesity_data SET Water_intake = REPLACE(Water_intake, '2','1')
UPDATE dbo.Obesity_data SET Water_intake = REPLACE(Water_intake, '3','1')
Select count (Water_intake) as freq_no from dbo.Obesity_data where Water_intake = '1'---1626

---Physical activity:
Select count (Physcial_Activity) as freq_no from dbo.Obesity_data where Physcial_Activity = '1'---776
Select count (Physcial_Activity) as freq_no from dbo.Obesity_data where Physcial_Activity = '2'--496
Select count (Physcial_Activity) as freq_no from dbo.Obesity_data where Physcial_Activity = '3'---119

UPDATE dbo.Obesity_data SET Physcial_Activity = REPLACE(Physcial_Activity, '1','0') 
Select count (Physcial_Activity) as freq_no from dbo.Obesity_data where Physcial_Activity = '0' ---1496

UPDATE dbo.Obesity_data SET Physcial_Activity = REPLACE(Physcial_Activity, '2','1')
UPDATE dbo.Obesity_data SET Physcial_Activity = REPLACE(Physcial_Activity, '3','1')
Select count (Physcial_Activity) as freq_no from dbo.Obesity_data where Physcial_Activity = '1'---615

----Veg intake
Select count (Veg_intake) as freq_no from dbo.Obesity_data where Veg_intake= '1'---102
Select count (Veg_intake) as freq_no from dbo.Obesity_data where Veg_intake = '2'--1013
Select count (Veg_intake) as freq_no from dbo.Obesity_data where Veg_intake = '3'---996

UPDATE dbo.Obesity_data SET Veg_intake = REPLACE(Veg_intake, '1','0') 
Select count (Veg_intake) as freq_no from dbo.Obesity_data where Veg_intake = '0' ---102

UPDATE dbo.Obesity_data SET Veg_intake = REPLACE(Veg_intake, '2','1')
UPDATE dbo.Obesity_data SET Veg_intake = REPLACE(Veg_intake, '3','1')
Select count (Veg_intake) as freq_no from dbo.Obesity_data where Veg_intake = '1'---2009

---no of meals intake:
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake = '1'---316
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake = '2'--176
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake = '3'---1470
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake = '4'---149
UPDATE dbo.Obesity_data SET No_of_meals_intake = REPLACE(No_of_meals_intake, '1','0') 
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake= '0' ---316

UPDATE dbo.Obesity_data SET No_of_meals_intake = REPLACE(No_of_meals_intake, '2','1')
UPDATE dbo.Obesity_data SET No_of_meals_intake = REPLACE(No_of_meals_intake, '3','1')
UPDATE dbo.Obesity_data SET No_of_meals_intake = REPLACE(No_of_meals_intake, '4','1')
Select count (No_of_meals_intake) as freq_no from dbo.Obesity_data where No_of_meals_intake = '1'---1795

-----Calculate BMI
ALTER TABLE dbo.obesity_data ADD BMI AS round((weight/(Height*Height)),2) persisted;
SELECT Height, Weight, FLOOR(BMI) AS BMI
FROM dbo.Obesity_data;
Select * from dbo.Obesity_data

-----Categorization of BMI Attribute as underweight, normal, overweight
---adding obesity levels:
Select height, weight, BMI,
CASE
When BMI <=18 then 'underweight'
When BMI between 18 and 25 Then 'Normal'
When BMI >25 then 'Overweight'
END as obesity_level into #BMI_table From dbo.Obesity_data ---2111 rows affected

Select * from #BMI_table 

----drop unwanted columns from the table:
Alter table dbo.obesity_data drop column Tech_using_time
Alter table dbo.obesity_data drop column obesity_level
Alter table dbo.obesity_data drop column transportation_used

----Join the tables-Training data
----Joining #BMI_table and Obesity_data
SELECT a.*, b.obesity_level
INTO dbo.final_table1
FROM dbo.Obesity_data a
JOIN #BMI_table b ON b.BMI = a.BMI
GROUP BY a.Gender, a.Age, a.Height, a.Weight, a.family_history_with_overweight,
         a.High_Cal_intake, a.Veg_intake, a.No_of_meals_intake,
         a.Consu_food_intake_betw_Meals, a.SMOKE, a.Alcohol_intake,
         a.Water_intake, a.Cal_intake_Monitoring, a.Physcial_Activity, a.BMI, b.obesity_level
ORDER BY a.Gender, a.Age, a.Height, a.Weight, a.family_history_with_overweight,
         a.High_Cal_intake, a.Veg_intake, a.No_of_meals_intake,
         a.Consu_food_intake_betw_Meals, a.SMOKE, a.Alcohol_intake,
         a.Water_intake, a.Cal_intake_Monitoring, a.Physcial_Activity, a.BMI, b.obesity_level; ----1766 rows affected

Select * from dbo.final_table1


-----COde for splitting data
select distinct Age
 into #OBA from dbo.final_table1---40 rows affected
     
select top 80 percent * 
into #train_obA
from #OBA---32 rows affected


select * 
into [trainingOB]
from dbo.final_table1
where Age in (select * from #train_obA) ---1512 rows affected

select * 
into [testingOB2]
from dbo.final_table1
where Age not in (select * from #train_obA)---254 rows

