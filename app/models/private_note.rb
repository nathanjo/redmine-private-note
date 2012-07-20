class PrivateNote < ActiveRecord::Base
  unloadable

  belongs_to :issue
  belongs_to :user
  
  has_many :journals, :as => :journalized, :dependent => :destroy
  
  attr_accessible :notes, :issue_id, :journal_id

end