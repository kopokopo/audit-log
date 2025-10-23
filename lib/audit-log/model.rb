# frozen_string_literal: true

module AuditLog
  module Model
    extend ActiveSupport::Concern

    SENSITIVE_KEYS = %w[pin password secret].freeze

    included do
      self.table_name = AuditLog.config.table_name

      attribute :payload, :jsonb, default: {}
      attribute :request, :jsonb, default: {}

      belongs_to :record, polymorphic: true, required: false
      belongs_to :ownable, polymorphic: true, required: false
      belongs_to :auditable, polymorphic: true, required: false

      validates :action, presence: true

      after_initialize :initialize_payload_request
      before_save :mask_payload_and_request
    end

    def initialize_payload_request
      self.payload ||= {}
      self.request ||= {}
    end

    def mask_payload_and_request
      self.payload = mask_sensitive_data(self.payload)
      self.request = mask_sensitive_data(self.request)
    end

    def user_name
      return "None" if auditable.blank?
      auditable.send(AuditLog.config.user_name_method)
    end

    def action_name
      I18n.t("audit_log.action.#{action}", default: action)
    end

    private

    def mask_sensitive_data(payload = {})
      case payload
      when Hash
        payload.transform_keys(&:to_s).to_h do |key, value|
          if SENSITIVE_KEYS.any? { |word| key.downcase.include?(word) }
            [key, '*****']
          else
            [key, mask_sensitive_data(value)]
          end
        end
      when Array
        payload.map { |v| mask_sensitive_data(v) }
      else
        payload
      end
    end

  end
end
