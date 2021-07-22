USE twitter;
SELECT * FROM tweets ;
INSERT INTO tweets (tweet, user_id, created_at) values('gracias gracias no se molesten', 3, NOW());
SELECT * FROM tweets ;
SELECT tweet FROM tweets where user_id=3;
UPDATE tweets SET tweet = 'NOPE', updated_at = NOW() WHERE id = 15;
DELETE FROM tweets WHERE id >12;