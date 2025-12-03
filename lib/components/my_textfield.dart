import 'package:flutter/material.dart';

//esto es para crear un componente reutilizable de TextField que se pueda usar en varias partes de la app
class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.focusNode,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:  25.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary), //se utiliza el tertiary para que el borde cambie de color segun el tema
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary), //la diferencia de tertiary y primary es que el primary es para cuando el campo esta enfocado y el tertiary para cuando no lo esta
          ),
          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary), //esto es para se vuelva opaco el texto de hint segun el tema
        ),
        
      ),
    );
  }
}