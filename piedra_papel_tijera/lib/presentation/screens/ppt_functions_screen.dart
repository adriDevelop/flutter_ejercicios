import 'dart:math';

import 'package:flutter/material.dart';

class PPTFunctionsScreen extends StatefulWidget {
  const PPTFunctionsScreen({super.key});

  @override
  State<PPTFunctionsScreen> createState() => _PPTFunctionsScreenState();
}

class _PPTFunctionsScreenState extends State<PPTFunctionsScreen> {

  String texto = 'Piedra, papel o tijeras?';
  IconData iconData = Icons.cut;
  List<String> seleccionIa = ['Piedra', 'Papel', 'Tijeras'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piedra, Papel, Tijeras'),
        leading: IconButton(
          onPressed: (){
            setState(() {
              iconData = Icons.cut;
              texto = 'Piedra, papel o tijeras?';
            });
          },
          icon: const Icon(Icons.refresh_rounded)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, size: 100,),
            Text(texto),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PersonalizedButtons(
                    icon: Icons.cut_outlined,
                    onPressed: () {
                      setState(() {
                        iconData = Icons.cut_outlined;
                        texto = 'Tijeras';
                      });
                    },),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PersonalizedButtons(
                    icon: Icons.note,
                    onPressed: () {
                      setState(() {
                        iconData = Icons.note;
                        texto = 'Papel';
                      });
                    },),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PersonalizedButtons(
                    icon: Icons.brightness_7_rounded,
                    onPressed: () {
                      setState(() {
                        iconData = Icons.brightness_7_rounded;
                        texto = 'Piedra';
                      });
                    },),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child:ElevatedButton(
                    onPressed: (){
                      setState(() {
                        int valorArray = Random().nextInt(seleccionIa.length);
                        if (texto == seleccionIa[valorArray]) {
                          texto = 'Empate!';
                        } else if (texto == 'Piedra'  && seleccionIa[valorArray] == 'Tijeras'){
                          texto = 'Has ganado, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }else if (texto == 'Papel'  && seleccionIa[valorArray] == 'Piedra'){
                          texto = 'Has ganado, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }else if (texto == 'Tijeras'  && seleccionIa[valorArray] == 'Papel'){
                          texto = 'Has ganado, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }else if (seleccionIa[valorArray] == 'Piedra'  && texto == 'Tijeras'){
                          texto = 'Has perdido, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }else if (seleccionIa[valorArray] == 'Papel'  && texto == 'Piedra'){
                          texto = 'Has perdido, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }else if (seleccionIa[valorArray] == 'Tijeras'  && texto == 'Papel'){
                          texto = 'Has perdido, La Ia ha sacado : ${seleccionIa[valorArray]}';
                        }
                      });
                    },
                    child: const Text('Enviar respuesta')), ),
                ],
              ),
            )
          ],
        )),
    );
  }
}

class PersonalizedButtons extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;

  const PersonalizedButtons({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}