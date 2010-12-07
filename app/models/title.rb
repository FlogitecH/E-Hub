class Title < ActiveRecord::Base
	validates :name, :presence => true
	has_many :games
	has_many :platforms, :through => :games
end
