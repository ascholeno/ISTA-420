--Name: Anthony Scholeno
--File: TSQL Exercise 5
--Date: July 31, 2020


use Presidents


--1. Create an appropriate table schema.
drop table if exists dbo.presidents;
create table dbo.presidents
(id varchar (50) not null, lastName varchar (50) not null, firstName varchar (50) not null, middleName varchar (50), orderOfPresidency varchar (50),
born date, died date, birthTown varchar (50), birthState varchar (50), homeState varchar (50),
partyAffiliation varchar (50), dateOfOffice date not null, dateleftOffice date, assassinationAttempt varchar (50),
assasinated varchar (50), religion varchar (50), imagepath varchar (50));

--2. Insert the CSV data into the table you just created.bulk insert dbo.presidents from "C:\Users\antho\Desktop\MSSA\quantico06\ISTA420\usp.csv"
with
(fieldterminator = ',',
rowterminator = '\n');--3. Delete the column that contains the path to the images.ALTER TABLE dbo.presidents DROP COLUMN imagepath;--4. Delete the first record from your table using the output clause. This is the header-- You may combine the following two steps.
--• Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is NOT NULL and UNIQUE.
--• Alter the presidents table by adding the column you created as a primary key column with a new constraint.--Table already had ID columnDelete from dbo.presidents

output 
	deleted.[id], deleted.[lastName], deleted.[firstName], deleted.[middleName], deleted.[orderOfPresidency], deleted.[born], 
	deleted.[died], deleted.[birthTown], deleted.[birthState], deleted.[homeState], deleted.[partyAffiliation], deleted.[dateOfOffice], deleted.[dateleftOffice], deleted.[assassinationAttempt], deleted.[assasinated], deleted.[religion]
where id like 'id';--5. Bring the data up to date by updating the last row. Use the output clauseupdate dbo.presidents
set dateleftOffice = '1/20/2017', assassinationAttempt = 'False', assasinated = 'false'
output inserted.id  
where id like '44';--6. Bring the data up to date by adding a new row. Use the output clauseINSERT INTO dbo.presidents
    output inserted.id
VALUES ('45', 'Trump', 'Donald', 'John', '45', '6/14/1946', '', 'New York', 'New York', 'Florida', 'Republican', '1/20/2017', '', '', '', 'Presbyterian')
--7. How many presidents from each state belonged to the various political parties? Aggregate by party
-- and state. Note that this will in efect be a pivot table.

select count(id), homestate, partyAffiliation 
from dbo.presidents 
group by homestate, partyAffiliation 
order by homestate, partyAffiliation;


--8. Create a report showing the number of days each president was in office.
select datediff(day, dateOfOffice, dateleftOffice) from dbo.presidents--9. Create a report showing the age (in years) of each present when he took office.select datediff(year, born, dateOfOffice) from dbo.presidents;--10. See if there is any correlation between a president's party and reported religion, or lack of reported religion.select count(id), partyAffiliation, religion from dbo.presidentsgroup by partyAffiliation, religionorder by partyAffiliation, religion