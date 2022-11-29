/* 
Name : Adarsh S Nayak
SRN : PES1UG20CS620
Section : K
Roll No : 54
*/
/*1.Update price of the ticket.*/
CREATE VIEW view1 AS
SELECT pnr,ticket.train_no,departure,arrival,distance,fare_per_km FROM route_info
JOIN ticket ON (route_info.from_station_name = ticket.departure AND route_info.to_station_name = ticket.arrival AND route_info.train_no = ticket.train_no)
JOIN fare ON (ticket.train_type = fare.train_type AND ticket.compartment_type = fare.compartment_type);

CREATE VIEW view2 AS
SELECT pnr, COUNT(pnr) AS Passenger_Count FROM ticket_passenger GROUP BY pnr;

update payment_info inner join view1 on (payment_info.PNR = view1.PNR) inner join view2 on (view1.PNR = view2.PNR) set payment_info.Price = view1.Distance * view1.FarePerKM * view2.passenger_no

/*2. Retrieve the all stations along route of the Trains along with the distance between subsequent stations*/

select distinct source,destination,distance,From_station_name,To_station_name,t.Train_No from train as t inner join route_info as r on t.Train_no=r.Train_no;

/*3.Retrieve the Train no of train which is leaving Bengaluru and arriving at Chennai with compartments availability greater than 10*/

select route_info.Train_no from route_info join compartment on route_info.Train_No=compartment.Train_number where compartment.Availability>10 && route_info.From_Station_Name='Bengaluru' && route_info.To_Station_Name='Chennai'; 

/*4.Retrieve first and last name of users who have booked a ticket with price greater than 500*/

 select distinct Fname,Lname from (ticket as t join payment_info as py on t.pnr = py.pnr) join train_user as tu on t.user_id = tu.user_id where py.price>400;

/*5. Retrieve the first name, last name, DOB and ticket PNR if they’ve bought it for all users.*/

select distinct Fname,Lname,DOB,PNR from ticket t left outer join train_user u ON u.User_ID = t.User_ID;

/*6. Retrieve the first name, last name,of the Users who have not bought a ticket.*/

select Fname, Lname from train_user u left outer join ticket t on u.User_ID= t.User_ID where PNR is null;

/*7. Retrieve the ticket PNR, Train number, travel date and along with all users first name and last name.*/

select PNR, Train_No, Travel_Date, FName, LName from ticket t right outer join train_user u on t.User_ID = u.User_ID;

/*8. Retrieve the train_user id if they’ve traveled in a train along with train id and name of all trains.*/

select User_ID , t.Train_no, name from ticket right outer join train as t on t.Train_no = ticket.Train_no;

/*9. Retrieve the train no and name of trains whose destination is not Mangaluru and distance is not less than 100km and departure time is not 8:30:00 PM. */

select Train_no , name from train where Train_no IN ( select Train_No from ticket where Arrival != "Mangaluru" and Departure_Time != '20:30:00' and Train_No in (select Train_no from route_info where Distance > 100));

/*10. Retrieve the train_User ID who has spent more ticket price than the average ticket price.*/

select User_ID from ticket where PNR in (select PNR from payment_info where Price > (select avg(Price) from payment_info));
