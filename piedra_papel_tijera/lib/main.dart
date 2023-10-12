import 'package:flutter/material.dart';
import 'package:piedra_papel_tijera/presentation/screens/ppt_functions_screen.dart';

void main(){
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
      ),
      home: const PPTFunctionsScreen(),
    );
  }
}