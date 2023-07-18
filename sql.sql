create sequence member_seq start with 1 increment by 1;
create sequence product_seq start with 1 increment by 1;
create sequence qna_seq start with 1 increment by 1;
create sequence board_seq start with 1 increment by 1;
create sequence reserv_seq start with 1 increment by 1;
create sequence airLine_seq start with 1 increment by 1;
create sequence banner_seq start with 1 increment by 1;






create table member (
	member_num number(10),
	id varchar2(30) not null,
	pwd varchar2(30),
	name varchar2(30),
	phone varchar2(30),
	email varchar2(50),
	zip_num varchar2(50),
	address1 varchar2(50),
	address2 varchar2(50),
	point number(10) DEFAULT 0,
	indate date default sysdate,
	useyn char(1) DEFAULT 'Y',
	birth varchar2(15),
	gender char(1),
	primary key(member_num)
);

create table admin(
	id varchar2(30),
	pwd varchar2(30)
);


create table qna (
    qna_num number(10),
    mnum number(6),
    title varchar2(255) not null,
    content varchar2(1000) not null,
    indate date default sysdate,
    result char(1) default 'N',
    reply varchar2(1000),
    readcount number(4),
    imgfilename varchar2(100),
    pass varchar2(30),
    passcheck char(1) default 'N',
    
    constraint fk30 foreign key (mnum) references member(member_num),
    primary key(qna_num)
);


create table reservation (
	reserv_num number(6),
	departures varchar2(100),
	arrivals varchar2(100),
	dep_time date,
	return_time date,
	airplane_name varchar2(100),
	r_name varchar2(100),
	r_email varchar2(100),
	r_phone varchar2(100),
	r_gender char(1), -- F or M
	r_class varchar2(100),
	indate date default sysdate,
	journey varchar2(100),
	vihicleId varchar2(50),
	
	primary key(reserv_num)
);


create table board (
	board_num number(6),
	title varchar2(100),
	content varchar2(3000),
	indate date default sysdate,
	primary key(board_num)
);


create table product(
  	product_num number(10),
  	title varchar2(100),
  	content varchar2(4000),
  	image varchar2(500),
  	indate date default sysdate,
  	category varchar2(50),
  	primary key(product_num)
);
	      

create table airLine(
    airLine_num number(6),
    airLine_name varchar2(30),
    image varchar2(100),
    economy_sit number(5),
    prestige_sit number(5),
    primary key(airLine_name)
);

create table banner(
  	banner_num number(10),
  	name varchar2(30),
  	image varchar2(100),
  	oseq number(10),
  	primary key(banner_num)
);


create or replace view view_Product as
   select * from (
      select r.arrivals,count(r.arrivals) as count 
      from reservation r
      group by r.arrivals
      having count(r.arrivals) >=1
) order by count desc;


create or replace view view_bestProduct as
select p.*,v.count
from product p left join view_Product v on p.category = v.arrivals;


create or replace view view_qna as 
select q.qna_num,q.mnum,m.id,m.name,m.email,q.title,q.content,q.indate,q.result,q.reply,
q.readcount,q.imgfilename,q.pass,q.passcheck
from QNA q left join MEMBER m on q.mnum=m.member_num order by q.qna_num desc;


create or replace view view_reserv_economy as 
select r.*,a.airLine_name,a.image,a.economy_sit,a.prestige_sit, concat( r.vihicleId,r.dep_time ) as identity,
		(economy_sit+prestige_sit) as total_sit
from reservation r left join airLine a 
on r.airplane_name = a.airline_name
where r_class ='이코노미석';




create or replace view view_reserv_prestige as 
select r.*,a.airLine_name,a.image,a.economy_sit,a.prestige_sit,concat( r.vihicleId,r.dep_time ) as identity,
		(economy_sit+prestige_sit) as total_sit
from reservation r left join airLine a 
on r.airplane_name = a.airline_name
where r_class ='프레스티지석';


create or replace view view_remain_economy as
select identity,count(identity) as economy_reserved
from view_reserv_economy e
group by e.identity
having count(e.identity) >=1;



create or replace view view_remain_prestige as
select identity,count(identity) as prestige_reserved
from view_reserv_prestige p
group by p.identity
having count(p.identity) >=1;


create or replace view view_economy as
select v.*,e.economy_reserved,(v.economy_sit - e.economy_reserved) as remain_economy
from view_reserv_economy v left join view_remain_economy e 
on v.identity = e.identity;


create or replace view view_prestige as
select v.*,p.prestige_reserved,(v.prestige_sit - p.prestige_reserved) as remain_prestige
from view_reserv_prestige v left join view_remain_prestige p 
on v.identity = p.identity;


create or replace view view_economy_distinct as
select distinct(e.identity),e.economy_sit,e.remain_economy
from view_economy e;


create or replace view view_prestige_distinct as
select distinct(p.identity),p.prestige_sit,p.remain_prestige
from view_prestige p;


insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '아시아나항공', '아시아나.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '대한항공', '대한.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '에어부산', '에어부산.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '에어서울', '에어서울.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '이스타항공', '이스타.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '제주항공', '제주.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '진에어', '진에어.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '티웨이항공', '티웨이.png', 50, 10);

insert into AIRLINE (airline_num, airline_name, image, economy_sit, prestige_sit) 
values (airline_seq.nextval, '하이에어', '하이.png', 50, 10);

insert into admin (id, pwd) values('admin', 'admin');


