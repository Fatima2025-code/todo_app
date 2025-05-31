# 📋 ToDo App – Flutter + Firebase

Aplicativo de lista de tarefas desenvolvido com **Flutter** e integrado ao **Firebase** (Authentication + Cloud Firestore). Este é um projeto simples e funcional, ideal para quem está iniciando no desenvolvimento mobile com Flutter.

## ✅ Funcionalidades

- Cadastro e login de usuários com Firebase Authentication  
- Adição de novas tarefas  
- Marcar tarefas como concluídas  
- Remoção de tarefas  
- Listagem em tempo real com Cloud Firestore  
- Interface simples e responsiva  
- Logout seguro  

## 🛠️ Tecnologias Utilizadas

- [Flutter](https://flutter.dev/)  
- [Firebase Authentication](https://firebase.google.com/products/auth)  
- [Cloud Firestore](https://firebase.google.com/products/firestore)  

## 🔐 Pré-requisitos

- Flutter SDK instalado  
- Conta no Firebase  
- Projeto Firebase com Authentication e Firestore ativados  
- Configuração do `firebase_options.dart` via `flutterfire configure` ou manual  

## 📁 Estrutura de Pastas

```
lib/
├── main.dart
├── pages/
│   ├── login.dart
│   ├── cadastro.dart
│   ├── home.dart
│   └── auth_check.dart
├── widgets/
│   ├── task_item.dart
│   └── task_list_view.dart
└── firebase_options.dart
```

## 🚀 Como executar o projeto

1. Clone o repositório:
```bash
git clone https://github.com/fatimadev23/todo_app.git
cd todo_app
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o app:
```bash
flutter run
```

> Certifique-se de que seu Firebase está corretamente configurado no projeto, especialmente o arquivo `firebase_options.dart`.

## 🧑‍💻 Autor

Feito com ❤️ por [Fatima Dev](https://github.com/fatimadev23) – Este é um projeto pessoal com fins de aprendizado e portfólio.
