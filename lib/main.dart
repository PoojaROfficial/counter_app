import 'package:flutter/material.dart';
import 'counter_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  static final CounterNotifier counterNotifier = CounterNotifier();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: AnimatedBuilder(
          animation: counterNotifier,
          builder: (context, _) {
            return Text(
              counterNotifier.count.toString(),
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedBuilder(
            animation: counterNotifier,
            builder: (context, _) {
              return counterNotifier.count < 10
                  ? FloatingActionButton(
                      onPressed: counterNotifier.increment,
                      child: const Icon(Icons.add),
                    )
                  : const SizedBox();
            },
          ),

          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              counterNotifier.decrement(context);
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
