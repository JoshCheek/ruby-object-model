ALL_WORDS = File.read("/usr/share/dict/words").each_line.map(&:chomp)
num_blogs = (ARGV.first || 1000).to_i

def words(n)
  n.times.map { ALL_WORDS.sample }.join(' ')
end

require 'csv'
filename = File.expand_path '../blog_posts.csv', __FILE__
CSV.open(filename, "wb") do |csv|
  csv << ["author", "date", "title", "body"]

  num_blogs.times do
    author = words(2)
    date   = Date.today - rand(1000)
    title  = words 1 + rand(10)
    body   = words 100 + rand(1000)
    csv << [author, date, title, body]
  end
end
