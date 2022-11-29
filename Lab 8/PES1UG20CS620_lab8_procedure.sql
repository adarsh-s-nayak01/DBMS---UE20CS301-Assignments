DELIMITER $$
CREATE PROCEDURE update_age_in_table (
IN user_id VARCHAR(20), OUT msg VARCHAR(30)
)

BEGIN
DECLARE age_ INT;
DECLARE dob_ DATE;

SET age_ = (SELECT age FROM train_user WHERE train_user.user_id=user_id);
SET dob_ = (SELECT dob FROM train_user WHERE train_user.user_id=user_id);

IF age_ IS NULL THEN
SET msg = 'Updating age';
UPDATE train_user SET age=DATEDIFF(CURRENT_DATE(), dob_)/365
WHERE train_user.user_id=user_id;
ELSE
SET msg = 'Already updated';
END IF;

END$$
DELIMITER ;