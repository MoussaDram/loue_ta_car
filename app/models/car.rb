class Car < ApplicationRecord
  validates :model, presence: true
  validates :brand, presence: true
  validates :year, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
