require 'redmine'
require 'private_note/hooks'

Redmine::Plugin.register :redmine_private_note do
  name 'Redmine Private Note plugin'
  author 'Jonathan Himbing'
  description 'Issue extension that provide private notes that viewable only by permission'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://prometsource.com/people/jonathan-himbing'
  
  project_module :issue_tracking do
    permission(:view_private_note, {})
    permission(:add_private_note, {})
  end
end
