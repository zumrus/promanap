class Project < ActiveRecord::Base
  attr_accessible :hostid, :name
  has_and_belongs_to_many :users
  has_many :tasks, dependent: :destroy
  
end
