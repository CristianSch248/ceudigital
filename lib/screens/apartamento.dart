import 'package:flutter/material.dart';

class Apartamento extends StatelessWidget {
  const Apartamento({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ExpansionTile(
          title: Text("Dados do apartamento"),
          children: <Widget>[
            ListTile(
              title: Text('Número: 6320'),
            ),
            ListTile(
              title: Text('Bloco: 63'),
            ),
            ListTile(
              title: Text('Vagas: 8'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Lista de pessoas"),
          children: List.generate(8, (index) {
            return ListTile(
              title: Text('Pessoa ${index + 1}'),
            );
          }),
        ),
        ExpansionTile(
          title: Text("Patrimônios"),
          children: <Widget>[
            ListTile(
              title: Text('Cadeira'),
            ),
            ListTile(
              title: Text('Mesa'),
            ),
            ListTile(
              title: Text('Armário'),
            ),
          ],
        ),
        ExpansionTile(
          title: Text("Vistorias passadas"),
          children: List.generate(5, (index) {
            return ListTile(
              title: Text('Vistoria: ${DateTime.now().subtract(Duration(days: index * 30)).toLocal()}'),
            );
          }),
        ),
        ExpansionTile(
          title: Text("Vistorias passadas com caso"),
          children: List.generate(5, (index) {
            return ListTile(
              title: Text('Vistoria: ${DateTime.now().subtract(Duration(days: index * 30)).toLocal()} - Caso ${index + 1}'),
            );
          }),
        ),
      ],
    );
  }
}
