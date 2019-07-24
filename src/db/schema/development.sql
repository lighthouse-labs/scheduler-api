WITH days(day) AS (
  VALUES ( 'Monday' ), ( 'Tuesday' ), ( 'Wednesday' ), ( 'Thursday' ), ( 'Friday' )
)
INSERT INTO days (name)
SELECT day FROM days;

WITH times(time) AS (
	VALUES ('12pm'), ('1pm'), ('2pm'), ('3pm'), ('4pm')
)
INSERT INTO appointments (time, day_id)
SELECT time, id as day_id FROM days, times ORDER BY day_id, time;

INSERT INTO interviewers (name, avatar)
VALUES
  ('Sylvia Palmer', 'https://i.imgur.com/LpaY82x.png'),
  ('Tori Malcolm', 'https://i.imgur.com/Nmx0Qxo.png'),
  ('Mildred Nazir', 'https://i.imgur.com/T2WwVfS.png'),
  ('Cohana Roy', 'https://i.imgur.com/FK8V841.jpg'),
  ('Sven Jones', 'https://i.imgur.com/twYrpay.jpg'),
  ('Susan Reynolds', 'https://i.imgur.com/TdOAdde.jpg'),
  ('Alec Quon', 'https://i.imgur.com/3tVgsra.jpg'),
  ('Viktor Jain', 'https://i.imgur.com/iHq8K8Z.jpg'),
  ('Lindsay Chu', 'https://i.imgur.com/nPywAp1.jpg'),
  ('Samantha Stanic', 'https://i.imgur.com/okB9WKC.jpg');

INSERT INTO available_interviewers (day_id, interviewer_id)
SELECT 1 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

INSERT INTO available_interviewers (day_id, interviewer_id)
SELECT 2 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

INSERT INTO available_interviewers (day_id, interviewer_id)
SELECT 3 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

INSERT INTO available_interviewers (day_id, interviewer_id)
SELECT 4 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

INSERT INTO available_interviewers (day_id, interviewer_id)
SELECT 5 as day_id, interviewers.interviewer_id FROM ( SELECT id AS interviewer_id FROM interviewers ORDER BY RANDOM() LIMIT 5 ) interviewers;

WITH
appointments AS (
  SELECT id as appointment_id, day_id FROM appointments ORDER BY RANDOM() LIMIT 10
),
students(name) AS(
  VALUES
    ('Liam Martinez'),
    ('Richard Wong'),
    ('Lydia Miller-Jones'),
    ('Archie Cohen'),
    ('Chad Takahashi'),
    ('Leopold Silvers'),
    ('Maria Boucher'),
    ('Jamal Jordan'),
    ('Michael Chan-Montoya'),
    ('Yuko Smith')
)
INSERT INTO interviews (student, appointment_id, interviewer_id)
SELECT
  DISTINCT ON 
  (s.name) name,
  a.appointment_id AS appointment_id,
  available_interviewers.interviewer_id AS interviewer_id
FROM (
  SELECT
    *, row_number() OVER(ORDER BY appointment_id) AS rnum
  FROM appointments
) AS a
JOIN (
  SELECT
    *, row_number() OVER(ORDER BY name) AS rnum
  FROM students
) AS s
ON a.rnum = s.rnum
JOIN available_interviewers
ON a.day_id = available_interviewers.day_id;
