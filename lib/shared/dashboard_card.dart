import 'package:countup/countup.dart';
import 'package:diam/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final double amount;
  final String title;
  const DashboardCard({super.key, required this.amount, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailScreen()),
            );
          },
          child: Container(
            constraints:
                const BoxConstraints(minHeight: 120, minWidth: double.infinity),
            decoration: const BoxDecoration(
              color: Color(0xFF030d40),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 15, 30, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Countup(
                        begin: 0,
                        end: amount,
                        duration: const Duration(seconds: 3),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: 'Poppins-Bold'),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: const Text(
                              ' MAD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  fontFamily: 'Poppins-Bold'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Poppins-thin'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
