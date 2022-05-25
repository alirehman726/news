import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // user?.displayName ?? '',
              'News',
              style: TextStyle(color: Colors.black),
            ),
            // Text(
            //   'News',
            //   // user?.displayName ?? '',
            //   style: TextStyle(color: Colors.blue),
            // )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Rehmanali'),
          ),
        ],
      ),
    );
  }
}
