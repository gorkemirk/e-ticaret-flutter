import 'dart:ui';

import 'package:flutter/material.dart';

import '../model/Account.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 300,
        itemCount: bitkiler.bitkilerlistesi.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(15),
              color: index % 2 == 0
                  ? Colors.orangeAccent.shade200
                  : Colors.indigo.shade200,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120)),
                          width: MediaQuery.of(context).size.width / 2.2,
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: Image.asset(
                            bitkiler.bitkilerlistesi[index].bitkifotourl,
                            fit: BoxFit.fitHeight,

                          )),

                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                      child: Column(
                        children: [
                          Text(
                            bitkiler.bitkilerlistesi[index].bitkiadi,
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
                              child: Container(height: 250,
                                child: Text(
                                  bitkiler.bitkilerlistesi[index].bitkiaciklama,
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(onTap: (){setState(() {
                                  if(bitkiler.bitkilerlistesi[index].favorite==false){
                                    bitkiler.bitkilerlistesi[index].favorite=true;
                                  }else{
                                    bitkiler.bitkilerlistesi[index].favorite=false;
                                  }
                                });},child: bitkiler.bitkilerlistesi[index].favorite==true?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border_outlined,color: Colors.red,)),
                                SizedBox(width: 15,),
                                GestureDetector(onTap: (){setState(() {
                                  if(bitkiler.bitkilerlistesi[index].sepette==false){
                                    bitkiler.bitkilerlistesi[index].sepette=true;
                                    bitkiler.bitkilerlistesi[index].sepettane=1;
                                  }else{
                                    bitkiler.bitkilerlistesi[index].sepette=false;
                                    bitkiler.bitkilerlistesi[index].sepettane=0;
                                  }
                                });},child:bitkiler.bitkilerlistesi[index].sepette==true ? Icon(Icons.shopping_bag,color: Colors.blue,): Icon(Icons.shopping_bag_outlined,color: Colors.blue,))
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
}
