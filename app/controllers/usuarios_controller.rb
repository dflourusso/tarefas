class UsuariosController < ApplicationController
  def create
    Usuario.create nome: params[:nome], email: params[:email], password_digest: params[:password_digest]
    redirect_to :back
  end

  def update
    Tarefa.update nome: params[:nome], password_digest: params[:password_digest]
    redirect_to tarefas_path
  end
end
