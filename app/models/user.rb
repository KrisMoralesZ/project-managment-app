class User < ApplicationRecord
  belongs_to :organization
  acts_as_tenant(:organization)

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # enum :role [admin: 0, member: 1]
  validates :role, presence: true

  before_validation :assign_default_role, on: :create

  def is_admin?
    role == 0
  end

  private

  def assign_default_role
    return if self.role.present?

    if organization && organization.users.count == 0
      self.role = :admin
    else
      self.role = :member
    end
  end
end
