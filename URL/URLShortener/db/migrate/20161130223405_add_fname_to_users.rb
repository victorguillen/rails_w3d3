class AddFnameToUsers < ActiveRecord::Migration
  def change

    add_column :users, :fnames, :string, null: false
  end
end
