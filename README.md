# Flutter CRUD

Aplicativo Flutter que demonstra um fluxo completo de cadastro de usuários (CRUD) utilizando `provider` para gerenciamento de estado. A solução oferece uma lista dinâmica de usuários, formulário de criação/edição com validação e confirmação de remoção com `AlertDialog`.

<img width="397" height="759" alt="image" src="https://github.com/user-attachments/assets/0342eec4-f385-45db-b41c-78d6c9324006" />

<img width="394" height="749" alt="image" src="https://github.com/user-attachments/assets/38928fbc-d266-41af-a570-d4d1840c0aed" />

<img width="386" height="721" alt="image" src="https://github.com/user-attachments/assets/682545c8-18f3-4a9e-bdda-68b01ccf945b" />

## Visão Geral

- **Plataformas**: Android, iOS, Web, Windows, macOS e Linux (projeto multi-plataforma gerado pelo Flutter).
- **Estado**: `Provider` (`ChangeNotifier`) com fonte de dados inicial em memória (`dummy_users`).
- **Funcionalidades principais**:
  - Listagem de usuários com avatar, nome e e-mail.
  - Inclusão e edição de usuários em formulário validado.
  - Exclusão com diálogo de confirmação.
  - Sincronização automática da UI após operações CRUD.

## Pré-requisitos

- Flutter 3.0 ou superior configurado na máquina (`flutter --version`).
- SDKs/plataformas desejadas (Android Studio/Xcode etc.).

## Como executar

```bash
flutter pub get
flutter run
```

Use `flutter run -d chrome` ou `flutter run -d windows` para direcionar plataformas específicas.

## Arquitetura e Organização

- `lib/main.dart`: ponto de entrada; configura `MultiProvider` e rotas nomeadas.
- `lib/routes/app_routes.dart`: centraliza nomes de rotas (`/` e `/user-form`).
- `lib/provider/users.dart`: `ChangeNotifier` responsável pela coleção de usuários (operações CRUD, notificação de listeners).
- `lib/models/user.dart`: entidade imutável do domínio.
- `lib/data/dummy_users.dart`: semente de dados em memória.
- `lib/views/user_list.dart`: tela inicial com `ListView.builder` e botão para adicionar usuários.
- `lib/views/user_form.dart`: formulário com `Form` + `GlobalKey`, validação de nome e persistência via provider.
- `lib/components/user_tile.dart`: item de lista com ações de editar e excluir.

```16:31:lib/views/user_list.dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 132, 193),
        title: Text('Lista de Usuarios'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
```

## Fluxo da aplicação

1. `UserList` consulta o provider para renderizar todos os usuários.
2. Ao tocar em `+`, a rota `AppRoutes.USER_FORM` é aberta.
3. O formulário utiliza `_formData` para carregar dados existentes (edição) ou iniciar vazio (novo usuário).
4. Após salvar, `Users.put` atualiza ou insere a entrada e chama `notifyListeners()`, refletindo a mudança na lista.
5. A exclusão exibe `AlertDialog`; confirmada, `Users.remove` remove o item e emite notificação.

## Testes

- Executar testes widget padrão:

```bash
flutter test
```

## Personalização

- Substitua `lib/data/dummy_users.dart` por integração com uma API ou banco local.
- Ajuste `User` para incluir novos atributos (telefone, cargo etc.).
- Inclua validação de e-mail e máscara de avatar conforme necessário.

## Próximos passos sugeridos

- Persistir dados com `shared_preferences`, `sqflite` ou backend REST/GraphQL.
- Adicionar testes de widget para o fluxo de formulário e exclusão.
- Implementar internacionalização (`flutter_localizations`) para múltiplos idiomas.

## Referências úteis

- [Documentação Flutter](https://docs.flutter.dev)
- [Guia oficial do Provider](https://pub.dev/packages/provider)
