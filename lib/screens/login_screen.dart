import 'package:diam/screens/forgot_password.dart';
import 'package:diam/screens/parametre.dart';
import 'package:diam/shared/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isDialOpen = ValueNotifier(false);
    bool rmIcons = false;
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    child: const Text(
                      "Mot de passe oublié ?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        drawer: const Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: Parametre(),
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
                onTap: () {
                  if (_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    _scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                }

                // Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => const Parametre()),
                //     )
                ),
            SpeedDialChild(
              // ignore: dead_code
              child: !rmIcons ? const Icon(Icons.view_sidebar) : null,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'À propos',
              visible: true,
              onTap: () => _launchUrl(),
            ),
          ],
        ),
      ),
    );
  }

  final Uri _url = Uri.parse('https://flutter.dev');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
