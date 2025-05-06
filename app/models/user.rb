class User < ApplicationRecord
  belongs_to :organization
  acts_as_tenant(:organization)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, member: 1 }
  validates :role, presence: true
  def is_admin?
    role == 'admin'
  end
end
