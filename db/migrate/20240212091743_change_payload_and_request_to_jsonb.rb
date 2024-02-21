# frozen_string_literal: true
class ChangePayloadAndRequestToJsonb < ActiveRecord::Migration[5.2]
  def self.up
    change_column :audit_logs, :payload, :jsonb, using: 'payload::JSONB'
    change_column :audit_logs, :request, :jsonb, using: 'request::JSONB'
  end

  def self.down
    change_column :audit_logs, :payload, :text, using: 'payload::TEXT'
    change_column :audit_logs, :request, :text, using: 'request::TEXT'
  end
end
