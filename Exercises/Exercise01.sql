.echo on
.headers on

-- Name: Anthony Scholeno
-- File: family.sql
-- Date; July2, 2020



drop table if exists Family;

create table Family (
      ID integer primary key,
      Name text,
      Sex int,
      Role text
);

insert into Family values (1,"Anthony",1,"Husband");
  insert into Family values (2,"Sydney",0,"Wife");
    insert into Family values (3,"Sparrow",0,"Dog");
      insert into Family values (4,"Caspian",1,"Dog");
        insert into family values (5,"Luna",0,"Cat");

select * from Family;
select * from Family where sex = 1;
select * from Family where role like "Dog";
