use work

--Reasons for absents with all absenteesim
select * from Absenteeism_at_work as a
left join Reasons as b on
a.Reason_for_absence = b.Number

--Find the helthiest person
select * from Absenteeism_at_work
where Social_smoker = 0 and Social_drinker = 0 and Body_mass_index <25
and Absenteeism_time_in_hours < (select avg(Absenteeism_time_in_hours) from Absenteeism_at_work)

--compensation rate 
select concat ('Non Smoker :- ', 983221/(count(*)*8*5*52)) as compensation_rate from Absenteeism_at_work
where Social_smoker = 0
union all
select concat ('Smoker :- ',983221/(count(*)*8*5*52)) as compensation_rate from Absenteeism_at_work
where Social_smoker = 1


--Reasons of absenece based on weather and person health
select a.ID,b.Reason,a.Body_mass_index,
case
	when `Body_mass_index` <18.5 then "Underweight"
    when `Body_mass_index` between 18.5 and 25 then "Healthy"
    when `Body_mass_index` between 25 and 30 then "Overweight"
    when `Body_mass_index` > 30 then "Obese"
    else "Unkown" end as BMI_Category,
case
	when `Month_of_absence` in (12,1) then "Winter"
    when `Month_of_absence` in (2,3) then "Spring"
    when `Month_of_absence` in (4,5,6) then "Summer"
    when `Month_of_absence` in (7,8,9) then "Monsoon"
    when `Month_of_absence` in (10,11) then "Autumn"
    else "Unknown" end as Seasons_Names,
    Seasons, Month_of_absence,Day_of_the_week,
    Transportation_expense,Education,Son,Social_drinker,Social_smoker,Pet,Disciplinary_failure,Age, 
    Age,`Work load Average/day`,Absenteeism_time_in_hours
    from Absenteeism_at_work as a
left join Reasons as b on
a.Reason_for_absence = b.Number

