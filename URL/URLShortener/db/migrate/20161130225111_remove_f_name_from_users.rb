class RemoveFNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fnames
  end
end
