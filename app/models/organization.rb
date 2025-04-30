class Organization < ApplicationRecord
  has_many :users
  accepts_nested_attributes_for :users

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_tenant(:organization)
end
