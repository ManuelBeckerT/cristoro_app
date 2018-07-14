class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.string :comuna
      t.string :calle
      t.integer :numero
      t.string :encargado
      t.integer :telefono
      t.string :correo
      t.integer :contenedores
      t.string :establecimiento

      t.timestamps
    end
  end
end
