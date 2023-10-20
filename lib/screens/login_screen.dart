import 'package:diam/screens/all_screens.dart';
import 'package:diam/shared/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    bool rmIcons = false;
    return SafeArea(
        child: Scaffold(
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
              Center(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 10, 0),
                  //width: 150,
                  child: Image.asset('assets/images/LogoLogin.png'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Vos principales information',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'Poppins-Bold'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: const Text(
                  'partout avec vous ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Poppins-Thin'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Identifiez-vous pour continuer',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'Poppins-Bold'),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const LoginForm(),
              const Center(
                child: Text(
                  "Mot de passe oublié ?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,

        buttonSize: const Size.fromRadius(20),
        // SpeedDial size which defaults to 56 itself
        // iconTheme: IconThemeData(size: 22),

        childrenButtonSize: const Size.fromRadius(20),
        visible: true,
        direction: SpeedDialDirection.up,
        switchLabelPosition: false,

        /// If true user is forced to close dial manually
        closeManually: false,

        /// If false, backgroundOverlay will not be rendered.
        renderOverlay: false,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        curve: Curves.bounceIn,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: true,
        // foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFe57e25),
        // activeForegroundColor: Colors.red,
        // activeBackgroundColor: Colors.blue,
        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        isOpenOnStart: false,
        animationDuration: const Duration(milliseconds: 500),
        children: [
          SpeedDialChild(
            // ignore: dead_code
            child: !rmIcons ? const Icon(Icons.password_outlined) : null,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Changement du mot de passe',
            onTap: () => Navigator.pushNamed(context, "/resetPassword"),
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
              child: !rmIcons
                  ? const Icon(
                      Icons.settings_outlined,
                      size: 15.0,
                    )
                  // ignore: dead_code
                  : null,
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Parameter',
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Dashboard()),
                  )),
          SpeedDialChild(
            // ignore: dead_code
            child: !rmIcons ? const Icon(Icons.view_sidebar) : null,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'À propos',
            visible: true,
            onTap: () => Navigator.pushNamed(context, "/aboutScreen"),
          ),
        ],
      ),
    ));
  }
}
