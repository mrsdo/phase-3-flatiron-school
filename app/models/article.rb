class Article < ApplicationRecord
  validates_presence_of :title
  validates_length_of :title, minimum: 5, allow_blank: false


end
