# frozen_string_literal: true

class RoleSelector
  include Wisper::Publisher
  def call(roles)
    if roles.size > 1
      broadcast(:multi_role)
    elsif roles.size.zero?
      broadcast(:none)
    else
      broadcast(roles.first)
    end
  end
end
