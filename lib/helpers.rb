include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Blogging
include Nanoc3::Helpers::LinkTo

def strip_html(html)
  html.gsub(/(<[^>]*>)|\n|\t/s,"")
end
