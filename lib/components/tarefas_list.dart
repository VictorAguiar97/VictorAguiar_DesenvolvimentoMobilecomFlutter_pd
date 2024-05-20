import 'package:auto_control_panel/components/tarefas_list_tite.dart';
import 'package:auto_control_panel/models/tarefas.dart';
import 'package:auto_control_panel/providers/tarefas_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TarefasList extends StatelessWidget {
  const TarefasList({super.key});

  @override
  Widget build(BuildContext context) {
    final tarefasProvider = context.watch<TarefasProvider>();

    final List<Tarefas>? listaTarefas =
        tarefasProvider.tarefas?.cast<Tarefas>();

    return ListView.builder(
      itemCount: listaTarefas?.length,
      itemBuilder: (context, index) {
        Tarefas tarefa = listaTarefas![index];
        return TarefasListTile(tarefa: tarefa, index: index);
      },
    );
  }
}
