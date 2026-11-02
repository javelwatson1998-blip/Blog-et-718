# ET-718 / ET-713 Rails Midterm — Blog

This is a complete **Rails application source overlay** for the blog tutorial linked from [ET718 Phase 2](https://et718.com/posts/my-first-post/). It includes article CRUD, comments, validation, relationships, SQLite migrations, and administrator HTTP Basic Authentication.

## Quick start

Install Ruby and Rails 7.2 first. Run these commands in a terminal from the directory containing this extracted folder:

```bash
rails new blog --database=sqlite3 --skip-test --skip-javascript --skip-hotwire
cd blog
```

Copy all files **inside** `et718-rails-midterm` into `blog`, replacing matching files (the supplied files are an overlay for the generated Rails app). Keep the Rails-generated files that are not in this folder. The project includes a `Gemfile`, `config/routes.rb`, controllers, models, views, CSS, and migrations.

```bash
bundle install
bin/rails db:prepare
bin/rails db:seed
BLOG_ADMIN_USER=admin BLOG_ADMIN_PASSWORD=your-private-password bin/rails server
```

Open http://localhost:3000. **Set a unique password** before you share or deploy the app; the example default is not safe. On Windows PowerShell, use `$env:BLOG_ADMIN_USER="admin"; $env:BLOG_ADMIN_PASSWORD="your-private-password"; bin/rails server`.

If your instructor requires AWS Cloud9, generate the Rails app there and copy the overlay files into its project folder. Rails 7.2 is used instead of the obsolete `sqlite3 ~> 1.3.6` line from the 2022 webpage. This is not deployed or pushed to GitHub automatically.

## Features
- View all articles, newest first
- Create, read, edit and delete articles
- Validate required titles and body text
- Add and delete comments on each article
- Automatically delete dependent comments when an article is deleted
- Basic admin authentication for article editing/deletion and comment deletion
- Responsive layout and example seed data

## MVC / REST map
- Model: `app/models/article.rb`, `app/models/comment.rb`
- View: `app/views/articles/`, `app/views/layouts/`
- Controller: `app/controllers/articles_controller.rb`, `app/controllers/comments_controller.rb`
- Routes: `config/routes.rb`
- SQL schema migrations: `db/migrate/`

## GitHub submission

After the Rails project starts successfully:

```bash
git add .
git commit -m "Build ET-718 Rails blog midterm"
git remote add origin YOUR_GITHUB_REPOSITORY_URL
git push -u origin main
```

If `git remote add origin` says it already exists, use `git remote set-url origin YOUR_GITHUB_REPOSITORY_URL` instead. Check your branch with `git branch --show-current` and use its name if not `main`.

## Notes
The linked Rails guide is written for Rails 5. This implementation follows its blog/articles/comments objectives but targets Rails 7.2, so the exact source is not byte-for-byte the old tutorial. Not tested end-to-end here because Rails dependencies were unavailable in the build environment.
