-- How to create indexes for faster SQL searching

-- Indexes are faster than sequential scans
-- It may take time to create indexes but it makes the databse more effficient

CREATE INDEX index_name ON table_name[method]
(
column_name_1 ASC,
optional_additional_column_2 DESC
);

-- Specify index name
-- Name the table
-- Specify the index mthod (B-tree, hash, gist, gin)
-- List the columns to be stored in the index
-- Specify the order(DESC) + Nulls for first or last

-- Can use EXPLAIN to see if the quesry uses an index

CREATE INDEX student_id_index ON registration(student_id);
CREATE INDEX date_index ON registration(date);
CREATE INDEX city_index ON student(city);