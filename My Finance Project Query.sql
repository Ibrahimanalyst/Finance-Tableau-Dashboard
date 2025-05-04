Select * from bank_loan;

select issue_date, STR_TO_Date(issue_date, '%d-%m-%YYYY') from bank_loan;

update bank_loan
set issue_date = STR_TO_Date(issue_date, '%d-%m-%YYYY');

ALTER TABLE bank_loan
modify column issue_date date;

ALTER TABLE financial_loan
RENAME  to bank_loan;

##Total Loan Applications##

select count(id) as Total_Loan_Applications from bank_loan;

##MTD Loan Applications##
select count(id) as MTD_Loan_Applications from bank_loan
where month(issue_date) = 12;


##PMTD Loan Applications##
select count(id) as PMTD_Loan_Applications from bank_loan
where month(issue_date) = 11;

##Total Funds Amount##
select sum(loan_amount) as Total_Funds_Amount from bank_loan;

##MTD Total Funds Amount##
select sum(loan_amount) as MTD_Total_Funds_Amount from bank_loan
where month(issue_date) = 12; 

##PMTD Total Funds Amount##
select sum(loan_amount) as Total_Funds_Amount from bank_loan
where month(issue_date) = 11;

##Total amount received##
select sum(total_payment) as Total_Amount_Received from bank_loan ;

##MTD Total amount received##
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan
where month(issue_date) = 12;

##PMTD Total amount received##
select sum(total_payment) as PMTD_Total_Amount_Received from bank_loan
where month(issue_date) = 11;

##Avarage interest rate##
select avg(int_rate)*100 as AVG_Interest_Rate from bank_loan;

##MTD Avarage interest rate##
select avg(int_rate)*100 as MTD_AVG_Interest_Rate from bank_loan
where month(issue_date) = 12;

##PMTD Avarage interest rate##
select avg(int_rate)*100 as PMTD_AVG_Interest_Rate from bank_loan
where month(issue_date) = 11;

##AVG DTI##
select avg(dti)*100 as AVG_DTI from bank_loan;

##MTD AVG DTI##
select avg(dti)*100 as MTD_AVG_DTI from bank_loan
where month(issue_date) = 12;

##PMTD AVG DTI##
select avg(dti)*100 as PMTD_MTD_AVG_DTI from bank_loan
where month(issue_date) = 11;

##Good Loan Percentage##
Select
	(count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id 
end)* 100 ) /
	count(id) as Good_Loan_Percentage
from bank_loan;

##Good Loan Applications##
Select count(id) as Good_Loan_Applications
from bank_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

##Good Loan Funded Amount##
Select sum(loan_amount) as Good_Loan_Funded_Amount
from bank_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

##Good Loan Amount Received##
Select sum(total_payment) as Good_Loan_Amount_Received
from bank_loan
where loan_status = 'Fully Paid' or loan_status = 'Current';

##Bad Loan Section##
##Bad Loan Percentage##
Select (
		count(case when loan_status = 'Charged Off' 
        then id end)*100) / count(id) as Bad_Loan_Percentage
from bank_loan;

##Bad Loan Applications##
select count(id) as Bad_Loan_Applications
from bank_loan
where loan_status = 'Charged Off';

##Bad Loan Funded Amount##
select sum(loan_amount) as Bad_Loan_Funded_Amount
from bank_loan
where loan_status = 'Charged Off';

##Bad Loan Amount Received##
select sum(total_payment) as Bad_Loan_Amount_Received
from bank_loan
where loan_status = 'Charged Off';


##Loan Status##
select 
	loan_status,
	count(id) as Total_Loan,
	sum(total_payment) as Total_Amount_received,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate) * 100 as Avg_Interest,
	avg(dti) * 100 as Avg_Dti
from bank_loan
group by loan_status
order by Total_Amount_Received desc;
##Loan Status December##
select 
	loan_status,
	count(id) as Total_Loan,
	sum(total_payment) as Dec_Total_Amount_received,
	sum(loan_amount) as Dec_Total_Funded_Amount,
	avg(int_rate) * 100 as Dec_Avg_Interest,
	avg(dti) * 100 as Dec_Avg_Dti
from bank_loan
where month(issue_date) = 12
group by loan_status
order by Dec_Total_Amount_Received desc;

##Bank Loan Report Monthly##
Select
	month(issue_date) as Month_Number,
    monthname(issue_date) as Month_Name,
    count(id) as Total_loan_Application,
    Sum(loan_amount) as Total_Funded_Amount,
    Sum(total_payment) as Total_Amount_Received
from bank_loan
group by Month_Number , Month_Name
order by Month_Number;

#Bank Loan By State##
select
	address_state as State,
    count(id) as Total_Loan_Application,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan
group by State
order by State;

##Bank Loan By Term##
select
	term as Term,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan
group by term
order by term;

##Bank Loan by EMPLOYEE LENGTH##
select
	emp_length as Employee_Length,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan
group by emp_length
order by emp_length;

##Bank Loan by Purpose##
select
	purpose as Purpose,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan
group by Purpose
order by Purpose;
    
##Bank Loan by House Ownership##
select
	home_ownership as Home_Ownership,
    count(id) as Total_Loan_Applications,
    sum(loan_amount) as Total_Funded_Amount,
    sum(total_payment) as Total_Amount_Received
from bank_loan
group by home_ownership
order by home_ownership;
    
    












