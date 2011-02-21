class Platform < ActiveRecord::Base
	validates :name, :presence => true
	has_many :games
	has_many :titles, :through => :games
  has_attached_file :image
  
  def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['name LIKE ?', search_condition])
	end
end
