class ObjectsToSell < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates :name, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :price, presence: true, length: {maximum: 5}
  validates :image, file_size: { less_than: 2.megabytes }
  
  belongs_to :user
  
end
