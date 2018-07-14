class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.datetime :fecha_llamado
      t.datetime :fecha_retiro
      t.string :status

      t.timestamps
    end
  end
end
