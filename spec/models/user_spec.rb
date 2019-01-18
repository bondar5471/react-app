# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#add_roles' do
    it 'add new role fore user' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      expect(user.roles.size).to eq(1)
    end
    it 'no repit user roles' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      user.add_role('student')
      expect(user.roles.size).to eq(1)
    end
    it 'does not not existingrole' do
      user = FactoryBot.create(:user)
      user.add_role('test')
      expect(user.roles.size).to eq(0)
    end
  end
  describe '#remove_roles' do
    it 'remove role fore user' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      user.remove_role('student')
      expect(user.roles.size).to eq(0)
    end
    it 'return nill if not existing role' do
      user = FactoryBot.create(:user)
      user.remove_role('student')
      expect(user.roles.size).to eq(0)
    end
  end
  describe '#student?' do
    context 'when has student role' do
      user = FactoryBot.create(:user)
      user.add_role('student')
      it 'return true' do
        expect(user.student?).to eq(true)
      end
    end
    context 'when has not student role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.student?).to eq(false)
      end
    end
  end
  describe '#teacher?' do
    context 'when has teacher role' do
      user = FactoryBot.create(:user)
      user.add_role('teacher')
      it 'return true' do
        expect(user.teacher?).to eq(true)
      end
    end
    context 'when has not teacher role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.teacher?).to eq(false)
      end
    end
  end
  describe '#custodian?' do
    context 'when has custodian role' do
      user = FactoryBot.create(:user)
      user.add_role('custodian')
      it 'return true' do
        expect(user.custodian?).to eq(true)
      end
    end
    context 'when has not custodian role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.custodian?).to eq(false)
      end
    end
  end
  describe '#administrator?' do
    context 'when has administrator role' do
      user = FactoryBot.create(:user)
      user.add_role('administrator')
      it 'return true' do
        expect(user.administrator?).to eq(true)
      end
    end
    context 'when has not administrator role' do
      user = FactoryBot.create(:user)
      it 'return false' do
        expect(user.administrator?).to eq(false)
      end
    end
  end
  describe '#full name' do
    it 'Return full name' do
      user = User.new(first_name: 'Sergey',
                      last_name: 'Bondarenko',
                      middle_name: 'Nikolaevich')
      expect(user.full_name).to eq('Bondarenko Sergey Nikolaevich')
    end
  end
end
