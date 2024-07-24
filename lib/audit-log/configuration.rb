# frozen_string_literal: true

module AuditLog
  class Configuration
    # user name method, default: "name"
    attr_accessor :user_name_method

    # set a special table_name for AuditLog Model, default: 'audit_logs'
    attr_accessor :table_name

    #auditable identifiers methods, defaults: "auditable_identifier_one" and "auditable_identifier_two respectively"
    attr_accessor :identifier_one_method, :identifier_two_method
  end
end
