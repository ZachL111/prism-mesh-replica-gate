CREATE TABLE cases (
  name TEXT PRIMARY KEY,
  demand INTEGER NOT NULL,
  capacity INTEGER NOT NULL,
  latency INTEGER NOT NULL,
  risk INTEGER NOT NULL,
  weight INTEGER NOT NULL,
  expected_score INTEGER NOT NULL,
  expected_decision TEXT NOT NULL CHECK (expected_decision IN ('accept', 'review'))
);

CREATE VIEW scored_cases AS
SELECT
  name,
  demand * 2 + capacity + weight * 6 - latency * 3 - risk * 6 AS score,
  CASE
    WHEN demand * 2 + capacity + weight * 6 - latency * 3 - risk * 6 >= 170
    THEN 'accept'
    ELSE 'review'
  END AS decision,
  expected_score,
  expected_decision
FROM cases;
