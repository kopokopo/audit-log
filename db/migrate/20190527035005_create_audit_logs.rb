# frozen_string_literal: true

class CreateAuditLogs < ActiveRecord::Migration[5.2]
  def change
    create_table "audit_logs", force: :cascade do |t|
      t.string "action", null: false
      t.bigint "record_id"
      t.string "record_type"
      t.bigint "ownable_id"
      t.string "ownable_type"
      t.bigint "auditable_id"
      t.string "auditable_type"
      t.text "payload"
      t.text "request"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index %w[record_type record_id], using: :btree
      t.index %w[ownable_type ownable_id], using: :btree
      t.index %w[auditable_type auditable_id], using: :btree
      t.index ["action"], using: :btree
    end
  end
end
