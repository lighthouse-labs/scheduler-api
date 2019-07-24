const request = require("supertest");
const generateApplication = require("../../application");

describe("Days", () => {
  let app;

  beforeAll(() => {
    app = generateApplication("test");
  });

  afterEach(async () => {
    await request(app).post("/api/debug/reset");
  });

  afterAll(async () => {
    await app.close();
  });

  test("GET /api/days", async () => {
    await request(app)
      .get("/api/days")
      .expect(200, [
        {
          id: 1,
          name: "Monday",
          appointments: [1, 2],
          interviewers: [1, 2],
          spots: 1
        },
        {
          id: 2,
          name: "Tuesday",
          appointments: [3, 4],
          interviewers: [1, 2],
          spots: 2
        }
      ]);
  });
});
