import 'dart:convert';

import 'package:diam/screens/all_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rive/rive.dart';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool isSwitchOn = false;
  FocusNode loginFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String hintText = '';
  @override
  void initState() {
    super.initState();
    loginFocusNode.addListener(() {
      if (loginFocusNode.hasFocus) {
        hintText = '';
      }
      setState(() {});
    });

    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        hintText = '';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    controller: loginEmailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    focusNode: loginFocusNode,
                    textAlign: TextAlign.center,
                    //autofocus: true,
                    style: const TextStyle(
                        fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.4),
                      hintText:
                          loginFocusNode.hasFocus ? hintText : 'Identifiant',
                      hintStyle:
                          const TextStyle(fontSize: 18.0, color: Colors.white),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: TextFormField(
                    controller: loginPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    focusNode: passwordFocusNode,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: const TextStyle(
                        fontSize: 22.0, color: Color(0xFFbdc6cf)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.4),
                      hintText:
                          passwordFocusNode.hasFocus ? hintText : 'Password',
                      hintStyle:
                          const TextStyle(fontSize: 18.0, color: Colors.white),
                      contentPadding:
                          const EdgeInsets.only(left: 0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Souvenir de moi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: const Color(0xFFe57e25),
                    value: isSwitchOn,
                    onToggle: (value) {
                      setState(() {
                        isSwitchOn = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFe57e25)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 13)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27))),
                    ),
                    onPressed: () {
                      // First once user tab the button it show the loading
                      // Im using animation her
                      setState(() {
                        isShowConfetti = true;
                        isShowLoading = true;
                      });
                      
                      Future.delayed(
                        const Duration(seconds: 1),
                        () async {
                          if (_formKey.currentState!.validate()) {
                            await checkLogin(loginEmailController, loginPasswordController);
                          } else {
                            // if error it show annimation error
                            error.fire();
                            Future.delayed(
                              const Duration(seconds: 2),
                              () {
                                setState(() {
                                  isShowLoading = false;
                                });
                                reset.fire();
                              },
                            );
                          }
                        },
                      );
                    },
                    child: const Text('Se Connecter'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
      isShowLoading
          ? const CustomPositioned(
              child: RiveAnimation.asset(
                'assets/RiveAssets/check.riv',
                fit: BoxFit.cover,
                onInit: _onCheckRiveInit,
              ),
            )
          : const SizedBox(),
      isShowConfetti
          ? const CustomPositioned(
              scale: 6,
              child: RiveAnimation.asset(
                "assets/RiveAssets/confetti.riv",
                onInit: _onConfettiRiveInit,
                fit: BoxFit.cover,
              ),
            )
          : const SizedBox(),
    ]);
  }

  Future<void> checkLogin(
      TextEditingController login, TextEditingController password) async {
    var headers = {"Content-Type": "application/json"};
    var body = {'email': login.text.trim(), 'password': password.text};
    http.Response response;
    response = await http.post(Uri.parse('https://reqres.in/api/login'),
        headers: headers, body: jsonEncode(body));
    //Map jsonData = jsonDecode(response.body.toString());
    //print(jsonData['error']);
    if (response.statusCode == 200) {
      success.fire();
      await Future.delayed(
        const Duration(seconds: 2),
        () async {
          setState(() {
            isShowLoading = false;
          });
          confetti.fire();
          reset.fire();
        },
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      });
    } else {
      error.fire();
      Future.delayed(
        const Duration(seconds: 2),
        () {
          setState(() {
            isShowLoading = false;
          });
          reset.fire();
        },
      );
    }
  }
}

bool isShowLoading = false;
bool isShowConfetti = false;
late SMITrigger error;
late SMITrigger success;
late SMITrigger reset;

late SMITrigger confetti;

void _onCheckRiveInit(Artboard artboard) {
  StateMachineController? controller =
      StateMachineController.fromArtboard(artboard, 'State Machine 1');

  artboard.addController(controller!);
  error = controller.findInput<bool>('Error') as SMITrigger;
  success = controller.findInput<bool>('Check') as SMITrigger;
  reset = controller.findInput<bool>('Reset') as SMITrigger;
}

void _onConfettiRiveInit(Artboard artboard) {
  StateMachineController? controller =
      StateMachineController.fromArtboard(artboard, "State Machine 1");
  artboard.addController(controller!);

  confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned(
      {super.key, this.scale = 1, required this.child, this.size = 100});
  final Widget child;
  final double size;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Column(
      children: [
        SizedBox(
          height: size,
          width: size,
          child: child,
        ),
        const Spacer(),
      ],
    ));
  }
}
