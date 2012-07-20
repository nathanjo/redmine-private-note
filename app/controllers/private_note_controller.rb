class PrivateNoteController < InheritedResources::Base
  unloadable

  default_search_scope :issues
  
  before_filter :find_project
  before_filter :authorize
  before_filter :require_admin, :only => :destroy
  
  def create
    @note = PrivateNote.find(params[:private_note])
    @note.save  
  private
  
  def list
    @project = Project.find(params[:project_id])
  end
  
  def issues_edit_form
    PrivateNote.new(params[:private_note]).save
  end
  
  def issues_history
    @private_note = PrivateNote.find(4)
  end
  
  def find_project
    @project = Project.find(params[:project_id])
  end

end