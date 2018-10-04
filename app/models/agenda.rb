class Agenda < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :consultorio
end
