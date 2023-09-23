# frozen_string_literal: true

module AuditLog
  module ControllerHelper
    # Create an audit log
    #
    # audit!(:edit_account, @account, payload: account_params, auditable: auditable, ownable: ownable)
    def audit!(action, auditable, record = nil, payload: nil, ownable: nil)
      AuditLog.audit!(action, auditable, record, payload: payload, request: request, ownable: ownable)
    end
  end
end
