DELIMITER $$

CREATE FUNCTION check_ticket_count(p_id VARCHAR(20))
RETURNS VARCHAR(50)
DETERMINISTIC

BEGIN
DECLARE msg VARCHAR(50);
DECLARE count INT;
SET count = (SELECT COUNT(*)
FROM TICKET
WHERE passenger_id=p_id AND MONTH(CURRENT_DATE())=MONTH(travel_date)
GROUP BY passenger_id, MONTH(travel_date));
IF count > 3 THEN
SET msg = 'Cannot purchase more tickets';
ELSE
SET msg = 'Can purchase more tickets.';
END IF;
RETURN msg;
END;$$

DELIMITER ;