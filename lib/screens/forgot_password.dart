import 'package:diam/shared/forgot_password_form.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgound.jpg"),
                fit: BoxFit.fill),
          ),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                  tooltip: 'retour',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      'Mot de passe oublié',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'Poppins-Bold'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Center(
                  child: Text(
                    'Enter votre Email pour continuer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Poppins-Bold'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
