-module(todo).
-export([start/0, add_task/1, remove_task/1, edit_task/2, list_tasks/0]).

%% Inicia a aplicação
start() ->
    io:format("~nBem-vindo à sua lista de tarefas!~n"),
    load_tasks(),
    loop().

%% Loop principal da aplicação
loop() ->
    io:format("~nDigite 'add' para adicionar uma tarefa, 'remove' para remover, 'edit' para editar, 'list' para listar e 'quit' para sair: "),
    Command = io:get_line(""),
    case string:strip(Command) of
        "add" -> add_task_prompt();
        "remove" -> remove_task_prompt();
        "edit" -> edit_task_prompt();
        "list" -> list_tasks();
        "quit" -> io:format("~nSaindo...~n"), halt();
        _ -> io:format("~nComando inválido. Tente novamente.~n"), loop()
    end.

%% Solicita e adiciona uma nova tarefa
add_task_prompt() ->
    io:format("Digite a nova tarefa: "),
    Task = io:get_line(""),
    add_task(string:strip(Task)),
    io:format("~nTarefa adicionada!~n").

%% Adiciona uma tarefa à lista
add_task(Task) ->
    Tasks = get_tasks(),
    NewTasks = [Task | Tasks],
    put(tasks, NewTasks),
    save_tasks(NewTasks).

%% Solicita e remove uma tarefa
remove_task_prompt() ->
    io:format("Digite o número da tarefa a ser removida: "),
    IndexStr = io:get_line(""),
    case string:strip(IndexStr) of
        IndexStr when IndexStr >= "1" ->
            Index = list_to_integer(IndexStr),
            remove_task(Index);
        _ ->
            io:format("~nNúmero inválido. Tente novamente.~n")
    end.

%% Remove uma tarefa da lista
remove_task(Index) ->
    Tasks = get_tasks(),
    case Index > length(Tasks) of
        true ->
            io:format("~nTarefa não encontrada. Tente novamente.~n");
        false ->
            NewTasks = lists:delete_at(Index, Tasks),
            put(tasks, NewTasks),
            save_tasks(NewTasks),
            io:format("~nTarefa removida!~n")
    end.

%% Solicita e edita uma tarefa
edit_task_prompt() ->
    io:format("Digite o número da tarefa a ser editada: "),
    IndexStr = io:get_line(""),
    case string:strip(IndexStr) of
        IndexStr when IndexStr >= "1" ->
            Index = list_to_integer(IndexStr),
            edit_task(Index);
        _ ->
            io:format("~nNúmero inválido. Tente novamente.~n")
    end.

%% Edita uma tarefa existente
edit_task(Index) ->
    Tasks = get_tasks(),
    case Index > length(Tasks) of
        true ->
            io:format("~nTarefa não encontrada. Tente novamente.~n");
        false ->
            io:format("Digite a nova tarefa: "),
            NewTask = io:get_line(""),
            NewTasks = lists:sublist(Tasks, Index - 1) ++ [string:strip(NewTask)] ++ lists:nthtail(Index, Tasks),
            put(tasks, NewTasks),
            save_tasks(NewTasks),
            io:format("~nTarefa editada!~n")
    end.

%% Lista todas as tarefas
list_tasks() ->
    Tasks = get_tasks(),
    io:format("~nLista de Tarefas:~n"),
    lists:foreach(fun(Task) -> io:format("~p. ~s~n", [length(Tasks) - Task + 1, Task]) end, Tasks).

%% Funções auxiliares
get_tasks() ->
    case get(tasks) of
        undefined -> [];
        Tasks -> Tasks
    end.

load_tasks() ->
    case file:consult("tasks.txt") of
        {ok, Tasks} -> put(tasks, Tasks);
        {error, _} -> put(tasks, [])
    end.

save_tasks(Tasks) ->
    file:write_file("tasks.txt", io_lib:format("~p.~n", [Tasks])).
