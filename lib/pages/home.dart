import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController taskController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  void _logout() async {
    await _auth.signOut();
  }

  void _addTask() async {
    if (taskController.text.trim().isEmpty || user == null) return;

    await _firestore.collection('tarefas').add({
      'uid': user!.uid,
      'titulo': taskController.text.trim(),
      'criadoEm': Timestamp.now(),
    });

    taskController.clear();
    setState(() {}); // Atualiza a lista
  }

  Stream<QuerySnapshot> _getUserTasks() {
    return _firestore
        .collection('tarefas')
        .where('uid', isEqualTo: user!.uid)
        .orderBy('criadoEm', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: taskController,
              decoration: const InputDecoration(
                labelText: 'Digite uma nova tarefa',
              ),
              onSubmitted: (_) => _addTask(),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _getUserTasks(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;

                if (docs.isEmpty) {
                  return const Center(child: Text('Nenhuma tarefa encontrada.'));
                }

                return ListView(
                  children: docs.map((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    return ListTile(
                      title: Text(data['titulo'] ?? ''),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}