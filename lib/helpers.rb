include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::LinkTo

def strip_html(html)
  html.gsub(/(<[^>]*>)|\n|\t/s,"")
end

def collated_posts
  collated = Hash.new {|h,k| h[k] = Hash.new {|h,k| h[k] = Hash.new {|h,k| h[k] = [] } } }
  sorted_articles.each do |post|
    collated[post.created_at.year][post.created_at.month][post.created_at.day] << post
  end
  return collated
end