class TarefasController < ApplicationController
  before_action :count_all, only: [:index, :ativas, :concluidas, :edit]

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
    redirect_to :back
  end

  def destroy_concluidas
    Tarefa.destroy_all concluida: true
    redirect_to tarefas_path
  end

  def toogle
    Tarefa.find(params[:id]).toggle! :concluida
    redirect_to :back
    end

  def create
    Tarefa.create titulo: params[:tarefa], concluida: false
    redirect_to :back
  end

  def edit
    @tarefa = Tarefa.find params[:id]
    @tarefas = get_tarefas_edit
    render :index
  end

  def update
    Tarefa.update params[:id], titulo: params[:titulo]
    redirect
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

  def redirect
    redirect_to case params[:list]
      when 'concluidas' then concluidas_tarefas_path
      when 'ativas' then ativas_tarefas_path
      else tarefas_path
    end
  end

  def get_tarefas_edit
    case params[:list]
      when 'concluidas' then Tarefa.concluidas
      when 'ativas' then Tarefa.ativas
      else Tarefa.all
    end
  end
end
