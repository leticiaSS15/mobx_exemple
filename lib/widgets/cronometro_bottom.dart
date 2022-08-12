import 'package:flutter/material.dart';

class CronometroBottom extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBottom(
      {Key? key, required this.texto, required this.icone, this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15)),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Icon(
              icone,
              size: 35,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}
