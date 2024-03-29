class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :tasks

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body


def self.search(search)
  if search
    self.find_by_email("#{search}")
#     find(:all, :conditions => ['email LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end


end
