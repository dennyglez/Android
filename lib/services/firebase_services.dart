import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Map<String, dynamic>>> getTareas() async {
  List<Map<String, dynamic>> tareas = [];
  CollectionReference collectionReferenceTareas = db.collection('tareas');

  QuerySnapshot queryTareas = await collectionReferenceTareas.get();

  for (var documento in queryTareas.docs) {
    Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    data['id'] = documento.id;  // Añadir el ID del documento a los datos
    tareas.add(data);
  }

  return tareas;
}

Future<void> agregarTarea(String nombre) async {
  await db.collection('tareas').add({'tareas': nombre});
}

Future<void> eliminarTarea(String id) async {
  await db.collection('tareas').doc(id).delete();
}
