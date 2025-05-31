import 'package:flutter/material.dart';
import 'task_item.dart';

class TaskListView extends StatelessWidget {
  final List<Map<String, dynamic>> tarefas;
  final Function(String id) onDelete;
  final Function(String id, String textoAtual) onEdit;

  const TaskListView({
    super.key,
    required this.tarefas,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    if (tarefas.isEmpty) {
      return const Center(
        child: Text("Nenhuma tarefa encontrada."),
      );
    }

    return ListView.builder(
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        final tarefa = tarefas[index];
        return TaskItem(
          texto: tarefa['texto'],
          onDelete: () => onDelete(tarefa['id']),
          onEdit: () => onEdit(tarefa['id'], tarefa['texto']),
        );
      },
    );
  }
}