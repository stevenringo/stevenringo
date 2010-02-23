require 'time'

class Nanoc3::Item
  def created_at
    Time.parse(self[:created_at])
  end
end