const router = require("express").Router();

module.exports = db => {
  router.get("/days", (request, response) => {
    db.query(
      `
      SELECT
        days.id,
        days.name,
        array_agg(DISTINCT appointments.id) AS appointments,
        array_agg(DISTINCT available_interviewers.interviewer_id) AS interviewers,
        (SELECT sum(CASE WHEN interviews.id IS NULL THEN 1 ELSE 0 END) FROM appointments LEFT JOIN interviews ON interviews.appointment_id = appointments.id WHERE appointments.day_id = days.id)::int AS spots
      FROM days
      JOIN appointments ON appointments.day_id = days.id
      JOIN available_interviewers ON available_interviewers.day_id = days.id
      GROUP BY days.id
      ORDER BY days.id
    `
    ).then(({ rows: days }) => {
      response.json(days);
    });
  });

  return router;
};
