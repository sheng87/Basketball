class AddUserToPlayer < ActiveRecord::Migration[6.1]
  def change
    add_reference(:players, :user)
  end
end
