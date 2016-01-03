class Phrase < ActiveRecord::Base
  has_many :translatabilities
  has_many :translations, through: :translatabilities
  has_many :voices
end
