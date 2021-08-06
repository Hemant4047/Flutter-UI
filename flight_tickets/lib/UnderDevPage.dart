import 'package:flutter/material.dart';

import 'UnderDev.dart';

class UnderDevPage extends StatelessWidget {
  const UnderDevPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: UnderDev(),
    );
  }
}
