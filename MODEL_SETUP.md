# Documentação do Model Task

## 📋 Visão Geral

Este documento explica a configuração do Model Task e do Tailwind CSS para o projeto Rails Task Manager.

## 🗄️ Model Task

### Campos da Tabela `tasks`

O model `Task` possui os seguintes campos:

| Campo        | Tipo     | Descrição                     | Obrigatório | Padrão  |
| ------------ | -------- | ----------------------------- | ----------- | ------- |
| `title`      | string   | Título da tarefa              | Sim         | -       |
| `details`    | text     | Descrição detalhada da tarefa | Não         | -       |
| `completed`  | boolean  | Status de conclusão           | Não         | `false` |
| `created_at` | datetime | Data de criação               | Automático  | -       |
| `updated_at` | datetime | Data de atualização           | Automático  | -       |

### Validações

- **title**: Campo obrigatório (presence: true)

### Scopes Disponíveis

Os scopes são atalhos para consultas comuns no banco de dados:

```ruby
# Buscar apenas tarefas concluídas
Task.completed

# Buscar apenas tarefas pendentes
Task.pending

# Buscar tarefas ordenadas da mais recente para a mais antiga
Task.recent
```

### Exemplos de Uso

```ruby
# Criar uma nova tarefa
Task.create(title: "Comprar pão", details: "Ir à padaria")

# Criar uma tarefa já concluída
Task.create(title: "Estudar Rails", details: "Completar exercício", completed: true)

# Buscar todas as tarefas pendentes
tarefas_pendentes = Task.pending

# Buscar tarefas concluídas mais recentes primeiro
tarefas_concluidas = Task.completed.recent

# Marcar uma tarefa como concluída
tarefa = Task.find(1)
tarefa.update(completed: true)
```

## 🎨 Tailwind CSS

### Instalação

O Tailwind CSS foi instalado e configurado no projeto através da gem `tailwindcss-rails`.

### Arquivos Importantes

- **Gemfile**: Adicionada a gem `tailwindcss-rails`
- **app/assets/tailwind/application.css**: Arquivo principal de estilos do Tailwind
- **app/views/layouts/application.html.erb**: Layout principal com classes Tailwind
- **Procfile.dev**: Configuração para iniciar o servidor com compilação automática do Tailwind

### Como Usar

Para iniciar o servidor Rails com compilação automática do Tailwind:

```bash
bin/dev
```

Este comando inicia tanto o servidor Rails quanto o processo de watch do Tailwind CSS.

### Exemplos de Classes Tailwind

Algumas classes úteis já aplicadas no layout:

- `container`: Define um container responsivo
- `mx-auto`: Centraliza horizontalmente
- `mt-28`: Margem superior (28 unidades)
- `px-5`: Padding horizontal (5 unidades)
- `flex`: Ativa flexbox

## 🚀 Próximos Passos

1. ✅ Model Task criado e documentado
2. ✅ Migration executada
3. ✅ Tailwind CSS configurado
4. ⏭️ Criar o TasksController
5. ⏭️ Implementar as rotas CRUD
6. ⏭️ Criar as views com estilização Tailwind

## 📝 Comandos Úteis

```bash
# Criar tarefas no console
rails console

# Executar migrations
rails db:migrate

# Reverter última migration
rails db:rollback

# Iniciar servidor com Tailwind
bin/dev
```
