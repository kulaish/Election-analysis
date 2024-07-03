create database election;
use election;
show databases;

select * from elections;



-- 1-List all parliamentary constituencies.
select Name_of_the_Parliamentary_Constituency
from elections;

-- 2-Count the total number of parliamentary constituencies.
select count(*)
from elections;

-- 3-Find the total number of male electors in 2014.
select sum(Men_Electors_in_2014)
from elections;

-- 4-Find the parliamentary constituency with the highest number of male voters in 2014.
select Name_of_the_Parliamentary_Constituency,Men_Voters_in_2014
from elections
order by Men_Voters_in_2014 desc
limit 1;

-- 5-List the parliamentary constituencies where the percentage of women voters over women electors is greater than 70%.
select Name_of_the_Parliamentary_Constituency, Percentage_of_Women_Voters_over_Men_Electors_in_2014
from elections
where Percentage_of_Women_Voters_over_Men_Electors_in_2014>70;

-- 6- the average percentage of total voters over total electors for all constituencies.
select Name_of_the_Parliamentary_Constituency,avg(Percentage_of_Total_Voters_over_Total_Electors_in_2014) as avg_voters
from elections
group by Name_of_the_Parliamentary_Constituency
order by avg_voters;

-- 7-Find the constituency with the lowest percentage of male voters over male electors.
select Name_of_the_Parliamentary_Constituency,Percentage_of_Men_Voters_over_Men_Electors_in_2014
from elections
order by Percentage_of_Men_Voters_over_Men_Electors_in_2014 asc
limit 1;

-- 8-List constituencies where the number of women electors is greater than the number of men electors.
select Name_of_the_Parliamentary_Constituency,Women_Electors_in_2014,Men_Electors_in_2014
from elections
where Women_Electors_in_2014>Men_Electors_in_2014;

-- 9.Find the total number of electors in 2014 by summing male, female, and other electors.
select sum(Men_Electors_in_2014+Women_Electors_in_2014+Others_Electors_in_2014) as total_electors
from elections;

-- 10-Identify the top 3 constituencies with the highest percentage of other voters over other electors.
select Name_of_the_Parliamentary_Constituency,Percentage_of_Total_Voters_over_Total_Electors_in_2014
from elections
order by Percentage_of_Total_Voters_over_Total_Electors_in_2014 desc
limit 3;

select* from elections;

-- 11.-Find the constituency with the highest number of total electors in 2014.
select Name_of_the_Parliamentary_Constituency,Total_Voters_in_2014
from elections
order by Total_Voters_in_2014 desc
limit 1;

-- 12-Calculate the total number of voters (men, women, and others) in 2014.
select sum(Men_Voters_in_2014+Women_Voters_in_2014+Others_Voters_in_2014) as total_voters
from elections;

-- 13-List the names of constituencies where the percentage of total voters over total electors is less than 60%.
select Name_of_the_Parliamentary_Constituency,Percentage_of_Total_Voters_over_Total_Electors_in_2014
from elections
where Percentage_of_Total_Voters_over_Total_Electors_in_2014<60;

-- 14-Calculate the average number of women voters in 2014.
select avg(Women_Voters_in_2014) as avg_voters
from elections;

-- 15-Find the top 5 constituencies with the highest number of women voters in 2014.
select Name_of_the_Parliamentary_Constituency,Women_Voters_in_2014
from elections
order by Women_Voters_in_2014 desc
limit 5;

-- 16-List the constituencies where the total number of voters is greater than 500,000.
select Name_of_the_Parliamentary_Constituency,Total_Voters_in_2014
from elections
where Total_Voters_in_2014 > 500000;

select * from elections;

-- 17-Calculate the difference between the number of men voters and women voters for each constituency.
select Name_of_the_Parliamentary_Constituency,(Men_Voters_in_2014-Women_Voters_in_2014) as difference_voters
from elections;

-- 18-Find the constituency with the lowest number of other voters in 2014.
select Name_of_the_Parliamentary_Constituency,Others_Voters_in_2014
from elections
order by Others_Voters_in_2014 
limit 1;

-- 19.Calculate the percentage of total electors who voted (men, women, and others) for each constituency.
select Name_of_the_Parliamentary_Constituency,
(Total_Voters_in_2014 / Total_Electors_in_2014)*100 AS Voting_Percentage
FROM elections;

-- 21 -Ranking Constituencies by Total Voters:
select Name_of_the_Parliamentary_Constituency,Total_Voters_in_2014,
rank() over (order by Total_Voters_in_2014 desc) as rank_voters
from elections;

-- 22-Calculating the Running Total of Voters:
select Name_of_the_Parliamentary_Constituency,Total_Voters_in_2014,
sum(Total_Voters_in_2014) over(order by Total_Voters_in_2014) as running_total
from elections;

-- 23-Calculating the Average Voters per Constituency:
select Name_of_the_Parliamentary_Constituency,avg(Total_Voters_in_2014) over(order by Total_Voters_in_2014) as avg_voters,Total_Voters_in_2014
from elections;

-- 24-Finding the Difference from the Average Voters to voters:
select Name_of_the_Parliamentary_Constituency,Total_Voters_in_2014,
Total_Voters_in_2014-avg(Total_Voters_in_2014) over() as avg_diff
from elections;




