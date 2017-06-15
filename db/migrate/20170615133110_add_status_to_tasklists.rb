class AddStatusToTasklists < ActiveRecord::Migration[5.0]
  def change
    add_column :tasklists, :status, :text
  end
end
