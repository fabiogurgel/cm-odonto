class CreateConsultorios < ActiveRecord::Migration
  def change
    create_table :consultorios do |t|
      t.string :codigo
      t.string :descricao
      t.boolean :proprio

      t.timestamps null: false
    end
  end
end
