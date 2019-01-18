# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RoleSelector do
  describe '#call' do
    it 'broadcast multi_role if there are several roles' do
      service = RoleSelector.new
      expect { service.call(%w[admin teacher]) }.to broadcast(:multi_role)
    end
    it 'broadcast none rhere are not loles' do
      service = RoleSelector.new
      expect { service.call([]) }.to broadcast(:none)
    end
    User::ROLE_KINDS.each do |kind|
      it "broadcast #{kind} role" do
        service = RoleSelector.new
        expect { service.call([kind]) }.to broadcast(kind.to_sym)
      end
    end
  end
end
