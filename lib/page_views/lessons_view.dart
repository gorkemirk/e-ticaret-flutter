import 'package:flutter/material.dart';
import '../model/Account.dart';
import 'home_view.dart';

class LessonsView extends StatefulWidget {
  const LessonsView({Key? key}) : super(key: key);

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(cacheExtent: double.infinity,
        itemCount: bitkiler.kategoriler.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(bitkiler.kategoriler[index]),
            children: [
              ListView.builder(
                  itemExtent: 300,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                              bitkiler.bitkilerlistesi[index].bitkifotourl),
                          Text(bitkiler.bitkilerlistesi[index].bitkiadi)
                        ],
                      ),
                    );
                  })
            ],
          );
        });
  }
}
