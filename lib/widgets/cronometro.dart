import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemple/store/pomodoro.store.dart';
import 'package:mobx_exemple/widgets/cronometro_bottom.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Observer(builder: (_) {
      return Container(
        color: store.estaTrabalhando() ? Colors.red : Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              store.estaTrabalhando()
                  ? 'Hora de Trabalhar'
                  : 'Hora de Descansar',
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 120, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CronometroBottom(
                      texto: 'Iniciar',
                      icone: Icons.play_arrow,
                      click: store.iniciarCronometro,
                    ),
                  ),
                if (store.iniciado)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CronometroBottom(
                      texto: 'Parar',
                      icone: Icons.stop,
                      click: store.pararCronometro,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CronometroBottom(
                    texto: 'Reiniciar',
                    icone: Icons.refresh,
                    click: store.reiniciarCronometro,
                  ),
                )
              ],
            )
          ],
        ),
      );
    });
  }
}
