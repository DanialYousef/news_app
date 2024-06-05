import 'package:flutter/material.dart';

import '../../modulesorder.dart';
//محمد حبيب محمد
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

void navigateTo(BuildContext context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

Widget defaultButton({
  required Function() onPress,
  double width = double.infinity,
  List<Color> gradientColors = const [
    Color.fromRGBO(249, 136, 31, 1),
    Color.fromRGBO(255, 119, 76, 1)
  ],
  Color bgColor = Colors.blue,
  required String text,
  double radius = 20.0,
}) => Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget buildTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String label,
  required IconData prefix,
  bool secure = false,
  IconData? suffix,
  String? validate,
  double radius = 15.0,
  Color labelColor = const Color.fromRGBO(170, 172, 174, 1),
  Color enableBorderColor = const Color.fromRGBO(223, 226, 229, 1),
  Color focusBorderColor = const Color.fromRGBO(249, 136, 31, 1),
}) {
  return TextFormField(
    cursorColor: Colors.grey,
    validator: (value){
      if(value!.isEmpty){
        return validate;
      }
    },
    obscureText: secure,
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
      labelStyle:
          TextStyle(color: labelColor, fontFamily: 'sk', fontSize: 16.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: enableBorderColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(color: focusBorderColor),
      ),
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null ? Icon(suffix) : null,
    ),
  );
}

AppBar buildAppBarForm() {
  return AppBar(
    elevation: 0.0,
    surfaceTintColor: Colors.white,
    title: Image(image: AssetImage('assets/images/Icon.png')),
    centerTitle: true,
  );
}

Widget itembiulder(Order order, int index, BuildContext context) {
  return Dismissible(
    key: ValueKey(index),
    direction: DismissDirection.startToEnd,
    background: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.deepOrange),
      child: Row(
        children: [
          SizedBox(width: 16.0),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(width: 8.0),
          Text(
            'Delete',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
    confirmDismiss: (_) async {
      return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Delete'),
            content: Text('Are you sure you want to delete this item?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Cancel delete
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Confirm delete
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      );
    },
    onDismissed: (_) {
      // // Handle delete action here
      // setState(() {
      // // Remove the item from the list
      // });
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(20, 40, 40, 1),
      ),
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              width: 60,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 10,
                  image: AssetImage('assets/images/download.png'),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${order.name}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${order.name}',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${order.price}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    ),
  );
}
