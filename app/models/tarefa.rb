class Tarefa < ActiveRecord::Base
  default_scope { order 'id desc' }

  #def self.ativas
  #  where(concluida: false)
  #end
  scope :ativas, -> { where(concluida: false) }
  scope :concluidas, -> { where(concluida: true) }
end
