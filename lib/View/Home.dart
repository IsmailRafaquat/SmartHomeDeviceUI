import 'package:flutter/material.dart';
import 'package:modern_smart_homeui/utils/Smart_Devices_Box.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final double horzaintalPadding = 20;
  final double verticalPadding = 20;

  List<Map<String, dynamic>> smartDevicesList = [
    {'name': 'Light', 'iconPath': "assets/images/light-bulb.png", 'poweron': true},
    {'name': 'AC', 'iconPath': "assets/images/air-conditioner.png", 'poweron': true},
    {'name': 'TV', 'iconPath': "assets/images/smart-tv.png", 'poweron': true},
    {'name': 'Fan', 'iconPath': "assets/images/fan.png", 'poweron': true},
  ];

  void togglePower(int index, bool value) {
    setState(() {
      smartDevicesList[index]['poweron'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Appbar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horzaintalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/menu.png',
                    height: 35,
                    color: Colors.grey.shade800,
                  ),
                  Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
            ),

            // Welcome Home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horzaintalPadding),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home'),
                  Text(
                    'MITCH KOKO',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horzaintalPadding),
              child: const Text('Smart Devices', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: smartDevicesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 3/4,
                ),
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, index) {
                  return SmartDevice(
                    name: smartDevicesList[index]['name'],
                    iconPath: smartDevicesList[index]['iconPath'],
                    poweron: smartDevicesList[index]['poweron'],
                    onChanged: (value) => togglePower(index, value),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}