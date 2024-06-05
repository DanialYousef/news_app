import 'package:flutter/cupertino.dart';

class Order {
  String? name ;
  String? name2;
  String? price;
  int? count;
  Order(
  {
   this.name,
    this.name2,
    this.price,
    this.count,
});

}

class UserModels extends StatefulWidget {
  const UserModels({super.key});

  @override
  State<UserModels> createState() => _UserModelsState();
}

class _UserModelsState extends State<UserModels> {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
