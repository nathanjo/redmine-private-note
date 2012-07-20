class PrivateNoteIssuePatch < ActiveRecord::Base
  
  attr_accessible :notes, :issue_id, :journal_id
  
  def self.update_private_note(context)
    if context[:params][:last_journal_id].blank?
      journal_id = Journal.last.id + 1
    else
      journal_id = context[:params][:last_journal_id].to_i + 1;
    end
    context[:params][:private_note][:journal_id] = journal_id;
    PrivateNote.new(context[:params][:private_note]).save
  end
end

module PrivateNotePatch
  class Hooks < Redmine::Hook::ViewListener
    def view_issues_edit_notes_bottom(context={})
      if User.current.allowed_to?(:add_private_note, context[:issue].project)
        context[:controller].send(:render_to_string, {
                                :partial => "issues/issues_edit_form",
                                :locals => context
        })
      end
    end
    
    def controller_issues_edit_before_save(context={})
      if !context[:params][:journal_is_private].blank? || !context[:params][:private_note][:notes].blank?
        if !context[:params][:journal_is_private].blank?
          context[:params][:private_note][:notes] = ''
        end
        PrivateNoteIssuePatch.update_private_note(context)
      end
    end
    
    def view_issues_history_journal_bottom(context={})
    end
  end
end