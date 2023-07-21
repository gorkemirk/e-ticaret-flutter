import 'package:flutter/material.dart';
import '../model/Account.dart';

class SepetSayfasi extends StatefulWidget {
  SepetSayfasi({Key? key}) : super(key: key);

  @override
  State<SepetSayfasi> createState() => _SepetSayfasiState();
}

late List<bitkiler> sepettekibitkiler;

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sepettekibitkiler = sepetbitkilerigetir();
  }

  @override
  Widget build(BuildContext context) {
    sepettekibitkiler = sepetbitkilerigetir();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sepet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: sepettekibitkiler.isEmpty
          ? Center(
              child: Container(
              color: Colors.white,
              child: Text(
                "Sepetiniz Boş..",
                style: TextStyle(color: Colors.orange),
              ),
            ))
          : ListView.builder(
              itemExtent: 300,
              itemCount: sepettekibitkiler.length,
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
                                sepettekibitkiler[index].bitkifotourl,
                                fit: BoxFit.fitHeight,
                              )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                            child: Column(
                              children: [
                                Text(
                                  sepettekibitkiler[index].bitkiadi,
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
                                        sepettekibitkiler[index].bitkiaciklama,
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
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (sepettekibitkiler[index]
                                                          .sepettane >
                                                      0) {
                                                    sepettekibitkiler[index]
                                                        .sepettane--;
                                                  }
                                                  if (sepettekibitkiler[index]
                                                          .sepettane ==
                                                      0) {
                                                    bitkiler
                                                        .bitkilerlistesi[
                                                            sepettekibitkiler[
                                                                        index]
                                                                    .uniqekey -
                                                                1]
                                                        .sepette = false;
                                                  }
                                                  bitkiler.bitkilerlistesi
                                                      .forEach((element) {
                                                    print(element.sepette
                                                            .toString() +
                                                        "\n");
                                                  });
                                                });
                                              },
                                              icon: Icon(Icons.remove,
                                                  color: Colors.white)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            bitkiler.bitkilerlistesi[index]
                                                .sepettane
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  sepettekibitkiler[index]
                                                      .sepettane++;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              )),
                                        ],
                                      )
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
              }),
    );
  }

  List<bitkiler> sepetbitkilerigetir() {
    List<bitkiler> list = [];
    bitkiler.bitkilerlistesi.forEach((element) {
      if (element.sepette == true) {
        list.add(element);
      }
    });

    return list;
  }
}
