class Task < ActiveRecord::Base
  attr_accessible :content, :masterid, :name, :status, :project_id
  belongs_to :project
  
  def self.switch
    nst=!self.status
    self.update_attributes({status: nst})
#     self.status=!self.status
  end
end
