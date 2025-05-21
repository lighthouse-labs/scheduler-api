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
  ('Sylvia Palmer', '/images/interviewers/3tVgsra_d.webp'),
  ('Tori Malcolm', '/images/interviewers/FK8V841_d.webp'),
  ('Mildred Nazir', '/images/interviewers/iHq8K8Z_d.webp'),
  ('Cohana Roy', '/images/interviewers/LpaY82x_d.webp'),
  ('Sven Jones', '/images/interviewers/Nmx0Qxo_d.webp'),
  ('Susan Reynolds', '/images/interviewers/nPywAp1_d.webp'),
  ('Alec Quon', '/images/interviewers/okB9WKC_d.webp'),
  ('Viktor Jain', '/images/interviewers/T2WwVfS_d.webp'),
  ('Lindsay Chu', '/images/interviewers/TdOAdde_d.webp'),
  ('Samantha Stanic', '/images/interviewers/twYrpay_d.webp');

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
