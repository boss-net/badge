# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)

    record.errors.add attribute, (options[:message] ||
      I18n.t('error_messages.not_an_email'))
  end
end
