import 'package:flutter/material.dart';
import 'manutencoes.dart'; // Certifique-se de que este caminho está correto

class Manutencao extends StatelessWidget {
  const Manutencao({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _caseDescriptionController = TextEditingController();
    final _dateController = TextEditingController();
    final _detailsController = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Manutenção'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _caseDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descreva o caso',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Data',
                  hintText: 'DD/MM/AAAA',
                ),
                readOnly: true,
                onTap: () {
                  _selectDate(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma data';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _detailsController,
                decoration: const InputDecoration(
                  labelText: 'Mais detalhes',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Solicitação enviada!')),
                      );
                      Navigator.pop(context); // Navega de volta para Manutencoes
                    }
                  },
                  child: const Text('Solicitar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
