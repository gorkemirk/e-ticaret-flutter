// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

Araba welcomeFromJson(String str) => Araba.fromJson(json.decode(str));

String welcomeToJson(Araba data) => json.encode(data.toJson());

class Araba {
  Araba({
    required this.arabaAdi,
    required this.uretimYeri,
    required this.yil,
    required this.model,
  });

  String arabaAdi;
  String uretimYeri;
  String yil;
  List<Model> model;

  factory Araba.fromJson(Map<String, dynamic> json) => Araba(
        arabaAdi: json["araba_adi"],
        uretimYeri: json["uretim_yeri"],
        yil: json["yil"],
        model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "araba_adi": arabaAdi,
        "uretim_yeri": uretimYeri,
        "yil": yil,
        "model": List<dynamic>.from(model.map((x) => x.toJson())),
      };
}

class Model {
  Model({
    required this.modelAdi,
    required this.fiyat,
    required this.benzinli,
  });

  String modelAdi;
  int fiyat;
  bool benzinli;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzinli: json["benzinli"],
      );

  Map<String, dynamic> toJson() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzinli": benzinli,
      };
}

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

class Users {
  Users({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}

class Account {
  late String email;
  late String pass;
  String name = "Görkem";
  String surname = "Irk";
  Account({required this.email, required this.pass});
}

class bitkiler {
  late String bitkiadi;
  late String bitkiaciklama;
  late String bitkifotourl;
  late bool sepette;
  late bool favorite;
  late String kategori;
  late int uniqekey;
  int sepettane = 0;
  bitkiler(
      {required this.bitkiadi,
      required this.bitkiaciklama,
      required this.bitkifotourl,
      this.favorite = false,
      this.sepette = false,
      required this.kategori,
      required this.uniqekey});
  static List<bitkiler> bitkilerlistesi = [
    bitkiler(
        bitkiadi: "Yasemin Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "vücut",
        uniqekey: 1),
    bitkiler(
        bitkiadi: "Ada Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "vücut",
        uniqekey: 2),
    bitkiler(
        bitkiadi: "Gül Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "ayak",
        uniqekey: 3),
    bitkiler(
        bitkiadi: "Trabzon Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "yüz",
        uniqekey: 4),
    bitkiler(
        bitkiadi: "Papatya Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "vücut",
        uniqekey: 5),
    bitkiler(
        bitkiadi: "Melisa Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "ayak",
        uniqekey: 6),
    bitkiler(
        bitkiadi: "Sakin Çayı",
        bitkiaciklama:
            "Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Beşyüz yıl boyunca varlığını sürdürmekle kalmamış, aynı zamanda pek değişmeden elektronik dizgiye de sıçramıştır. 1960'larda Lorem Ipsum pasajları da içeren Letraset yapraklarının yayınlanması ile ve yakın zamanda Aldus PageMaker gibi Lorem Ipsum sürümleri içeren masaüstü yayıncılık yazılımları ile popüler olmuştur.",
        bitkifotourl: 'assets/bitki.jpeg',
        kategori: "yüz",
        uniqekey: 7),
  ];
  static List<String> kategoriler = [
    "Vücut Bakım",
    "Yüz Bakım",
    "Ayak Bakım",
  ];
}
