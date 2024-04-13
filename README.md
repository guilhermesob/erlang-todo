# erlang-todo
# Lista de Tarefas em Erlang

Este é um simples programa de lista de tarefas escrito em Erlang. Ele permite que você adicione, remova e liste tarefas de uma lista.

## Funcionalidades

- Adicionar tarefas
- Remover tarefas
- Listar tarefas

## Como Usar

Para usar o programa, siga estas etapas:

1. Certifique-se de ter Erlang instalado em seu sistema. Você pode baixá-lo em [Erlang.org](https://www.erlang.org/).
2. Clone este repositório em sua máquina local:

<!--git clone <URL_DO_SEU_REPOSITÓRIO-->
git clone https://github.com/guilhermesob/erlang-todo

3. Navegue até o diretório do projeto:

cd nome-do-diretório

4. Compile o código Erlang:

erlc todo.erl

5. Inicie o programa:

erl -noshell -s todo start -s init stop

6. Siga as instruções fornecidas pelo programa para adicionar, remover ou listar tarefas.

## Contribuindo

Se você quiser contribuir com melhorias ou correções para este programa, siga estas etapas:

1. Faça um fork deste repositório.
2. Crie uma nova branch com o nome da sua funcionalidade ou correção: 

git checkout -b minha-funcionalidade

3. Faça suas alterações e adicione mensagens de commit descritivas.
4. Faça push das suas alterações para o seu fork:

git push origin minha-funcionalidade

5. Envie um pull request para este repositório.

## Versões

- **v0.1:** Funcionalidades básicas implementadas. Adicionar, editar e excluir tarefas.
- **v0.2:** v0.0.2
Funcionalidades Básicas Implementadas:

Persistência de Dados: As tarefas agora são salvas em um arquivo, garantindo que elas não sejam perdidas ao fechar o aplicativo.
Edição de Tarefas: Adicionada a opção de editar tarefas existentes para facilitar atualizações e correções.
Melhorias na Interface do Usuário: Mensagens de confirmação após adicionar, remover ou editar uma tarefa para uma melhor experiência do usuário.

## Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter detalhes.

---
