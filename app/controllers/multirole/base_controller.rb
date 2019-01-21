# frozen_string_literal: true

module Multirole
  class BaseController < ApplicationController
    layout 'multirole'
    before_action -> { raise 'You are not student' unless current_user.multirole? }
  end
end
