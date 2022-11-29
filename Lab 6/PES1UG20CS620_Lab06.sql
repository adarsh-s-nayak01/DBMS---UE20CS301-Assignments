-- Name : Adarsh Subhas Nayak
-- SRN:PES1UG20CS620
-- Roll No : 54
-- Data : 11/10/2022
/*1*/
SELECT Train_No, AVG(Distance)
FROM ROUTE_INFO
WHERE To_Station_no - From_Station_no = 1
GROUP BY Train_No;

/*2*/
SELECT Train_No, AVG(Distance)
FROM ROUTE_INFO
WHERE To_Station_no - From_Station_no = 1
GROUP BY Train_No
ORDER BY AVG(Distance) DESC;

 /*3*/
SELECT Train_No, SUM(Distance)
FROM ROUTE_INFO
WHERE To_Station_no - From_Station_no = 1
GROUP BY Train_No
ORDER BY SUM(Distance) DESC;

/*4*/

/*maximum*/
WITH TC (Train_No , No_of_compartments)
as(SELECT Train_Number,
count(*)
FROM COMPARTMENT GROUP BY Train_Number) SELECT
TC.Train_No, T.name from TC, TRAIN T WHERE
TC.No_of_compartments = (SELECT MAX(TC2.No_of_compartments)
FROM TC as TC2) AND TC.Train_no = T.Train_No;

/*minimum*/
WITH TC (Train_No , No_of_compartments)
as(SELECT Train_Number,
count(*)
FROM COMPARTMENT GROUP BY Train_Number) SELECT
TC.Train_No, T.name from TC, TRAIN T WHERE
TC.No_of_compartments = (SELECT MIN(TC2.No_of_compartments)
FROM TC as TC2) AND TC.Train_no = T.Train_No;


/*5*/
SELECT User, phone_no
FROM USER_PHONE
WHERE User = 'ADM_001' OR User = 'USR_006' OR User ='USR_10';

/*6*/
SELECT Train_Type, AVG(FarePerKM)
FROM FARE_TABLE
GROUP BY Train_Type
ORDER BY AVG(FarePerKM) DESC;


/*7*/
SELECT * from TICKET_PASSENGER
WHERE AGE = (SELECT MAX(age) from TICKET_PASSENGER);

/*8*/
SELECT * FROM TICKET_PASSENGER
WHERE name LIKE '%Ullal%';