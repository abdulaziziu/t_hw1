import 'animal.dart';
import 'eatable.dart';
import 'pet_info.dart';

class Dog extends Animal implements Eatable {
  Dog(PetInfo info) : super(info);

  @override
  void makeSound() {
    print('${info.name} says: Woof!');
  }

  @override
  void eat() {
    print('${info.name} eats dog food.');
  }
}
