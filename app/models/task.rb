class Task < ActiveRecord::Base
  attr_accessible :content, :masterid, :name, :status, :project_id
  belongs_to :project
end
