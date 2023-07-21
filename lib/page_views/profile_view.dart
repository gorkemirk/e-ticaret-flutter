import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
      onPressed: () {
            Navigator.pushNamed(context, "JsonPage");
      },
      child: Text("Local Json"),
    ),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, "JsonWebPage");
              },
              child: Text("Ethernet Data Json"),
            )
          ],
        ));
  }
}
