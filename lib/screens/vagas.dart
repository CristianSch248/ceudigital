import 'package:flutter/material.dart';

class Vagas extends StatelessWidget {
  const Vagas({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 15,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apartamento ${index + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('Total de vagas: ${5 + index}'),
                Text('Vagas ocupadas: ${3 + index}'),
                Text('Vagas em aberto: ${2 + index}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
