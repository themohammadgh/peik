class User < ApplicationRecord
  has_many :packages
  has_many :trips
  #has_one_attached :image
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable

  scope :sorted_by_name, lambda { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end
end

class User < ApplicationRecord
  has_many :packages
  has_many :trips
  #has_one_attached :image
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :confirmable

  scope :sorted_by_name, lambda { order("last_name ASC, first_name ASC") }

  def name
    "#{first_name} #{last_name}"
    # Or: first_name + ' ' + last_name
    # Or: [first_name, last_name].join(' ')
  end
end
