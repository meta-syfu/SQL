
CREATE TABLE customer (
  cust_id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  family VARCHAR(30) NOT NULL,
  address  VARCHAR(30) NOT NULL
);


CREATE TABLE room(
    room_id VARCHAR(30) NOT NULL PRIMARY KEY,
    stage INTEGER NOT NULL,
    bed_numer INTEGER NOT NULL,
    amount INTEGER NOT NULL
);


CREATE TABLE employ(
    emp_id VARCHAR(30) NOT NULL PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    salary INTEGER NOT NULL
);


CREATE TABLE reserve(
     cust_id INTEGER NOT NULL,
     room_id VARCHAR(30) NOT NULL,
     FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ,
     FOREIGN KEY (room_id) REFERENCES room(room_id) ,
     PRIMARY KEY (cust_id,room_id)
);

CREATE TABLE services(
     emp_id VARCHAR(30) NOT NULL,
     room_id VARCHAR(30) NOT NULL,
     FOREIGN KEY (emp_id) REFERENCES employ(emp_id) ,
     FOREIGN KEY (room_id) REFERENCES room(room_id) ,
     PRIMARY KEY (emp_id,room_id)
);



insert into customer values (1,'ali','shahedi','tehran');
insert into customer values (2,'sara','ahmadipor','tabriz');
insert into customer values (3,'reza','masoodi','tehran');
insert into customer values (4,'armin','mehrshadi','mazandaran');
insert into customer values (5,'nika','amiri','esfahan');
insert into customer values (6,'maryam','kashani','kashan');
insert into customer values (7,'ali','tehrani','tehran');


insert into room values('r1',1,2,3000);
insert into room values('r2',1,2,3000);
insert into room values('r3',2,3,2700);
insert into room values('r4',2,2,2400);
insert into room values('r5',3,1,1200);
insert into room values('r6',3,3,4000);
insert into room values('r7',4,1,2000);
insert into room values('r8',4,2,34000);
insert into room values('r9',5,3,5000);
insert into room values('r10',5,2,2000);

insert into  reserve values(1,'r1');
insert into  reserve values(2,'r3');
insert into  reserve values(3,'r2');
insert into  reserve values(4,'r5');
insert into  reserve values(5,'r7');
insert into  reserve values(6,'r10');
insert into  reserve values(7,'r6');

insert into employ values('em1','mohsen',12000);
insert into employ values('em2','negin',22000);
insert into employ values('em3','sara',7000);
insert into employ values('em4','ali',9000);
insert into employ values('em5','reza',10000);


insert into services values('em2','r3');
insert into services values('em1','r1');
insert into services values('em3','r2');
insert into services values('em4','r5');
insert into services values('em5','r6');
insert into services values('em2','r7');
insert into services values('em2','r4');



-- اسامی مسافران هتل

select * from customer;

-- اطلاعات مسافران هتل که تهرانی هستند
select * from customer where address='tehran';



--  ارزان ترین اتاق
select * from room
where amount <=(select min(amount) from room)
;

-- اتاق های رزرو نشده
select * from room 
where room_id not in(
select room_id from reserve
);

-- تعداد اتاق های در حال فعالیت کارمندان
select emp_id,count(*) as number_room from services
GROUP BY emp_id
;


-- اطلاعات مسافر که اتاق شماره 3 را رزرو کرده است

select customer.cust_id,name,family from customer right join reserve
on customer.cust_id=reserve.cust_id
where room_id='r3';


