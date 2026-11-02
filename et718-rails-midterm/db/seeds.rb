if Article.count.zero?
  article = Article.create!(title: "Welcome to the Blog", body: "This is my Ruby on Rails blog for the ET-718 midterm. Here I can write articles, edit posts, and have conversations in the comments. This app demonstrates models, views, controllers, database relationships, routes, and full CRUD operations.")
  article.comments.create!(commenter: "Visitor", body: "Welcome! Looking forward to more posts.")
  Article.create!(title: "What I Learned About Rails", body: "Ruby on Rails uses the MVC design pattern: models work with data, views show information to users, and controllers handle web requests. Rails also uses RESTful routes to create, read, update and delete records.")
end
