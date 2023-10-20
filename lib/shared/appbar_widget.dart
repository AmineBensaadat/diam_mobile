import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Size get preferredSize => const Size(double.maxFinite, 130);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      actions: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 35, 30, 10),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Amine Bensaadat',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins-Bold',
                    fontSize: 17),
              ),
              SizedBox(height: 10,),
              Text(
                'Déconnexion',
                style: TextStyle(color: Color(0xFF00aeef), fontSize: 17),
              ),
            ],
          ),
        )
      ], //<Widget>[]
      backgroundColor: const Color(0xFF01041b),
      elevation: 0.0,
      leadingWidth: 100.0,
      leading: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 0, 15),
        child: Image.asset("assets/images/LogoMobileDIAM@2x.png"),
      ),
    );
  }
}
