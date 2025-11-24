# Model Task - representa uma tarefa no sistema
# 
# Campos:
# - title (string): título da tarefa
# - details (text): detalhes/descrição da tarefa
# - completed (boolean): indica se a tarefa foi concluída (padrão: false)
# - created_at (datetime): data de criação automática
# - updated_at (datetime): data de última atualização automática
class Task < ApplicationRecord
  # Validações: garantem que os dados sejam válidos antes de salvar no banco
  validates :title, presence: true # O título é obrigatório
  
  # Scopes: atalhos para consultas comuns
  scope :completed, -> { where(completed: true) }     # Tarefas concluídas
  scope :pending, -> { where(completed: false) }      # Tarefas pendentes
  scope :recent, -> { order(created_at: :desc) }      # Tarefas mais recentes primeiro
end
