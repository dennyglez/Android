import 'package:ejercicio/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gestor de Tareas",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getTareas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No hay tareas disponibles'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final tarea = snapshot.data![index];
                final nombre = tarea['tareas'] ?? 'Nombre no disponible';
                return Card(
                  child: ListTile(
                    title: Text(nombre),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await eliminarTarea(tarea['id']);
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No hay tareas disponibles'),
            );
          } 
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevaTarea = await showDialog<String>(
            context: context,
            builder: (context) => const AgregarTareaDialog(),
          );
          if (nuevaTarea != null && nuevaTarea.isNotEmpty) {
            await agregarTarea(nuevaTarea);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AgregarTareaDialog extends StatefulWidget {
  const AgregarTareaDialog({super.key});

  @override
  _AgregarTareaDialogState createState() => _AgregarTareaDialogState();
}

class _AgregarTareaDialogState extends State<AgregarTareaDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Nueva Tarea'),
      content: TextField(
        controller: _controller,
        decoration: const InputDecoration(hintText: 'Nombre de la tarea'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_controller.text);
          },
          child: const Text('Agregar'),
        ),
      ],
    );
  }
}
