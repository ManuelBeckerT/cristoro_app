class AddRegisterToCall < ActiveRecord::Migration[5.1]
  def change
    add_reference :calls, :register, foreign_key: true
  end
end
