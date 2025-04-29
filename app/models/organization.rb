class Organization < ApplicationRecord
  acts_as_tenant(:tenant)
end
