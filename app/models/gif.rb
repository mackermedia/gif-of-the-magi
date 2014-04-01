class Gif < ActiveRecord::Base
  validates :url, :presence => true
end
