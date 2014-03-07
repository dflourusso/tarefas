class TarefasController < ApplicationController
  def index
    @tarefas = Tarefa.all
  end

  def ativas
    @tarefas = Tarefa.where concluida: false
    render :index
    end

  def concluidas
    @tarefas = Tarefa.where concluida: true
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
    tarefa = Tarefa.find params[:id]
    tarefa.concluida = !tarefa.concluida
    tarefa.save
    redirect_to tarefas_path
  end
end