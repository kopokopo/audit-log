# frozen_string_literal: true

module AuditLog
  module Model
    extend ActiveSupport::Concern

    included do
      self.table_name = AuditLog.config.table_name

      serialize :payload, JSON
      serialize :request, JSON

      belongs_to :record, polymorphic: true, required: false
      belongs_to :ownable, polymorphic: true, required: false
      belongs_to :auditable, polymorphic: true, required: false

      validates :action, presence: true

      after_initialize :initialize_payload_request
    end

    def initialize_payload_request
      self.payload = {} if payload.nil?
      self.request = {} if request.nil?
    end

    def user_name
      return "None" if auditable.blank?
      auditable.send(AuditLog.config.user_name_method)
    end

    def action_name
      I18n.t("audit_log.action.#{action}", default: action)
    end
  end
end
