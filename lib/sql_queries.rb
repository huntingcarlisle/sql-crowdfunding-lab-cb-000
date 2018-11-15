# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"
SELECT projects.title, SUM(pledges.amount) 
FROM projects 
JOIN pledges ON projects.id = pledges.project_id 
GROUP BY(projects.title);"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
"
SELECT users.name, users.age, SUM(pledges.amount) 
FROM users 
JOIN pledges on users.id = pledges.user_id 
GROUP BY(users.name) 
ORDER BY users.name ASC;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"
WITH total_pledges AS (
  SELECT pledges.project_id, SUM(pledges.amount) AS SUM 
  FROM pledges 
  GROUP BY pledges.project_id) 
SELECT projects.title, (total_pledges.SUM - projects.funding_goal) AS over_goal
FROM projects 
JOIN total_pledges ON projects.id = total_pledges.project_id 
WHERE over_goal >= 0;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
"
WITH total_pledges AS (
  SELECT pledges.user_id, 
  SUM(pledges.amount) AS SUM 
  FROM pledges 
  GROUP BY pledges.user_id) 
SELECT users.name, total_pledges.SUM 
FROM users 
JOIN total_pledges 
ON users.id = total_pledges.user_id 
ORDER BY total_pledges.SUM, users.name;
  "
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"
SELECT projects.category, pledges.amount
FROM projects
JOIN pledges ON projects.id = pledges.project_id
WHERE projects.category = 'music';
"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"
SELECT projects.category AS ct, SUM(pledges.amount) AS sm
FROM projects
JOIN pledges ON projects.id = pledges.project_id
GROUP BY ct
HAVING ct = 'books';
"
end
