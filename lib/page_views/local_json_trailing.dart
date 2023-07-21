import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:not_paylas/model/Account.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  State<JsonPage> createState() => _JsonPageState();
}
late Future<List<Araba>> tumarabalar;
class _JsonPageState extends State<JsonPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumarabalar=arabalarJsonOku();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json İşlemleri"),
      ),
      body: FutureBuilder<List<Araba>>(
        future: tumarabalar,//initialData : intagramda yeni gönderile guncellenirken gösterilen eski gönderiler gibidir veriler gelene kadar gösterilir
        //initialData: [Araba(arabaAdi: "arabaAdi", uretimYeri: "uretimYeri", yil: "yil", model: [Model(modelAdi: "modelAdi", fiyat: 1000, benzinli: true)])],//intagramda yeni gönderile guncellenirken gösterilen eski gönderiler gibidir veriler gelene kadar gösterilir
        builder: (context, snapshot) {
          var tumarabalar = snapshot.data;
          return ListView.builder(
              itemCount: tumarabalar?.length,
              itemBuilder: (context, index) {
                if (snapshot.hasData) {
                  return Card(
                    color: index % 2 == 0 ? Colors.yellow.shade400 : Colors.lightGreen.shade400,
                    elevation: 8,
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text("Marka:" +
                          tumarabalar![index].arabaAdi +
                          "  Üretim Yeri:" +
                          tumarabalar[index].uretimYeri,style: TextStyle(fontSize: 20)),
                      subtitle:
                          Text("  Açılış Tarih:" + tumarabalar[index].yil,style: TextStyle(fontSize: 16)),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              });
        },
      ),
    );
  }

  Future<List<Araba>> arabalarJsonOku() async {
    await Future.delayed(Duration(seconds: 3),(){return debugPrint("3 saniye işlem  bitti");});
    String okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    var jsonObject = jsonDecode(okunanString);
    // print(okunanString);
    //print("************************");
    List arabalistesi = jsonObject;
    // print(jsonObject);
    // print(arabalistesi[0]);//1.araba elemanı
    // print(arabalistesi[0]["araba_adi"]);//1.elemandan araba adi değerini getir
    // print(arabalistesi[0]["model"][0]["fiyat"]);//1.elemandan model değeri getir (listedir modelind eğeri)bu değerden fiyatı getirx
    List<Araba> arabalar = (jsonObject as List)
        .map((arabaMap) => Araba.fromJson(arabaMap))
        .toList();
    //print("list Type 1.eleman marka: "+arabalar[0].arabaAdi);
    // print("list Type 1.eleman model fiyatı: "+arabalar[0].model[0].fiyat.toString());
    // print("list Type 1.eleman model adı : "+arabalar[0].model[0].modelAdi);
    // print("list length:"+arabalar.length.toString());

    return arabalar;
  }
}
