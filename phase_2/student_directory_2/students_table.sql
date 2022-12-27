CREATE TABLE cohorts (
  id SERIAL PRIMARY,
  cohort_name text,
  starting_date date
);

CREATE TABLE students (
  id SERIAL PRIMARY,
  name text,
  cohort_id int,
  constraint fk_cohort foreign key(cohort_id) references cohorts(id)
  on delete cascade    
);