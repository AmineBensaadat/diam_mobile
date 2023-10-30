import 'package:diam/shared/recherche_client_form.dart';
import 'package:flutter/material.dart';

class RechrcheClient extends StatefulWidget {
  const RechrcheClient({Key? key}) : super(key: key);

  @override
  State<RechrcheClient> createState() => RechrcheClientState();
}

class RechrcheClientState extends State<RechrcheClient> {
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/DIAMWEBMOBILE1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 30),
                  child: const Text(
                    'Identifiant Client',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins-Bold'),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const RechercheClientForm(),
            ],
          ),
        ),
      );
  
  }
}
