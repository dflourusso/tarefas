class TarefasController < ApplicationController
  def index
    @tarefas = Tarefa.all
    @count_concluidas = Tarefa.where(concluida: true).count
  end

  def ativas
    tarefas = Tarefa.all
    @tarefas = tarefas.where concluida: false
    @count_concluidas = tarefas.where(concluida: true).count
    render :index
    end

  def concluidas
    @tarefas = Tarefa.where concluida: true
    @count_concluidas = @tarefas.count
    render :index
  end

  def destroy
    tarefa = Tarefa.find params[:id]
    tarefa.destroy
    redirect_to tarefas_path
  end

  def destroy_concluidas
    Tarefa.destroy_all concluida: true
    redirect_to tarefas_path
  end

  def toogle
    Tarefa.find(params[:id]).toggle! :concluida
    redirect_to tarefas_path
    end

  def create
    tarefa = Tarefa.new
    tarefa.titulo = params[:tarefa]
    tarefa.concluida = false
    tarefa.save
    redirect_to tarefas_path
  end
end