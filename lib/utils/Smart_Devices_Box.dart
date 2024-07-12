import 'package:flutter/material.dart';

class SmartDevice extends StatelessWidget {
  final String name;
  final String iconPath;
  final bool poweron;
  final ValueChanged<bool> onChanged;

  const SmartDevice({
    super.key,
    required this.name,
    required this.iconPath,
    required this.poweron,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!poweron),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: poweron ? Colors.white : Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                iconPath,
                height: 85,
                color: poweron ? Colors.black : Colors.white, // Set image color based on poweron state
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: poweron ? Colors.black : Colors.white, // Set text color based on poweron state
                    ),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: poweron,
                      onChanged: onChanged,
                      activeTrackColor: Colors.green,
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}