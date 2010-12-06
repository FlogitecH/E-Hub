class Game < ActiveRecord::Base
  belongs_to :platform
  belongs_to :title
end
