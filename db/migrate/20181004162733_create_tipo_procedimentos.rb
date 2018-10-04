class CreateTipoProcedimentos < ActiveRecord::Migration
  def change
    create_table :tipo_procedimentos do |t|
      t.string :codigo
      t.string :descricao
      t.decimal :valor, :precision => 8, :scale => 2

      t.timestamps null: false
    end
  end
end
