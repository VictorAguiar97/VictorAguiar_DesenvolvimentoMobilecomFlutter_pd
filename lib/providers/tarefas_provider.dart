import 'package:auto_control_panel/models/tarefas.dart';
import 'package:flutter/material.dart';

class TarefasProvider extends ChangeNotifier {
  List<Tarefas>? tarefas = [
    Tarefas("Tarefa 1", DateTime.now(), '-23.000', '-24.0000'),
    Tarefas("Tarefa 2", DateTime.now(), '-15.000', '-10.0000'),
  ];

  void addTarefas(Tarefas tarefa) {
    tarefas?.add(tarefa);
    notifyListeners();
  }

  void deleteTarefas(int index) {
    tarefas?.removeAt(index);
    notifyListeners();
  }

  void editTarefas(Tarefas tarefa, int index) {
    tarefas?[index].nome = tarefa.nome;
    tarefas?[index].datahora = tarefa.datahora;
    tarefas?[index].latitude = tarefa.latitude;
    tarefas?[index].longitude = tarefa.longitude;
    notifyListeners();
  }
}
