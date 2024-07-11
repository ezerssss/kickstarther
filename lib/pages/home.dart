import 'package:flutter/material.dart';
import 'package:kickstarther/components/Checklist.dart';

class HomePage extends StatefulWidget {
  final bool isDemonstration;

  const HomePage({super.key, this.isDemonstration = false});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'kickstarther',
          style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Checklist(isDemonstration: widget.isDemonstration),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, "feed")},
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(right: 5),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text("Start a new venture",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            )),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text("Manage checklists",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          )),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.pink,
            selectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
            unselectedItemColor: const Color(0xff757575),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Poppins'),
            type: _bottomNavType,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: _navBarItems),
      ),
    );
  }
}

const _navBarItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home_rounded),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.checklist_outlined),
    activeIcon: Icon(Icons.checklist),
    label: 'Checklists',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_outline_rounded),
    activeIcon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];
