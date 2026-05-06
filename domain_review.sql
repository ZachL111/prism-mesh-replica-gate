CREATE TABLE domain_review_cases (
  name TEXT PRIMARY KEY,
  focus TEXT NOT NULL,
  signal INTEGER NOT NULL,
  slack INTEGER NOT NULL,
  drag INTEGER NOT NULL,
  confidence INTEGER NOT NULL,
  expected_score INTEGER NOT NULL,
  expected_lane TEXT NOT NULL
);

CREATE VIEW domain_review_scored AS
SELECT
  name,
  focus,
  signal * 2 + slack + confidence - drag * 3 AS score,
  CASE
    WHEN signal * 2 + slack + confidence - drag * 3 >= 140 THEN 'ship'
    WHEN signal * 2 + slack + confidence - drag * 3 >= 105 THEN 'watch'
    ELSE 'hold'
  END AS lane,
  expected_score,
  expected_lane
FROM domain_review_cases;
