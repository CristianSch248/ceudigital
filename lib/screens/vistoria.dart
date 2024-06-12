import 'package:flutter/material.dart';

class SolicitarVistoria extends StatelessWidget {
  const SolicitarVistoria({super.key});

  @override
  Widget build(BuildContext context) {
    final _dateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Vistoria'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Solicitar Vistoria',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Data',
                hintText: 'DD/MM/AAAA',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira uma data';
                }
                return null;
              },
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (picked != null) {
                  _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                }
              },
            ),
            const SizedBox(height: 24.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aqui você pode adicionar a lógica para enviar os dados
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Solicitação enviada!')),
                  );
                  Navigator.pop(context); // Volta para a tela anterior
                },
                child: const Text('Solicitar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
