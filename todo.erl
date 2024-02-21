-module(todo).
-export([start/0, add_task/2, remove_task/1, list_tasks/0]).

%% Armazena as tarefas em uma lista
-data(tasks, []).

%% Inicia a aplicação
start() ->
  io:format("~nBem-vindo à sua lista de tarefas!~n"),
  loop().

%% Loop principal da aplicação
loop() ->
  io:format("~nDigite 'add' para adicionar uma tarefa, 'remove' para remover, 'list' para listar e 'quit' para sair: "),
  Command = io:get_line(""),
  case string:strip(Command) of
    "add" -> add_task_prompt();
    "remove" -> remove_task_prompt();
    "list" -> list_tasks();
    "quit" -> io:format("~nSaindo...~n"), halt();
    _ -> io:format("~nComando inválido. Tente novamente.~n"), loop()
  end,
  loop().

%% Solicita e adiciona uma nova tarefa
add_task_prompt() ->
  io:format("Digite a nova tarefa: "),
  Task = io:get_line(""),
  add_task(string:strip(Task), []),
  io:format("~nTarefa adicionada!~n").

%% Adiciona uma tarefa à lista
add_task(Task, Tasks) ->
  NewTasks = [Task | Tasks],
  put(tasks, NewTasks).

%% Solicita e remove uma tarefa
remove_task_prompt() ->
  io:format("Digite o número da tarefa a ser removida: "),
  IndexStr = io:get_line(""),
  Index = list_to_integer(string:strip(IndexStr)),
  remove_task(Index).

%% Remove uma tarefa da lista
remove_task(Index) ->
  Tasks = get(tasks),
  NewTasks = lists:delete_at(Index, Tasks),
  put(tasks, NewTasks),
  io:format("~nTarefa removida!~n").

%% Lista todas as tarefas
list_tasks() ->
  Tasks = get(tasks),
  io:format("~nLista de Tarefas:~n"),
  lists:foreach(fun(Task) -> io:format("~p. ~s~n", [length(Tasks) - Task + 1, Task]) end, Tasks).
