# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181004164919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "consultorio_id"
    t.datetime "data"
    t.boolean  "confirmado"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "agendas", ["cliente_id"], name: "index_agendas_on_cliente_id", using: :btree
  add_index "agendas", ["consultorio_id"], name: "index_agendas_on_consultorio_id", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "email"
    t.string   "telefone"
    t.string   "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consultorios", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.boolean  "proprio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "procedimentos", force: :cascade do |t|
    t.string   "codigo"
    t.integer  "tipo_procedimento_id"
    t.integer  "cliente_id"
    t.integer  "consultorio_id"
    t.datetime "data"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "procedimentos", ["cliente_id"], name: "index_procedimentos_on_cliente_id", using: :btree
  add_index "procedimentos", ["consultorio_id"], name: "index_procedimentos_on_consultorio_id", using: :btree
  add_index "procedimentos", ["tipo_procedimento_id"], name: "index_procedimentos_on_tipo_procedimento_id", using: :btree

  create_table "tipo_procedimentos", force: :cascade do |t|
    t.string   "codigo"
    t.string   "descricao"
    t.decimal  "valor",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "profile"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "agendas", "clientes"
  add_foreign_key "agendas", "consultorios"
  add_foreign_key "procedimentos", "clientes"
  add_foreign_key "procedimentos", "consultorios"
  add_foreign_key "procedimentos", "tipo_procedimentos"
end
