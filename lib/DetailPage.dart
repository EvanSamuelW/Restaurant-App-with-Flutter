import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ModelMenu.dart';
import 'package:restaurant_app/colors.dart';

class DetailPage extends StatefulWidget {
  final Menu menu1;

  const DetailPage({required this.menu1});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int amount = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: <Widget>[
            Image.network(widget.menu1.imageurl,
                height: screenSize.height * 0.40,
                width: double.infinity,
                fit: BoxFit.fill),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: lightblue,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(widget.menu1.name,style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                        color: IndigoBlue
                    ),textAlign: TextAlign.left,),
                    Text(widget.menu1.price,textAlign: TextAlign.right, style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      color: IndigoBlue
                    ))
                  ],

                ),
              ),
              SizedBox(height: 40,)
              ,Text(widget.menu1.deskripsi, style: TextStyle(
                height: 1.5,
                fontSize: 20,
                  color: IndigoBlue
              ),),
              SizedBox(height: 40),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      child: RaisedButton(color: lightblue,onPressed: (
                          ){
                        setState(() {
                          if(this.amount > 0)
                            {
                              this.amount--;
                            }

                        });
                      },
                        child: Text('-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    ),
                    Container(padding: EdgeInsets.all(40),child: Text(this.amount.toString(),style: TextStyle(
                      fontSize: 30,
                        color: IndigoBlue
                    ),),),
                    Container(
                      width: 40,
                      child: RaisedButton(color: lightblue,onPressed: (){
                        setState(() {
                          this.amount++;
                        });
                      },
                        child: Text('+',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))))
      ],
    ));
  }
}
