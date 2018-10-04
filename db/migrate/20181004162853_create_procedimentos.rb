class CreateProcedimentos < ActiveRecord::Migration
  def change
    create_table :procedimentos do |t|
      t.string :codigo
      t.references :tipo_procedimento, index: true, foreign_key: true
      t.references :cliente, index: true, foreign_key: true
      t.references :consultorio, index: true, foreign_key: true
      t.datetime :data

      t.timestamps null: false
    end
  end
end
