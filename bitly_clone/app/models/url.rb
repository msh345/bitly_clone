class Url < ActiveRecord::Base
  validates :name, format: { :with => URI::regexp(%w(http https ftp)),
    message: "Only URLs beginning with http://, https://, or ftp:// are allowed"}
  validates :name, :uniqueness => true

  def increment_click_count
  	count = self.click_count
  	count += 1
  	self.update(click_count: count)
  end

end
