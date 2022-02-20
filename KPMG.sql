--for the existing customer table we will create metrics from wich can analysis the new customers 

--Age
select sum(past_3_years_bike_related_purchases) from kpmg.[dbo].[CustomerDemographic]
where DOB >= 1968-01-01




---------------------------------------------------

--gender
select gender,sum(past_3_years_bike_related_purchases) as total_sales from kpmg.[dbo].[CustomerDemographic]
group by gender


--------------------------------------------------------------------------------------------

--Job Inddustry
select job_industry_category,sum(past_3_years_bike_related_purchases) as total_sales from kpmg.[dbo].[CustomerDemographic]
group by job_industry_category



--------------------------------------------------------------------------------------------------------------------------------------
---Wealth Segment
select wealth_segment,sum(past_3_years_bike_related_purchases) as total_sales from kpmg.[dbo].[CustomerDemographic]
group by wealth_segment


--------------------------------------------------------------------------------------------------------------------------------------------

--Location


select a.customer_id,b.state,(select sum(a.past_3_years_bike_related_purchases) as total_cases)
from kpmg.[dbo].[CustomerDemographic] a
join  kpmg.[dbo].[CustomerAddress] b
 on a.customer_id = b.customer_id
group by a.customer_id,b.state
--order by total_cases




---------------------------------------------------------------------------------------------------------------
--for new customers

select * from kpmg. [dbo].[NewCustomerList]
alter table kpmg. [dbo].[NewCustomerList]
alter column past_3_years_bike_related_purchases numeric;


--Age
select  sum(past_3_years_bike_related_purchases) as total_sales from kpmg. [dbo].[NewCustomerList]
where DOB >= 1968-01-01
select * from kpmg. [dbo].[NewCustomerList]


---Gender
select gender,sum(past_3_years_bike_related_purchases) as total_sales from kpmg. [dbo].[NewCustomerList]
group by gender


--Job Inddustry
select job_industry_category,sum(past_3_years_bike_related_purchases) as total_sales from kpmg. [dbo].[NewCustomerList]
group by job_industry_category

---Wealth Segment
select wealth_segment,sum(past_3_years_bike_related_purchases) as total_sales from kpmg. [dbo].[NewCustomerList]
group by wealth_segment


--location
select state,sum(past_3_years_bike_related_purchases) as total_sales from kpmg. [dbo].[NewCustomerList]
group by state


--to know the perfect customer

select first_name,last_name, gender,	past_3_years_bike_related_purchases,job_title	,job_industry_category	,wealth_segment,	owns_car	,tenure	,address	,postcode	,state	,	property_valuation	,Rank	,Value
 from kpmg. [dbo].[NewCustomerList]
where gender = 'female' and job_industry_category = 'manufacturing' and  state = 'nsw'and wealth_segment = 'Mass Customer'
order by past_3_years_bike_related_purchases desc ;
