import 'package:diam/shared/dashboard_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
  });

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

List<String> list = ['2023', '2022', '2021', '2020'];

class DashboardScreenState extends State<DashboardScreen> {
  String dropdownValue = list.first;
  double width = 0;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        width = 250;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/DIAMWEBMOBILE1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DropdownButton(
                    dropdownColor: const Color(0xFF030d40),
                    value: dropdownValue,
                    underline: const SizedBox(),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: width,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(60),
                        ),
                        color: Color(0xFF00aeef)),
                    height: 43,
                    width: width,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Text(
                        'Tableau de Bord - 2023',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardCard(amount: 87123, title: 'Quittances'),
                DashboardCard(amount: 5300, title: 'Encaissés'),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DashboardCard(
                    amount: 75483, title: 'Affaires Automobile Nouvelles'),
                DashboardCard(amount: 9000, title: 'Impayés'),
              ],
            )
          ],
        )));
  }
}
