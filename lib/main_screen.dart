import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/colors.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/DetailPage.dart';
import 'package:restaurant_app/ListMenu.dart';
import 'package:restaurant_app/ModelMenu.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Menu> menus;
  String search = '';

  @override
  void initState() {
    super.initState();

    menus = menuList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Restaurant App'),
          backgroundColor: IndigoBlue,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withOpacity(0.32))),
              child: TextField(
                onChanged: (String search) {
                  final menus = menuList.where((Menu) {
                    final name = Menu.name.toLowerCase();
                    final searchLower = search.toLowerCase();

                    return name.contains(searchLower);
                  }).toList();

                  setState(() {
                    this.search = search;
                    this.menus = menus;
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: "Search"),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text("What Do you want to eat?",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menus.length,
                  itemBuilder: (context, index) {
                    final Menu menu1 = menus[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return DetailPage(menu1: menu1);
                        }));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.34,
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.width * 0.30,
                                child: Image.network(menu1.imageurl)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(menu1.name,
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 10),
                            Text(menu1.price,
                                style: TextStyle(
                                    fontFamily: 'RobotoMono',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Text("Promo",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
            Container(
              height: 150,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/HOME-3.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/Group-6.png'),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
