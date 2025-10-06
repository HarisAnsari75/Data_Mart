use case1
select * from weekly_sales;

## Data cleansing

create table clean_weekly_sales as    ##adding table with the colm name week_number,month_number,calender
select week_date,
week(week_date) as week_number,
month(week_date) as month_number,
year(week_date) as calender,
region,platform,                ## getting region,platform colm as it is
case
when segment= null then 'Unknown'      ## naming null as unknown in segment colm
else segment
end as segment,
case                                             ## setting the right 1st values in segemnt colm
when right(segment,1)='1' then 'Young Adults'      ## 1=young adult
when right(segment,1)='2' then 'Middle Aged'        ## 2= middle aged
when right (segment,1) in ('3','4') then 'retirees'  ## 3,4= retirees
else 'Unknown'                                       ## other than 1,2,3,4 it will be unknown
end as age_band,                                    ## colm name will be age band

case                                        ## setting the left 1st value in segment colm
when left (segment,1)= 'C' then 'Couples'  ## C = couple
when left (segment,1)= 'F' then 'Family'   ## F = family
else 'Unknown'                             ## else it will be unknown
end as demographic,                        ## colm name = demographic
customer_type,transactions,sales,         ## customer_type,transactions,sales these colm be call as same
round(sales/transactions,2) as 'avg_ transactions' ## adding avg transactions colm by multiplying sales/transaction
from weekly_sales;

select * from clean_weekly_sales;

## DATA Exploration

create table seq100 (x int auto_increment primary key);   ## creating table  seq100

insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
insert into seq100 values (),(),(),(),(),(),(),(),(),();
select * from seq100

insert into seq100 select x+50 from seq100;               ## creating seq100 for selecting seq52 for week no 

create table seq52 as ( select x from seq100 limit 52);   ## creating table seq52 for defining week of the yrs
select * from seq52;

select distinct x as week_day from seq52                 
where x not in (select distinct week_number from clean_weekly_sales);

select distinct week_number from clean_weekly_sales;   ## 12 to 35 week_number are avialable in clean_weekly_sales

select calender,
sum(transactions) as total_transactions
from clean_weekly_sales group by calender;     ## sum of transaction by calender(yearly)
 
 select region,month_number,   ## month & region wise total sales
 sum(sales) as total_sales
 from clean_weekly_sales
group by month_number,region;

select platform,                           ##platform wise total transactions
sum(transactions) as total_transactions    
from clean_weekly_sales
group by platform;

with cte_monthly_platform_sales as       ## creating cte 
(select month_number,calender,platform,
sum(sales) as monthly_sales
from clean_weekly_sales
group by month_number,calender,platform)

select month_number,calender,
round(100*max(case when platform='Retail'                  ##  monthly sales as retail percentage
then monthly_sales else null end)/sum(monthly_sales),2) as
retail_percentage,

round(100*max(case when platform='Shopify'                 ## monthly sales as shpify percentage
then monthly_sales else null end)/sum(monthly_sales),2) as
 shopify_percentage

from cte_monthly_platform_sales
group by month_number,calender;    ## groping it by month_number & calender

select calender,demographic,
sum(sales) as yearly_sales,
round(100*sum(sales)/sum(sum(sales))         ## yearly sales,/% as per demographic and calender
over (partition by demographic),2)as percentage
from clean_weekly_sales
group by calender,demographic;

select age_band,demographic,
sum(sales) as total_sales
from clean_weekly_sales
where platform='Retail'
group by age_band,demographic
order by total_sales desc;