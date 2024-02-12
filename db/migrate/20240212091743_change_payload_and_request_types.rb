# frozen_string_literal: true
class ChangePayloadAndRequestToJsonbInAuditLogs < ActiveRecord::Migration[5.2]
  def self.up
    change_column :audit_logs, :payload, :jsonb
    change_column :audit_logs, :request, :jsonb
  end

  def self.down
    change_column :audit_logs, :payload, :text
    change_column :audit_logs, :request, :text
  end
end
