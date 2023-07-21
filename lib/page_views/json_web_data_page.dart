import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/scheduler.dart';
import 'package:not_paylas/model/Account.dart';

class JsonWebPage extends StatefulWidget {
  const JsonWebPage({Key? key}) : super(key: key);

  @override
  State<JsonWebPage> createState() => _JsonWebPageState();
}

late Future<List<Users>> _allUsers;

class _JsonWebPageState extends State<JsonWebPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allUsers = _getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote Api with Dio"),
      ),
      body: FutureBuilder<List<Users>>(
        future: _allUsers,
        builder: (context, snapshot) {
          return ListView.builder(itemCount:snapshot.data?.length ,itemBuilder: (context,index){
            if(snapshot.hasData){
              return Card(elevation: 4,child: ListTile(hoverColor: Colors.red,title: Text("name:"+snapshot.data![index].name+"\nemail:"+snapshot.data![index].email+"\nusername:"+snapshot.data![index].username),),);
            }else if(snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }else{
              return Center(child: CircularProgressIndicator());
            }
          });
        },
      ),
    );
  }
  Future<List<Users>> _getUsersData() async {
    Future.delayed(Duration(seconds: 3),(){return debugPrint("3 saniye işlem  bitti");});
    try {
      var response =
      await Dio().get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        //status code http cod durumudur 404 not found gıbı 200 başarılı demektir data gelmıstır
        List<Users> _dioUsersDatas =
        (response.data as List).map((e) => Users.fromJson(e)).toList();
        return _dioUsersDatas;
      }
      return [];
    } on Dio catch (e) {
      return Future.error(e);
    }
  }
}


