create database Upike_Coleman_College_Ryan_Jacob_Andrew;
use Upike_Coleman_College_Ryan_Jacob_Andrew;
-- 1 Create the Tables
Create table students (
	Student_ID INT Auto_Increment Primary Key, 
    Student_Fname Varchar(45) Not Null,
    Student_Lname varchar(45) Not Null,
    Student_Email varchar(45) Unique Not Null,
    Expected_Grad_Year Year,
    Student_City Varchar(45),
    Student_State Varchar(45),
    Student_Address Varchar(45),
	Major_Id INT Not Null,
    Advisor_Id INT Not NULL
);

Create Table Staff (
	Staff_id Int Auto_Increment Primary Key,
	Staff_Fname Varchar(45) Not Null,
	Staff_Lname Varchar(45) Not Null,
    Staff_Email varchar(45) Unique Not Null,
    Staff_Rank varchar(255) Not Null,
    Staff_Dept INT Not Null
);

Create Table Major (
	Major_Id INT Auto_increment Primary Key,
    Major_Name Varchar(45) Not Null
);

Create Table Department (
	Department_Id INT Auto_increment Primary Key,
    Department_Name Varchar(45) Not Null
);

Create Table Alumni (
	Alumni_Id INT Auto_Increment Primary Key,
	Alumni_Fname Varchar(45) Not Null,
    Alumni_Lname varchar(45) Not Null,
    Alumni_Email varchar(45) Unique Not Null,
    Alumni_Grad_Year Year,
    Alumni_City Varchar(45),
    Alumni_State Varchar(45),
    Alumni_Address Varchar(45)
);

Create Table Course (
# Course code is varchar(7) Because courses are formatted like ITM-360
	Course_Code Varchar(7) Primary Key,
    Course_Title Varchar(45) Not Null,
    Course_Description VarChar(255) Not Null,
    Course_Credit int,
    Course_Dept INT
);

Create Table Enrolled (
	Student_Id INT,
    Class_ID varchar(9),
	Date_Enrolled Date
);

Create Table classes (
# Varchar(9) Because classes go up to 8 characters like ITM-360-A
	Class_Id Varchar(9) Primary Key,
    Class_Start_Time varchar(45),
    Class_End_Time Varchar(45),
    Class_Days Varchar(45),
    Course_Code Varchar(7),
    Professor_Id Int,
    Room_Id Int,
    Semester_Id Int
);

Create Table Semester (
	Semester_id INT Auto_Increment Primary Key,
    Semester_Year Year,
    Semester_Term varchar(45) Not Null,
    Semester_Start_Date Date,
    Semester_End_Date date
);

Create table Inventory (
	Item_ID Int Auto_Increment Primary Key,
    Item_name Varchar(45) Not Null Unique,
    Item_Quantity int,
    Item_price Decimal(10,2)
);

Create table Room (
	Room_Id int auto_increment Primary Key,
    Room_type Varchar(45) Not Null
);

Create Table Resources (
	Resource_Id Int Auto_increment primary Key,
    Resource_type Varchar(45),
    Resource_locations Int Not Null
);

-- 2 Creating the foreign keys and the cascade rules
Alter table Staff  
ADD CONSTRAINT Staff_Dept FOREIGN KEY (Staff_Dept) REFERENCES Department(Department_ID) 
ON DELETE cascade;

Alter table Students 
ADD CONSTRAINT Major_Id FOREIGN KEY (Major_Id) REFERENCES Major(Major_ID) 
ON DELETE CASCADE;


Alter Table Students
Add Constraint Advisor_Id Foreign Key (Advisor_Id) References Staff(Staff_ID)
ON Delete Cascade;

Alter Table Course
Add Constraint Course_Dept Foreign Key (Course_Dept) References Department(Department_ID)
On Delete Cascade;

Alter Table Enrolled
Add Constraint Student_Id Foreign Key (Student_Id) References Students(Student_Id)
On Delete Cascade;

Alter Table Enrolled
Add Constraint Class_Id Foreign Key (Class_Id) References Classes(Class_Id)
On Delete cascade;

Alter Table Classes
Add Constraint Course_Code Foreign Key (Course_Code) References Course(Course_Code)
On Delete Cascade;

Alter Table Classes
Add Constraint Professor_Id Foreign Key (Professor_id) References Staff(Staff_id)
On Delete Cascade;

Alter Table Classes
Add Constraint Room_Id Foreign Key (Room_id) References Room(Room_Id)
On delete Cascade;

Alter Table Classes
Add Constraint Semester_Id Foreign Key (Semester_Id) References Semester(Semester_Id)
On Delete Cascade;

Alter table Resources
Add constraint Resource_locations Foreign Key (Resource_locations) References Room(Room_Id)
On Delete Cascade;

-- 4 Data Insertion
insert into major (Major_ID, Major_Name) 
values (1, 'Business_Management'),
(2,'ITM'),
(3, 'Accounting');

Insert into Department (Department_Id, Department_Name)
values  (1, 'Business_Management'),
(2,'ITM'),
(3, 'Accounting'),
(4,'Entrepreneurship'),
(5, 'Economics');

Insert into Room (Room_Id, Room_type)
values (101, 'Computer Lab'),
(102, 'Professor office'),
(103, 'Computer Lab'),
(104, 'Professor Office'),
(201, 'Lecture Hall'),
(202, 'Lecture Hall'),
(203,'Lecture Hall');

Insert into Semester(Semester_id,Semester_Year,Semester_Term ,Semester_Start_Date ,Semester_End_Date)
Values (1, 2024, "Spring","2024-01-08", "2024-05-03"),
(2, 2024, "Summer", "2024-06-03", "2024-07-03"),
(3, 2024,'Fall', '2024-07-26',"2024-12-14"),
(4, 2025, 'Spring', "2025-01-09", "2025-05-05"),
(5,2025,'Summer', "2025-06-02","2025-07-02");

insert into Staff (Staff_Id,Staff_Fname,Staff_Lname,Staff_Email,Staff_Rank,Staff_Dept)
Values (1,'Praveen','Guraja', 'PraveenGuraja@upike.edu','Assistant Professor', 2),
(2,'Chris','Harris','ChrisHarris@upike.edu', 'Dean', 1),
(3,'Amitava','Bapi', 'AmitavaBoseBapi@upike.edu', 'Assistant Professor',2),
(4,'Gregory','Green', 'GregoryGreen@upike.edu', 'Associate Professor', 5),
(5, 'Jared','Arnett', 'JaredArnett@upike.edu', 'Entrepreneur in Residence', 4),
(6, 'Sherrie', 'Little', 'SherriLittle@upike.edu', 'Office Assistant',1),
(7, 'Keerthi', 'Andukuri', 'KeerthiAndukuri@upike.edu' , 'Assistant Professor', 3),
(8, 'Michelle','Johnston', 'MichelleJohnston@upike.edu', 'Assistant Professor', 1),
(9, 'Ayden', 'Vitatoe', 'AydenVitatoe@upike.edu', 'Assistant Professor', 3),
(10,'Brenda','Maynard', 'BMaynard@upike.edu', 'Associate Professor', 1),
(11, 'Brandi','Gollihue', 'BrandiGollihue@upike.edu', 'Adjunct Professor', 3);

insert into Course ( Course_Code,Course_Title,Course_Description, Course_Credit, Course_Dept)
values ('ITM-360', 'Advanced Database Management Systems', 'A class to deepen your knowledge of database sysetms', 3, 2),
('BUS-231', 'Principles of Accounting 1', 'A course to introduce students to accounting fundamentals', 3, 3),
('ECN-201','Principles of Macroeconomics','Overview of economics, concepts, and institutions', 3,5),
('BUS-344', 'Applications of Taxation', 'Practical applications of taxation using professional tax return preparation software', 1,3),
('BUS-325', 'Principles of Management ','An examination of the principles and techniques underlying successful organization ', 3,1),
('BUS-206', 'The Entrepreneurial Mindset', "introduces entrepreneurship as an approach to life and one's career", 3, 4),
('ITM-298', ' Internship in ITM 1', 'This course allows the student to gain experience in an Information Technology Management (ITM) work position',1,2),
('ITM-398', 'Internship in ITM 2', 'This course allows the student to gain  advanced technical experience in an Information Technology Management (ITM) work position', 2,2),
('ECN-202','Principles of Microeconomics','Theories of production, determination of prices, and distribution of income in regulated and unregulated industries', 3,5),
('BUS-406', 'New Venture Creation', 'This course is a hands-on experience for students who want to learn the process of how to create an innovation-based new venture. ',3, 4);

#Online or Internship classes get a default room of 102 which is the office room their professor is located
Insert into classes (Class_ID, Class_Start_Time, Class_End_Time, Class_Days, Course_Code, Professor_Id, Room_ID, Semester_Id)
values ('BUS-231-A', "10:00AM", "10:50AM", 'MWF','BUS-231', 11, 201,1),
('BUS-231-B', '9:30AM', '10:45AM', 'TTh', 'BUS-231', 7,202,1),
('ITM-360-A', '12:00PM', '1:15PM', 'TTh', 'ITM-360', 3, 101, 3), 
('ECN-201-A', '8:00AM', '8:50AM', 'MWF', 'ECN-201', 4, 201, 1),
('BUS-231-C', '1:00PM', '1:50PM', 'MWF', 'BUS-231', 9,202,1),
('BUS-206-A', '1:30PM', '2:45PM', 'TTh', 'BUS-206', 5, 202, 3),
('BUS-325-A', 'N/A','N/A', 'Online', 'BUS-325',10,102, 2),
('ITM-298-A', 'N/A','N/A', 'Internship', 'ITM-298', 1,102,3),
('BUS-406-A', '10:00AM', '10:50AM', 'MWF', 'BUS-406',5, 201,4),
('ECN-202-A', '8:00AM', '9:15AM', 'TTh', 'ECN-202', 4, 201, 1);

Insert into Students (Student_Id, Student_Fname, Student_Lname,Student_Email, Expected_Grad_Year, Student_City, Student_State, Student_address,Major_Id, Advisor_ID)
values (1, 'Jacob', 'Colwell','JacobColwell@upike.edu', 2025, 'Pikeville', 'Kentucky', '113 Winners Circle', 2, 1),
(2, 'Ryan', 'Price','JamesPrice@upike.edu', 2027, 'Pikeville', 'Kentucky', '354 Patrick Drive', 2, 1),
(3, 'Alejandro', 'Rodriguez','AlejandroRodriguez@upike.edu', 2024, 'Sain Joan', 'Catalonia', '201 Runner Road', 2, 3),
(4, 'Peyton', 'Compton','PeytonCompton@upike.edu', 2026, 'Pikeville', 'Kentucky', '301 flyers Avenue', 1, 10),
(5, 'Reginald', 'Whyte','ReginaldWhyte@upike.edu', 2025, 'Sacremento', 'California', '195 Soft Street', 2, 3),
(6, 'Haley', 'Grabowski', 'HaleyGrabowski@upike.edu', 2027, 'New York', 'New York', '934 Famous Road',3, 7), 
(7, 'Oscar', 'Moore','OscarMoore@upike.edu', 2025, 'Raleigh', 'North Carolina', '515 Boulevard Circle', 1, 8),
(8, 'Mark', 'Prewitt','MarkPrewitt@upike.edu', 2026, 'Corbin', 'Kentucky', '718 Running Man Drive', 3, 9),
(9, 'Anthony','Aguilar', 'AnthonyAguilar@upike.edu', 2025, 'Gastonia', 'North Carolina', '623 Lavender Road', 1,4),
(10, 'Alexander','Fedyszyn', 'AlexanderFedyszyn@upike.edu',2028, 'Grafton', 'Ohio', ' 472 Rosewood Park', 1, 4);

Insert into Enrolled( Student_ID, Class_ID, Date_Enrolled)
values ( 1, 'ITM-360-A', '2024-05-23'),
(2, 'ITM-360-A', '2024-05-23'),
(6, 'BUS-231-A', '2024-06-01'),
(8, 'BUS-231-B','2024-05-15'),
(5, 'ITM-360-A', '2024-05-28'),
(4, 'BUS-325-A', '2024-04-03'),
(3, 'BUS-206-A', '2024-05-20'),
(10, 'BUS-231-C', '2024-06-05'),
(9,'ECN-202-A', '2023-10-25'),
(7, 'ECN-201-A', '2023-11-05'),
(2, 'ITM-298-A', '2024-05-20');


Insert into Alumni (Alumni_Id, Alumni_Fname,Alumni_Lname, Alumni_Email, Alumni_Grad_Year,Alumni_City, Alumni_State, Alumni_Address)
values (1, 'Lindsey', 'Scaggs', 'LindseyScaggs@gmail.com', 2022,'Pikeville', 'Kentucky','332 Winners Road'),
(2, 'Jon', 'Barragan', 'JonBarraganBarranchea@yahoo.com', 2024, 'Lasarte Oria', 'Euskara', '876 runners hyperroad'),
(3, 'Rebecca', 'Diamond', "RebeccaDiamond@gmail.com", 2022, 'Pikeville', 'Kentucky', '985 Ron Burchett Street'),
(4, 'Jillian' , 'Perez', 'JillianPerez@icloud.com', 2024, 'Pikeville','Kentucky', '1972 Runwheel Drive'),
(5, 'Evan', 'Vanlierop', 'EvanVanlierop@outlook.com', 2023, 'Cincinnati', 'Ohio', '553 Sycamore Drive'),
(6,'Kameron', 'Hattaway', 'KamHatteway@icloud.com', 2022, 'Miami', 'Florida','323  Harriet Road'),
(7, 'Ivan','Perez', 'IvanPerez@outlook.com', 2024, 'Conover','North Carolina', ' 228 Vanser Lane'),
(8, 'Coby','Blaclman', 'CozyBlackman@icloud.com',2022,'Colombia', 'Tennessee', '772 Young Avennue'),
(9, 'Dustyn', 'Reinstetle', 'DustynReinstetle@upike.edu',2018, 'Russell', 'Kentucky', '532 Ronway Drive'),
(10, 'Adam', 'Collins', 'AdamCollins@pike.kyschools.us',2024, 'Prestonsburg', 'Kentucky', '275 Edger Avenue');


Insert into Inventory (Item_ID,Item_name,Item_Quantity,Item_price)
values ( 1,'Pencil', 35, .30),
(2, 'Paper', 1000, .05),
(3, 'Computer', 43, 135.00),
(4, 'Mouse', 43, 12.23),
(5, 'Keyboard', 43, 23.42),
(6,'Chairs', 86, 45.32),
(7,'Tables', 13, 75.00);

Insert Into Resources (Resource_Id,Resource_type,Resource_locations)
values (1, 'Pencil', 102),
(2,'Computer', 103),
(3, 'Table', 201),
(4, 'Table', 202),
(5, 'Keyboard', 103),
(6, 'Mouse', 103), 
(7, 'Paper',102),
(8, 'Chairs', 101),
(9, 'Computers', 101),
(10,'paper', 104),
(11, 'Pencil', 104);


-- 5 The Queries
# 1 Retrieve all courses taken by a specific student.
Select *
from enrolled
where Student_ID = 2;

# 2 List all faculty members in a particular department.
SELECT concat(Staff.Staff_Fname, ' ',Staff.Staff_Lname) AS faculty_name, Department.department_name
FROM Staff
JOIN Department ON Staff.Staff_DEpt = Department.department_id
Where Department.Department_name = 'ITM';

#3 Count the number of students enrolled in a specific course.
Select Count(Student_ID)
from enrolled
where Class_ID = 'ITM-360-A';

# 4 Retrieve courses offered by the college along with the faculty teaching them.
Select Classes.Class_ID,  concat(Staff.Staff_Fname, ' ',Staff.Staff_Lname) AS faculty_name
FROM Classes
JOIN Staff ON Staff.Staff_ID= Classes.Professor_Id;

# 5 Display all departments and the number of faculty members in each department.
Select department.department_name,count(Staff.Staff_Dept) As 'Number of Faculty in a department'
FROM department
JOIN Staff ON Staff.Staff_Dept= department.Department_ID
Group by Department.department_name