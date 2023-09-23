# frozen_string_literal: true

module AuditLog
  class Configuration
    # user name method, default: "name"
    attr_accessor :user_name_method

    # set a special table_name for AuditLog Model, default: 'audit_logs'
    attr_accessor :table_name
  end
end
