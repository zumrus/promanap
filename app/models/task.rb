class Task < ActiveRecord::Base
  attr_accessible :content, :masterid, :name, :status, :project_id
  belongs_to :project
  has_and_belongs_to_many :users

end
