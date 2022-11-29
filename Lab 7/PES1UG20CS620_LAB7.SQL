/*------- Before all tasks are executed we execute these commands based on guidelines--------*/
INSERT INTO ticket (PNR, Train_No, Travel_date, passenger_ID,arrival_time, departure_time, Train_Type, compartment_type,compartment_no, arrival, departure) VALUES ('PNR021', 62621,'2021-10-22','USR_008','20:30:00','16:00:00','Superfast' ,'I Class','F01','Chennai','Bengaluru' );
update train set source = trim(source) , destination = trim(destination);



/*--------Task 1--------------------*/
select user_id,user_type,firstname,lastname from train_user inner
join ticket on train_user.user_id = ticket.passenger_id where departure
= 'Bengaluru' and arrival = 'Chennai' and travel_date between
'2021-10-01' and '2022-08-31';

/*--------Task 2--------------------*/
SELECT train_user.user_id, user_type, firstname, lastname 
FROM train_user, ticket
WHERE ticket.Departure = 'Bengaluru' AND ticket.Arrival = 'Chennai'
AND EXISTS
		(SELECT train_user.User_ID, User_Type, Firstname, Lastname 
        FROM train_user, ticket
		WHERE ticket.Travel_Date BETWEEN '2022-08-01' AND '2022-08-31' AND ticket.Travel_Date BETWEEN '2021-10-01' AND '2021-10-31');

/*--------Task 3--------------------*/
select user_id,user_type,firstname,lastname 
from train_user inner join ticket on train_user.user_id = ticket.passenger_id 
where departure = 'Bengaluru' and arrival = 'Chennai' and travel_date not between '2021-10-01' and '2021-10-31' and travel_date between '2022-08-01' and '2022-08-31';

/*--------Task 4--------------------*/
SELECT U1.user_id, user_Type, firstname, lastname
FROM ticket as T1, train_user as U1
WHERE T1.passenger_id = U1.user_id
AND T1.Departure = 'Bengaluru' AND T1.Arrival = 'Chennai'
AND EXISTS (SELECT pnr FROM ticket AS Ti WHERE T1.passenger_id = Ti.passenger_id 
AND Ti.Departure = 'Chennai' AND Ti.Arrival = 'Bengaluru' AND (DATEDIFF(Ti.Travel_Date,T1.Travel_Date) BETWEEN 0 AND 7));

/*--------Task 5--------------------*/
SELECT U1.User_ID, User_Type, firstname, lastname
FROM ticket as T1, train_user as U1
WHERE T1.passenger_ID = U1.User_ID
AND T1.Departure = 'Bengaluru' AND T1.Arrival = 'Chennai'
AND NOT EXISTS(SELECT pnr FROM ticket AS TIC WHERE T1.passenger_ID = TIC.passenger_ID 
AND TIC.Departure = 'Chennai' AND TIC.Arrival = 'Bengaluru');