import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'usuario.dart';
import 'apartamento.dart';
import 'vistorias.dart';
import 'manutencoes.dart';
import 'vagas.dart';
import 'manutencao.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentPageIndex = 0;

  final List<Widget> _pages = [
    _buildHomePage(),
    const Apartamento(),
    const Vistorias(),
    const Manutencoes(),
    const Vagas(),
  ];

  final List<String> _titles = [
    'Página Principal',
    'Apartamento',
    'Vistoria',
    'Manutenções',
    'Vagas',
  ];

  static Widget _buildHomePage() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildNewsCard(
          'Equipe da UFSM auxilia na drenagem do aeroporto Salgado Filho',
        ),
        _buildNewsCard(
          'Egressa da UFSM cria coleção de joias inspiradas em igrejas da Quarta Colônia',
        ),
        _buildNewsCard(
          'Reitor da UFSM fala à TV Campus sobre ações de reparação a danos causados pelas enchentes',
        ),
      ],
    );
  }

  static Widget _buildNewsCard(String title) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _navigateToManutencao() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Manutencao()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_titles[currentPageIndex]),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person),
                Text(
                  'Perfil',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Usuario()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.apartment),
            icon: Icon(Icons.apartment_outlined),
            label: 'Apto',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.check),
            icon: Icon(Icons.check_box_outlined),
            label: 'Vistorias',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.build),
            icon: Icon(Icons.build_outlined),
            label: 'Manutenção',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bed),
            icon: Icon(Icons.bed_outlined),
            label: 'Vagas',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: _pages,
      ),
      floatingActionButton: currentPageIndex == 3 ? FloatingActionButton(
        onPressed: _navigateToManutencao,
        child: const Icon(Icons.add),
      ) : null,
    );
  }
}
