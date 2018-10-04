class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.references :cliente, index: true, foreign_key: true
      t.references :consultorio, index: true, foreign_key: true
      t.datetime :data
      t.boolean :confirmado

      t.timestamps null: false
    end
  end
end
