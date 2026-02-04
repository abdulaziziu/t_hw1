import 'animal.dart';
import 'eatable.dart';
import 'pet_info.dart';

class Cat extends Animal implements Eatable {
  Cat(PetInfo info) : super(info);

  @override
  void makeSound() {
    print('${info.name} says: Meow!');
  }

  @override
  void eat() {
    print('${info.name} eats cat food.');
  }
}
