class AddDeletedAt < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :deleted_at,  :datetime
    add_index :players, :deleted_at
  end
end
