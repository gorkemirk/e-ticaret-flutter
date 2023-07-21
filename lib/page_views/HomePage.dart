import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not_paylas/model/Account.dart';
import 'package:not_paylas/page_views/favorites_view.dart';
import 'package:not_paylas/page_views/home_view.dart';
import 'package:not_paylas/page_views/lessons_view.dart';
import 'package:not_paylas/page_views/profile_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var keyAnasayfa = PageStorageKey("key_ana_sayfa");
var keyFavoritesayfa = PageStorageKey("key_favorite_sayfa");
var keyProfilsayfa = PageStorageKey("key_profil_sayfa");
var keyLessonssayfa = PageStorageKey("key_lessons_sayfa");
var keySepetsayfa=PageStorageKey("key_sepet_sayfa");
bool farovilendi=false;
var sayfalar = {
  HomeView(key: keyAnasayfa,),
  LessonsView(key: keyLessonssayfa,),
  FavoritesView(key: keyFavoritesayfa),
  ProfileView(key: keyProfilsayfa,)
};
int secilen = 0;
late Account account_login_control;
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Account? account = ModalRoute.of(context)?.settings.arguments == null
        ? Account(email: "", pass: "")
        : ModalRoute.of(context)!.settings.arguments as Account;
    StatefulWidget secilenSayfa = sayfaSecme(secilen, sayfalar)!;
    return Scaffold(
      drawer: buildDrawer(account),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: secilen,
          onTap: (value) {
            setState(() {
              secilen = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: bottomnavibar_items()),
      appBar: AppBar(
        title: dinamiktitle(secilen),
        elevation: 0,
        backgroundColor: Colors.blueAccent.shade400,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "SepetPage");
              },
              child: Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child:account.email==""? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "LoginPage");
              },
              child: Icon(
                Icons.login,
                color: Colors.white,
              ),
            ):GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushReplacementNamed(context, "/");
                });
              },
              child: Icon(
                Icons.power_settings_new,
                color: Colors.white,
              ),
            )
          ),

        ],
      ),
        body: secilenSayfa,
    );
  }



  List<BottomNavigationBarItem> bottomnavibar_items() {
    return [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorites"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: "Profile"),
        ];
  }

  Drawer buildDrawer(Account account) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              accountName: Text(account.name + " " + account.surname),
              accountEmail: Text(account.email),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  account.name.substring(0, 1).toUpperCase() +
                      account.surname.substring(0, 1).toUpperCase(),
                  style: TextStyle(color: Colors.red),
                ),
                backgroundColor: Colors.white,
              )),
          Expanded(
              child: ListView(
            children: [
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              InkWell(
                  onTap: () {},
                  child: ListTile(
                    title: Text("Settings"),
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_forward_ios),
                  )),
              AboutListTile(
                icon: Icon(Icons.keyboard),
                applicationLegalese: "Lisanslar",
                applicationVersion: "1.0",
                applicationName: "About Application",
              )
            ],
          ))
        ],
      ),
    );
  }
}

Widget dinamiktitle(int secim) {
  String title = "";
  switch (secim) {
    case 0:
      title = "Home";
      break;
    case 1:
      title = "Categories";
      break;
    case 2:
      title = "Favorites";
      break;
    case 3:
      title = "Profile";
      break;
  }

  return Text(
    title,
    style: GoogleFonts.lato(color: Colors.white, fontSize: 30),
  );
}

StatefulWidget? sayfaSecme(int secim, Set<StatefulWidget> Sayfalar) {
  StatefulWidget? secilen;
  switch (secim) {
    case 0:
      secilen = Sayfalar.elementAt(secim);
      break;
    case 1:
      secilen = Sayfalar.elementAt(secim);
      break;
    case 2:
      secilen = Sayfalar.elementAt(secim);
      break;
    case 3:
      secilen = Sayfalar.elementAt(secim);
      break;
  }
  return secilen;
}
