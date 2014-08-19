# ===== GENERATING GARBAGE =====
#
# Be sure to run `ruby generate_blog_posts.rb`
# before running this file

require_relative 'helpers'
require 'csv'

class MyApp
  def blog_post_repository
    filename = File.expand_path '../blog_posts.csv', __FILE__
    BlogPostRepository.from_csv filename
  end
  # ...plus, probably lots of other fun things :P
end

BlogPost = Struct.new :author, :date, :title, :body

class BlogPostRepository
  def self.from_csv(filename)
    posts = CSV.foreach(filename, headers: true)
               .map { |row| BlogPost.new row['author'], row['date'], row['title'], row['body'] }
    BlogPostRepository.new(posts)
  end

  def initialize(posts)
    @posts = posts
  end

  def random_post # most useful method evah!
    @posts.sample
  end
end

app = MyApp.new

let_me_make_a_mess! do
  # start with how many objects?
  start_num = number_of_objects_in_existence  # =>

  # omg, lets look at some of the great blogs we could read
  app.blog_post_repository.random_post.title  # =>
  number_of_objects_in_existence              # =>
  app.blog_post_repository.random_post.title  # =>
  number_of_objects_in_existence              # =>
  app.blog_post_repository.random_post.title  # =>
  number_of_objects_in_existence              # =>
  app.blog_post_repository.random_post.title  # =>
  number_of_objects_in_existence              # =>
end

# sleep 30 # <-- uncomment me and check out memory ;)

# Garbage has been collected!
number_of_objects_in_existence # =>
