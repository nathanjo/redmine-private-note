class CreatePrivateNote < ActiveRecord::Migration
  def self.up
    create_table :private_notes do |t|
      t.column :notes, :string
      t.column :issue_id, :integer
      t.column :journal_id, :integer
    end
  end

  def self.down
    drop_table :private_notes
  end
end
