# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!

  ROLE_KINDS = %w[
    student
    teacher
    custodian
    administrator
  ].freeze
  serialize :roles, Array
  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  def add_role(role)
    new_roles = roles.push(role).uniq
    filter_roles = new_roles.select { |r| ROLE_KINDS.include?(r) }
    update(roles: filter_roles)
  end

  def remove_role(role)
    filter_roles = roles.reject { |r| r == role }
    update(roles: filter_roles)
  end

  def student?
    roles.include?('student')
  end

  def teacher?
    roles.include?('teacher')
  end

  def custodian?
    roles.include?('custodian')
  end

  def administrator?
    roles.include?('administrator')
  end
end
