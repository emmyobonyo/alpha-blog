- Create a migration file
- rails generate migration create_articles
- rails db:migrate --> to run the migration file

- Many tables in the DB.
- artciles table
- users table (username, email, password).
- users will create articles. add a user_id (foreign_key: primary key of users table) field in the article. one to many association. a user can create many articles.

- rails generate scaffold User username:string <-- Create a users table>
- rails db:migrate

User.all <-- Get all Users>
User.create(username: "mashrur")

- Add fields to tables : rails generate migration add_user_id_to_artciles

- Add code to the models

- Add User to article when you create them 
-Article.create(title: "Some Article", description: "Description of an article", user_id: user1.id)

Asign a particular user an article
- user_1.articles.build(title: "Some new article", description: "description of some article")

Assign a user to an existing article
user_2.articles << article

### Creating Users

-> rails generate migration create_users #Create User migration file
-> Add fields that you want in the file created under the db folder.
-> Create the user model.

### Create a user
-> User.create(username: "emmyobonyo", email: "emmyobonyo@gmail.com")

### Creating Users
- Users - create users table and model
- Add validation (model)
* username must be present and unique, min 3 max 25
* email address must be present and unique, max 105
* email must be a valid email format, check with email regex

### Error messages 
- user.errors.full_messages

### Assign an article to a user
- user.articles << article
- rails routes --expanded : get routes

### App development process from the end.
- Allow signed users to create articles that will be credited to them.
- Restrict actions from the UI