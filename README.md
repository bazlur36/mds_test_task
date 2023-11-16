# README

Test task on rails users import  for MetaDesign Solutions

Steps to setup and Solutions:

**1. Clone the repo:**

* Clone the repo `git clone git@github.com:bazlur36/mds_test_task.git`

**2. Install Dependencies:**

* Navigate to cloned folder `cd mds_test_task`

* Install dependencies running `bundle install`

**3. Database Setup:**

* Make sure you have created `database.yml`

* Create Database running `rails db:create`

* Run migrations with `rails db:migrate`

**4. Run the Server:**

* Start the Rails server by running `rails server`

**5. Browse the application:**

* Navigate to desired page - **http://localhost:3000/users**

* Upload the file located at **public/TaskSampleSheetCustom.xlsx**

* Click **Import** Button to import excel sheet and inspect the outcome

**5. Run tests:**

Unit test codes located at __spec/models/user_spec.rb__

Integration test codes located at __spec/requests/excel_upload_spec.rb__
* Run `bundle exec rspec` from bash

