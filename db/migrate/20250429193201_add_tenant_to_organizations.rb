class AddTenantToOrganizations < ActiveRecord::Migration[8.0]
  def change
    add_reference :organizations, :tenant, null: false, foreign_key: true
  end
end
