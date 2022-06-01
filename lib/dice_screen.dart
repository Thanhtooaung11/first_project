import 'dart:math';

import 'package:dice_app/fail_screen.dart';
import 'package:dice_app/get_dice.dart';
import 'package:dice_app/success_screen.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  Random random = Random();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController diceController = TextEditingController();

  int dice1 = 1;
  int dice2 = 1;
  String? errorText;

  void play() async {
    // if (formKey.currentState!.validate()) {
    //   if (errorText != null) {
    //     setState(() {});
    //     return;
    //   }
    // }

    if (errorText != null) {
      setState(() {});
      return;
    }

    dice1 = random.nextInt(6) + 1;
    dice2 = random.nextInt(6) + 1;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));

    if ((dice1 + dice2).toString() == diceController.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const FailedScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            gradient: gradient(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GetDice(
                    count: dice1,
                  ),
                  GetDice(
                    count: dice2,
                  ),
                ],
              ),
              errorText == null
                  ? const Text('')
                  : Text(
                      errorText!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: diceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: textFieldBorder(),
                            focusedBorder: textFieldBorder(),
                            enabledBorder: textFieldBorder(),
                          ),
                          validator: (value) {
                            errorText = int.tryParse(value!) == null
                                ? 'Invalid Number'
                                : int.parse(value) > 12
                                    ? 'Range error'
                                    : null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: play,
                          child: const Text('Go'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder textFieldBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
  }
}

LinearGradient gradient() {
  return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.red,
        Colors.white,
        Colors.blue,
      ]);
}
