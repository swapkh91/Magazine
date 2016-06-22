class AssociateUser < ActiveRecord::Migration
  def up
    change_table :articles do |t|
      t.integer :user_id
    end
  end

  def down
  end
end
