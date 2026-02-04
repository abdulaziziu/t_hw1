import 'pet_info.dart';

abstract class Animal {
  final PetInfo info;

  Animal(this.info);

  void makeSound();
}
