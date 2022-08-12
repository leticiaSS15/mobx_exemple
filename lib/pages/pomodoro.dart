import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemple/store/pomodoro.store.dart';
import 'package:mobx_exemple/widgets/cronometro.dart';
import 'package:mobx_exemple/widgets/entrada_tempo.dart';
import 'package:provider/provider.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Observer(
                builder: (_) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        EntradaTempo(
                          valor: store.tempoTrabalho,
                          titulo: 'Trabalho',
                          incre: store.iniciado && store.estaTrabalhando()
                              ? null
                              : store.incrementarTempoTrabalho,
                          decre: store.iniciado && store.estaTrabalhando()
                              ? null
                              : store.decrementarTempoTrabalho,
                        ),
                        EntradaTempo(
                          valor: store.tempoDescanso,
                          titulo: 'Descanso',
                          incre: store.iniciado && store.estaDescansando()
                              ? null
                              : store.incrementarTempoDescanso,
                          decre: store.iniciado && store.estaDescansando()
                              ? null
                              : store.decrementarTempoDescanso,
                        ),
                      ],
                    )),
          )
        ],
      ),
    );
  }
}
