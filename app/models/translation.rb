class Translation < ActiveRecord::Base
  has_many :translatabilities
  has_many :phrases, through: :translatabilities
end
