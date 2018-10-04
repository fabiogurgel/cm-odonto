class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.string :email
      t.string :telefone
      t.string :celular

      t.timestamps null: false
    end
  end
end
