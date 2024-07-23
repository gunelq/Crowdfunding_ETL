# Crowdfunding_ETL
Project_2
During this project we worked with team to practice building an ETL pipeline using Python, Pandas. After we transformed the data, we created four CSV files and use the CSV file data to create an ERD and a table schema. Final stage was uploading the CSV file data into a Postgres database.
We created the following Data Frames:
-Category and Subcategory DataFrames
-Campaign DataFrame
-Contacts DataFrame
-Crowdfunding Database

Category and Subcategory DataFrames:


- A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories

- A "category" column that contains only the category titles
- A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories
- A "subcategory" column that contains only the subcategory titles

Campaign DataFrame:
Created a campaign DataFrame has the following columns:

The "cf_id" column
The "contact_id" column
The "company_name" column
The "blurb" column, renamed to "description"
The "goal" column, converted to the float data type
The "pledged" column, converted to the float data type
The "outcome" column
The "backers_count" column
The "country" column
The "currency" column
The "launched_at" column, we renamed to "launch_date" and with the UTC times converted to the datetime format
The "deadline" column, we renamed to "end_date" and with the UTC times converted to the datetime format
The "category_id" column, with unique identification numbers matching those in the "category_id" column of the category DataFrame
The "subcategory_id" column, with the unique identification numbers matching those in the "subcategory_id" column of the subcategory DataFrame

Created the Contacts DataFrame:
We tryied two options for extracting and transforming the data from the contacts.xlsx Excel data:

Option 1: Used Python dictionary methods.

Option 2: Used regular expressions.

Created the Crowdfunding Database

We used the information from the ERD to create a table schema for each CSV file and saved the database schema as a Postgres file named crowdfunding_db_schema.sql, and saved it to your GitHub repository.Created a new Postgres database, named crowdfunding_db.Using the database schema, created the tables in the correct order to handle the foreign keys.Verified the table creation by running a SELECT statement for each table.Imported each CSV file into its corresponding SQL table.Verified that each table has the correct data by running a SELECT statement for each.

* To split each "category & sub-category" column value into "category" and "subcategory" column values, we used df[["new_column1","new_column2"]] = df["column"].str.split().To get the unique category and subcategory values from the "category" and "subcategory" columns, we created a NumPy array where the array length equals the number of unique categories and unique subcategories from each column.To create the category and subcategory identification numbers, used a list comprehension to add the "cat" string or the "subcat" string to each number in the category or the subcategory array, respectively.To convert the "goal" and "pledged" columns to the float data type, used the astype() method.














