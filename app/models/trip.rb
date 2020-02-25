class Trip < ApplicationRecord
  has_many :packages
  belongs_to :user
  scope :sorted_by_origin, lambda { order("origin ASC") }
end
