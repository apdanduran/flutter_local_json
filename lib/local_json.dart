import 'package:flutter/material.dart';

class LocalJsonKullanimi extends StatefulWidget {
  @override
  _LocalJsonKullanimiState createState() => _LocalJsonKullanimiState();
}

class _LocalJsonKullanimiState extends State<LocalJsonKullanimi> {
  List tumArabalar;

  @override
  void initState() {
    super.initState();
    debugPrint("init state calıstı");
    tumArabalar = [];
    /*  tumArabalar = veriKaynaginiOku().then((gelenArabaListesi) {
      setState(() {
        tumArabalar = gelenArabaListesi;
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build calisti");
    veriKaynaginiOku();
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Kullanimi"),
      ),
      body: Container(
        child: FutureBuilder(
            future: veriKaynaginiOku(),
            builder: (context, sonuc) {
              if (sonuc.hasData) {
                tumArabalar = sonuc.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tumArabalar[index]["araba_adi"]),
                      subtitle: Text(tumArabalar[index]["ulke"]),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    debugPrint("build çalıştı");
    return Scaffold(
      appBar: AppBar(
        title: Text("local json kullanimi"),
      ),
      body: tumArabalar != null
          ? Container(
              child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tumArabalar[index]["araba_adi"]),
                  subtitle: Text(tumArabalar[index]["ulke"]),
                );
              },
              itemCount: tumArabalar.length,
            ))
          : Center(),
    );
  }
*/
  veriKaynaginiOku() async {
    /*  Future<String> jsonOku =
        DefaultAssetBundle.of(context).loadString("assets/data/araba.json");
    jsonOku.then(
      (okunanJson) {
        debugPrint("gelen json :" + okunanJson);
        return okunanJson;
      },
    );*/

    var gelenJson = await DefaultAssetBundle.of(context)
        .loadString("assets/data/araba.json");
    debugPrint("gelen json :" + gelenJson);
  }
}
