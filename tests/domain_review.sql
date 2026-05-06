.bail on
.read domain_review.sql
.read fixtures/domain_review.sql

CREATE TEMP TABLE domain_assert(ok INTEGER CHECK(ok = 1));

INSERT INTO domain_assert
SELECT CASE WHEN COUNT(*) = 5 THEN 1 ELSE 0 END FROM domain_review_cases;

INSERT INTO domain_assert
SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE 0 END
FROM domain_review_scored
WHERE score != expected_score OR lane != expected_lane;
