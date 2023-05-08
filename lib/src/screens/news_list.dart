import 'dart:async';

import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: getFuture(),
          builder: (BuildContext context, snapshot) {
            return SizedBox(
              height: 80.0,
              child: snapshot.hasData
                  ? Text('Im visible $index')
                  : Text('Future hasnt resolved yet $index'),
            );
          },
        );
      },
    );
  }

  getFuture() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => 'hi',
    );
  }
}
