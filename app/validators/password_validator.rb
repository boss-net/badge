# frozen_string_literal: true

class PasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless BadPassword.exists?(forbidden: value.downcase)

    record.errors.add attribute,
                      options[:message] ||
                      I18n.t('error_messages.known_bad_password')
  end
end
