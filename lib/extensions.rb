require 'time'

class Nanoc3::Item
  def created_at
    Time.parse(self[:created_at])
  end
  
  def short_url
    unless self[:short_url].nil? || self[:short_url].empty?
      self[:short_url]
    else
      @site.config[:base_url] + self.reps[0].path
    end
  end
end