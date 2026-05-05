.bail on
.read schema.sql
.read fixtures/data.sql

CREATE TEMP TABLE assert_pass(ok INTEGER CHECK(ok = 1));

INSERT INTO assert_pass
SELECT CASE WHEN COUNT(*) = 3 THEN 1 ELSE 0 END FROM cases;

INSERT INTO assert_pass
SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE 0 END
FROM scored_cases
WHERE score != expected_score OR decision != expected_decision;
