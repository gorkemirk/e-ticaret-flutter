import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:not_paylas/model/Account.dart';
import 'package:not_paylas/page_views/sepet_page.dart';

class FavoritesView extends StatefulWidget {
  FavoritesView({Key? key}) : super(key: key);

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

late List<bitkiler> favoritebitkiler1;

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favoritebitkiler1 = favoribitkilerigetir();
  }

  @override
  Widget build(BuildContext context) {
    favoritebitkiler1 = favoribitkilerigetir();
    return favoritebitkiler1.isEmpty
        ? Center(
            child: Container(
            color: Colors.white,
            child: Text(
              "Favoriniz bulunmamakta..",
              style: TextStyle(color: Colors.orange),
            ),
          ))
        : ListView.builder(
            itemExtent: 300,
            itemCount: favoritebitkiler1.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(15),
                  color: index % 2 == 0
                      ? Colors.orangeAccent.shade200
                      : Colors.indigo.shade200,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            width: MediaQuery.of(context).size.width / 2.2,
                            height: MediaQuery.of(context).size.height / 4.5,
                            child: Image.asset(
                              favoritebitkiler1[index].bitkifotourl,
                              fit: BoxFit.fitHeight,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                          child: Column(
                            children: [
                              Text(
                                favoritebitkiler1[index].bitkiadi,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Container(
                                    height: 250,
                                    child: Text(
                                      favoritebitkiler1[index].bitkiaciklama,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (favoritebitkiler1[index]
                                                    .favorite ==
                                                false) {
                                              favoritebitkiler1[index]
                                                  .favorite = true;
                                              bitkiler.bitkilerlistesi[index]
                                                  .favorite = true;
                                            } else {
                                              favoritebitkiler1[index]
                                                  .favorite = false;
                                              bitkiler.bitkilerlistesi[index]
                                                  .favorite = false;
                                              setState(() {
                                                favoritebitkiler1.remove(
                                                    bitkiler.bitkilerlistesi
                                                        .elementAt(index));
                                              });
                                            }
                                          });
                                        },
                                        child: favoritebitkiler1[index]
                                                    .favorite ==
                                                true
                                            ? Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                              )
                                            : Icon(
                                                Icons.favorite_border_outlined,
                                                color: Colors.red,
                                              )),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (bitkiler.bitkilerlistesi[index]
                                                    .sepette ==
                                                false) {
                                              bitkiler
                                                  .bitkilerlistesi[
                                                      favoritebitkiler1[index]
                                                              .uniqekey -
                                                          1]
                                                  .sepette = true;
                                              bitkiler
                                                  .bitkilerlistesi[
                                                      favoritebitkiler1[index]
                                                              .uniqekey -
                                                          1]
                                                  .sepettane = 1;
                                            } else {
                                              bitkiler
                                                  .bitkilerlistesi[
                                                      favoritebitkiler1[index]
                                                              .uniqekey -
                                                          1]
                                                  .sepette = false;
                                              bitkiler
                                                  .bitkilerlistesi[
                                                      favoritebitkiler1[index]
                                                              .uniqekey -
                                                          1]
                                                  .sepettane = 0;
                                            }
                                          });
                                        },
                                        child: bitkiler
                                                    .bitkilerlistesi[
                                                        favoritebitkiler1[index]
                                                                .uniqekey -
                                                            1]
                                                    .sepette ==
                                                true
                                            ? Icon(
                                                Icons.shopping_bag,
                                                color: Colors.blue,
                                              )
                                            : Icon(
                                                Icons.shopping_bag_outlined,
                                                color: Colors.blue,
                                              ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
  }

  List<bitkiler> favoribitkilerigetir() {
    List<bitkiler> list = [];
    bitkiler.bitkilerlistesi.forEach((element) {
      if (element.favorite == true) {
        list.add(element);
      }
    });

    return list;
  }
}
