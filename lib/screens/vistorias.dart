import 'package:flutter/material.dart';
import 'vistoria.dart';  // Certifique-se de que este caminho está correto

class Vistorias extends StatelessWidget {
  const Vistorias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
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
                    'Data: ${DateTime.now().add(Duration(days: index)).toLocal()}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Status da Vistoria: Pendente'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SolicitarVistoria()),
                          );
                        },
                        child: const Text('Detalhes'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          // Adicionar ação de cancelar aqui
                        },
                        child: const Text('Cancelar'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SolicitarVistoria()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
