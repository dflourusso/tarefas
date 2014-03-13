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
    Tarefa.create titulo: params[:tarefa], concluida: false
    redirect_to tarefas_path
  end

  def edit
    @tarefa = Tarefa.find params[:id]
    @tarefas = Tarefa.all
    count_all
    render :index
  end

  def update
    Tarefa.update params[:id], titulo: params[:titulo]
    redirect_to tarefas_path
  end

private

  def count_all
    count_concluidas
    count_ativas
    count_totais
  end

  def count_concluidas
    @count_concluidas = Tarefa.concluidas.count
  end

  def count_ativas
    @count_ativas = Tarefa.ativas.count
  end

  def count_totais
    @count_totais = Tarefa.all.count
  end

end
