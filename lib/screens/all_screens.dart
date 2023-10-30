import 'package:diam/screens/dashboard_screen.dart';
import 'package:diam/screens/recherche_client.dart';
import 'package:diam/shared/appbar_widget.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  static final List<Widget> _bodyView = [
    const DashboardScreen(),
    const RechrcheClient(),
  ];

  Widget _tabItem(Widget child, EdgeInsets margin) {
    return AnimatedContainer(
        margin: margin,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: const AppBarWidget(),
      body: _bodyView.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: TabBar(
                onTap: (x) {
                  setState(() {
                    _selectedIndex = x;
                  });
                },
                labelColor: Colors.white,
                unselectedLabelColor: Colors.blueGrey,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: [
                  _tabItem(
                      Column(
                        children: [
                          //child,
                          Image.asset(
                            _selectedIndex == 0
                                ? 'assets/images/icons/dashbluexxhdpi.png'
                                : 'assets/images/icons/dashwhitexxhdpi.png',
                          ),
                          _selectedIndex == 0
                              ? const Text('__________',
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold))
                              : const Text('__________',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const EdgeInsets.fromLTRB(0, 8, 0, 0)),
                  _tabItem(
                      Column(
                        children: [
                          //child,
                          Image.asset(_selectedIndex == 1
                              ? 'assets/images/icons/Clientbleuxxhdpi.png'
                              : 'assets/images/icons/Clientwhitexxhdpi.png'),
                           _selectedIndex == 1
                              ? const Text('__________',
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold))
                              : const Text('__________',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const EdgeInsets.fromLTRB(0, 3, 0, 0)),
                ],
                controller: _tabController),
          ),
        ),
      ),
    );
  }
}
