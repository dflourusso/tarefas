class TarefasController < ApplicationController
  def index
    @tarefas = Tarefa.all
    count_all
  end

  def ativas
    @tarefas = Tarefa.where concluida: false
    count_all
    render :index
    end

  def concluidas
    @tarefas = Tarefa.where concluida: true
    count_all
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

private

  def count_all
    count_concluidas
    count_ativas
    count_totais
  end

  def count_concluidas
    @count_concluidas = Tarefa.where(concluida: true).count
  end

  def count_ativas
    @count_ativas = Tarefa.where(concluida: false).count
  end

  def count_totais
    @count_totais = Tarefa.all.count
  end

end
