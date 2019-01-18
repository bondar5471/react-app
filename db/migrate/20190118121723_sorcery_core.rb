# frozen_string_literal: true

class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :inn, :string, null: false
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string

    add_index :users, :inn, unique: true
  end
end
