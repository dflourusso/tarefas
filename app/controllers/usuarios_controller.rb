class UsuariosController < ApplicationController
  def create
    Usuario.create nome: params[:nome], email: params[:email], senha: params[:senha]
    redirect_to :back
  end

  def update
    Tarefa.update nome: params[:nome], senha: params[:senha]
    redirect_to tarefas_path
  end
end
