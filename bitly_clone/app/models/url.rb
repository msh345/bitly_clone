class Url < ActiveRecord::Base
  def increment_click_count
  	count = self.click_count
  	count += 1
  	self.update(click_count: count)
  end

end
