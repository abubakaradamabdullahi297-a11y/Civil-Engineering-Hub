import 'package:flutter/material.dart';

void main() {
  runApp(const CivilEngineeringHub());
}

class CivilEngineeringHub extends StatelessWidget {
  const CivilEngineeringHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Civil Engineering Hub',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: const Color(0xFFF8F5F0),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Civil Engineering Hub',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Engineering Calculators',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Calculate materials and dimensions easily.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 25),

            calculatorCard(
              context,
              'Concrete Calculator',
              Icons.foundation,
              const ConcreteCalculator(),
            ),

            calculatorCard(
              context,
              'Block Calculator',
              Icons.grid_view,
              const BlockCalculator(),
            ),

            calculatorCard(
              context,
              'Area Calculator',
              Icons.square_foot,
              const AreaCalculator(),
            ),

            calculatorCard(
              context,
              'Length Calculator',
              Icons.straighten,
              const LengthCalculator(),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.smart_toy,
                  color: Colors.orange,
                  size: 35,
                ),
                title: const Text(
                  'AI Engineering Assistant',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Coming soon...',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget calculatorCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => page),
          );
        },
      ),
    );
  }
}

// ================= CONCRETE CALCULATOR =================

class ConcreteCalculator extends StatefulWidget {
  const ConcreteCalculator({super.key});

  @override
  State<ConcreteCalculator> createState() => _ConcreteCalculatorState();
}

class _ConcreteCalculatorState extends State<ConcreteCalculator> {
  final length = TextEditingController();
  final width = TextEditingController();
  final depth = TextEditingController();

  double volume = 0;
  double cement = 0;
  double sand = 0;
  double aggregate = 0;
  double bags = 0;

  void calculate() {
    final l = double.tryParse(length.text) ?? 0;
    final w = double.tryParse(width.text) ?? 0;
    final d = double.tryParse(depth.text) ?? 0;

    setState(() {
      volume = l * w * d;

      // 1 : 
