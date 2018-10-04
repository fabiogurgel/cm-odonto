class Procedimento < ActiveRecord::Base
  belongs_to :tipo_procedimento
  belongs_to :cliente
  belongs_to :consultorio
end
