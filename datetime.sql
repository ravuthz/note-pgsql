SELECT
    now(),
    now()::date AS "now_date",
    now()::time AS "now_time",
    current_date,
    current_time,
    to_char(now(), 'DD-MM-YY') AS "char_date",
    to_char(now(), 'HH:MM:SS') As "char_time",
    to_char(now(), 'dy') = 'sun',
    to_char(now(), 'Dy') = 'Sun',
    to_char(now(), 'DY') = 'SUN';

SELECT '[2024-03-01, 2024-03-31]'::daterange @> now()::date;
SELECT now()::date BETWEEN '2024-03-01' AND '2024-03-31';
SELECT now()::date >= '2024-03-01' AND now()::date < '2024-03-31';

SELECT 'MON,TUE,WED,THU,FRI,SAT,SUN' LIKE '%' || to_char(now(), 'DY') || '%';
SELECT 'mon,tue,wed,thu,fri,sat,sun' LIKE '%' || to_char(now(), 'dy') || '%';
SELECT upper('mon,tue,wed,thu,fri,sat,sun') LIKE '%' || to_char(now(), 'DY') || '%';
SELECT lower('MON,TUE,WED,THU,FRI,SAT,SUN') LIKE '%' || to_char(now(), 'dy') || '%';


SELECT DATE_TRUNC('day', TIMESTAMP '2005-05-25 11:30');
SELECT DATE_TRUNC('week', TIMESTAMP '2005-05-25 11:30:37');
SELECT DATE_TRUNC('month', TIMESTAMP '2005-05-25 11:30:37');
SELECT DATE_TRUNC('year', TIMESTAMP '2005-05-25 11:30');

SELECT EXTRACT(DAY FROM now());
SELECT EXTRACT(WEEK FROM now());
SELECT EXTRACT(MONTH FROM now());
SELECT EXTRACT(YEAR FROM now());
