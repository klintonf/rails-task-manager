# Migration para criar a tabela de tarefas (tasks)
class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      # Título da tarefa (texto curto)
      t.string :title
      
      # Detalhes da tarefa (texto longo)
      t.text :details
      
      # Status de conclusão da tarefa (por padrão é falso/não concluída)
      t.boolean :completed, default: false

      # Campos automáticos de data de criação e atualização
      t.timestamps
    end
  end
end
