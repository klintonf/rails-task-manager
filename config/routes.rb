Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Rota raiz - página inicial da aplicação aponta para a lista de tarefas
  root "tasks#index"

  # Rotas CRUD para tarefas (Tasks)
  # GET /tasks - Lista todas as tarefas
  get "tasks", to: "tasks#index"
  
  # GET /tasks/new - Formulário para criar nova tarefa
  get "tasks/new", to: "tasks#new", as: :new_task
  
  # POST /tasks - Cria uma nova tarefa
  post "tasks", to: "tasks#create"
  
  # GET /tasks/:id - Mostra detalhes de uma tarefa específica
  get "tasks/:id", to: "tasks#show", as: :task
  
  # GET /tasks/:id/edit - Formulário para editar uma tarefa
  get "tasks/:id/edit", to: "tasks#edit", as: :edit_task
  
  # PATCH /tasks/:id - Atualiza uma tarefa existente
  patch "tasks/:id", to: "tasks#update"
  
  # DELETE /tasks/:id - Remove uma tarefa
  delete "tasks/:id", to: "tasks#destroy"
end
