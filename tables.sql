drop table if exists STUDENT;
CREATE TABLE STUDENT( 
    STU_ID INTEGER PRIMARY KEY NOT NULL,
    STU_FNAME VARCHAR(20) NOT NULL,
    STU_LNAME VARCHAR(20) NOT NULL,
    STU_GPA DECIMAL NOT NULL,
    HOLD BOOLEAN NOT NULL,
    PASSWORD VARCHAR(20) NOT NULL,
    STU_MAJOR VARCHAR(20) NOT NULL,
    STU_CLASS VARCHAR(20) NOT NULL
);

drop table if exists SEMESTER;
CREATE TABLE SEMESTER( 
    SEM_ID VARCHAR(20) NOT NULL,
    SEM_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY(SEM_ID)
);

drop table if exists DEPARTMENT;
CREATE TABLE DEPARTMENT(
    DEP_ID VARCHAR(20) NOT NULL,
    DEP_NAME VARCHAR(20) NOT NULL,
    DEP_ADVISOR VARCHAR(20) NOT NULL,
    PRIMARY KEY(DEP_ID)
);

drop table if exists PROFESSOR;
CREATE TABLE PROFESSOR(
    PROF_ID INTEGER NOT NULL,
    PROF_FNAME VARCHAR(20) NOT NULL,
    PROF_LNAME VARCHAR(20) NOT NULL,
    DEP_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (PROF_ID),
    FOREIGN KEY (DEP_ID) REFERENCES DEPARTMENT(DEP_ID)
); 

drop table if exists COURSE;
CREATE TABLE COURSE(
    CRS_ID INTEGER NOT NULL,
    CRS_NAME VARCHAR(20) NOT NULL,
    CRS_TIME VARCHAR(20) NOT NULL,
    CRS_CREDIT INTEGER NOT NULL,
    DEP_ID VARCHAR(20) NOT NULL,
    PROF_ID INTEGER NOT NULL,
    PRIMARY KEY (CRS_ID),
    FOREIGN KEY (PROF_ID) REFERENCES PROFESSOR(PROF_ID),
    FOREIGN KEY (DEP_ID) REFERENCES DEPARTMENT(DEP_ID)
);

drop table if exists REGISTRATION;
CREATE TABLE REGISTRATION(
    SEM_ID VARCHAR(20) NOT NULL,
    STU_ID INTEGER NOT NULL,
    CRS_ID INTEGER NOT NULL,
    FOREIGN KEY (SEM_ID) REFERENCES SEMESTER(SEM_ID),
    FOREIGN KEY (STU_ID) REFERENCES STUDENT(STU_ID),
    FOREIGN KEY (CRS_ID) REFERENCES COURSE(CRS_ID),
    PRIMARY KEY (SEM_ID, STU_ID, CRS_ID)
); 


insert into student values (02837732, "Macaya", "Jones", 4.0, 0, "monkey32", "Information Systems", "Junior");
insert into student values (02813848, "Tanner", "Frye", 3.5, 1, "passwd", "Information Systems", "Senior");
insert into student values (02789435, "Dequan", "Walters", 3.8, 0, "whatever", "Supply Chain Management", "Senior");
insert into student values (02739861, "Rachel", "Johnson", 2.8, 1, "ilovedogs", "Supply Chain Management", "Junior");

insert into semester values( "FA2020", "FALL 2020");
insert into semester values( "SP21", "SPRING 2021");

insert into department values( "IS001", "Information Systems", "Allison Bryant");
insert into department values( "SC002", "Supply Chain", "Charles Jones");

insert into professor values ( 1111, "Deborah", "Akers", "SC002");
insert into professor values ( 2222, "Onika", "Miraj", "IS001"); 
insert into professor values ( 3333, "Samara", "Savage", "IS001");
insert into professor values ( 4444, "Leroy", "Jameson", "SC002");
insert into professor values ( 5555, "Dejah", "Jones", "IS001");
insert into professor values ( 6612, "Deshaun", "Lopez", "IS001");
insert into professor values ( 7813, "Teondre", "Vance", "SC002");
insert into professor values ( 2520, "Taylor", "Smith", "IS001");
insert into professor values ( 5480, "Ahmyah", "Bussie", "SC002");

insert into course values( 0123, "Database Management", "Tues/Thursday 9:40-11", 3, "IS001", 2520);
insert into course values( 0456, "Intro to Software Design", "Tues/Thursday 9:40-11", 3, "IS001", 2222);
insert into course values( 0789, "Procurement", "Tues/Thursday 9:40-11", 3, "SC002", 1111);
insert into course values( 0012, "Project Management", "MWF  2:10-3:30", 3, "SC002", 4444);
insert into course values( 0034, "Logistics", "MWF  12:40-2:00", 3, "SC002", 6612);
insert into course values( 0056, "Intro to Network Security", "MWF  12:40-2:00", 3, "IS001", 5555);
insert into course values( 0078, "Java", "MWF  11:10-12:30", 3, "IS001", 2520);
insert into course values( 0090, "IS Consulting", "MWF  11:10-12:30", 3, "IS001", 2222);
insert into course values( 0001, "IS Consulting", "Tues/Thursday 3:30-5:00", 3, "SC002", 5480);
insert into course values( 0002, "Network Security", "Tues/Thursday TBA", 3, "SC002", 5480);
