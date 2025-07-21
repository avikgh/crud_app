import 'package:flutter/material.dart';

class CustomSnackBar {
  static void buildSnackBar(
      String title, String content, bool type, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      content: Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: type ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(
              type ? Icons.check_circle : Icons.close,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  content,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
