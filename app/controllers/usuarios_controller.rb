class UsuariosController < ApplicationController
  def index
    @usuarios = Usuario.all
    render :index
  end

  def create
    Usuario.create nome: params[:nome], email: params[:email], password_digest: params[:password_digest]
    redirect_to usuarios_path
  end

  def update
    Tarefa.update nome: params[:nome], password_digest: params[:password_digest]
    redirect_to tarefas_path
  end

  def destroy
    usuario = Usuario.find params[:id]
    usuario.destroy
    redirect_to usuarios_path
  end
end
