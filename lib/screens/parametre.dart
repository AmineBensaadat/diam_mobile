import 'package:diam/shared/parametre_form.dart';
import 'package:flutter/material.dart';

class Parametre extends StatefulWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/DIAMWEBMOBILE1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Center(
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.fromLTRB(0, 40, 10, 0),
                  //width: 150,
                  child: Image.asset('assets/images/LogoLogin.png'),
                ),
              ),
              const SizedBox(height: 80),
              const Text(
                'Paramètres',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'Poppins-Bold'),
              ),
              const SizedBox(height: 20),
              const ParametreForm(),
            ],
          ))),
    );
  }
}
