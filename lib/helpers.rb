include Nanoc3::Helpers::Rendering

def strip_html(html)
  html.gsub(/(<[^>]*>)|\n|\t/s,"")
end
