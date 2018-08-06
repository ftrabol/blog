class Hero < ActiveRecord::Base
    validates :name, :presence => true
    validates :powers, :presence => true
  end