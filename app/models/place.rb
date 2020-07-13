class Place < ApplicationRecord
  geocoded_by :name
  after_validation :geocode
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end

