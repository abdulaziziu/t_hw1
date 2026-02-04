import 'package:flutter/material.dart';

import 'animal.dart';
import 'cat.dart';
import 'dog.dart';
import 'eatable.dart';
import 'pet_info.dart';

void main() {
  final animals = <Animal>[
    Dog(PetInfo('Rex', 3)),
    Cat(PetInfo('Murka', 2)),
    Dog(PetInfo('Buddy', 5)),
  ];

  for (final animal in animals) {
    animal.makeSound();
    if (animal is Eatable) {
      (animal as Eatable).eat();
    }
  }

  runApp(const AnimalApp());
}

class AnimalApp extends StatelessWidget {
  const AnimalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animal Demo'),
        ),
        body: const Center(
          child: Text(
            'Check the console output for animal sounds and eating.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
