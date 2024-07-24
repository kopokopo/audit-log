class AddAuditableIdentifiers < ActiveRecord::Migration[5.2]
  def change
    add_column :audit_logs, :auditable_identifier_one, :string
    add_column :audit_logs, :auditable_identifier_two, :string
  end
end