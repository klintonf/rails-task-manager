# Controller responsável por gerenciar as tarefas (Tasks)
# Implementa todas as operações CRUD: Create, Read, Update, Delete
class TasksController < ApplicationController
  # before_action: executa o método set_task antes das ações especificadas
  # Isso evita repetição de código para buscar a tarefa pelo ID
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # Lista todas as tarefas ordenadas da mais recente para a mais antiga
  def index
    @tasks = Task.all.order(created_at: :desc)
  end

  # GET /tasks/:id
  # Mostra os detalhes de uma tarefa específica
  # A tarefa é carregada automaticamente pelo before_action :set_task
  def show
    # @task já está disponível através do before_action
  end

  # GET /tasks/new
  # Exibe o formulário para criar uma nova tarefa
  def new
    @task = Task.new
  end

  # POST /tasks
  # Cria uma nova tarefa com os dados do formulário
  def create
    @task = Task.new(task_params)
    
    # Tenta salvar a tarefa no banco de dados
    if @task.save
      # Se salvar com sucesso, redireciona para a página da tarefa criada
      redirect_to task_path(@task), notice: "Tarefa criada com sucesso!"
    else
      # Se houver erros de validação, renderiza novamente o formulário
      render :new, status: :unprocessable_entity
    end
  end

  # GET /tasks/:id/edit
  # Exibe o formulário para editar uma tarefa existente
  # A tarefa é carregada automaticamente pelo before_action :set_task
  def edit
    # @task já está disponível através do before_action
  end

  # PATCH /tasks/:id
  # Atualiza uma tarefa existente com os dados do formulário
  def update
    # Tenta atualizar a tarefa com os novos dados
    if @task.update(task_params)
      # Se atualizar com sucesso, redireciona para a página da tarefa
      redirect_to task_path(@task), notice: "Tarefa atualizada com sucesso!"
    else
      # Se houver erros de validação, renderiza novamente o formulário
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  # Remove uma tarefa do banco de dados
  def destroy
    @task.destroy
    # Redireciona para a lista de tarefas após deletar
    redirect_to tasks_path, notice: "Tarefa removida com sucesso!"
  end

  private

  # Busca uma tarefa específica pelo ID
  # Método privado usado pelo before_action
  def set_task
    @task = Task.find(params[:id])
  end

  # Define quais parâmetros são permitidos ao criar/atualizar uma tarefa
  # Isso é uma medida de segurança (Strong Parameters)
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
