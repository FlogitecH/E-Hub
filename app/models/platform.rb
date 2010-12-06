class Platform < ActiveRecord::Base
	validates :name, :presence => true
	has_many :games
	has_many :titles, :through => :games
end
