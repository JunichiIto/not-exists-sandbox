class Translatability < ActiveRecord::Base
  belongs_to :phrase
  belongs_to :translation
end
