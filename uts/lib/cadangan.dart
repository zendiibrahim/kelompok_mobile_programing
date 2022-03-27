import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uts/splashscreen.dart';

void main() => runApp( MyApp());


int _selectedIndex = 0;
int _b1 =0;
int _b2 =0;
int _b3 =0;
int _a1 =0;
int _a2 =0;
int _a3 =0;
int _total = 0;

List<List<int>> list = [[0,0,0],[0,0,0],[100000,100000,100000],[50000,50000,50000]];
void printAll(){
  print("test11 ${list[0]}");
  print("test23 ${list[1]}");
}



class MyApp extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }

}


class HomePage extends State<MyApp> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void count(){
    _total = 0;
    for (var i = 0; i < 3; i++) {
      var tot = list[0][i]*list[2][i];
      _total+=tot;
    }
    for (var i = 0; i < 3; i++) {
      var tot = list[1][i]*list[3][i];
      _total+=tot;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {



    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold (
        backgroundColor: Color(0xffFFC2C2),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Image.asset(
              "images/logo.png",
              width: 50,
              height: 50,
            ),
          ),
          centerTitle: true,
          title: Text ('Welcome To Kuko Restaurant ', style: TextStyle(fontSize: 15),),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {  },
                ),
            

                Container(
                  color: Color(0xffB8B8B8),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child:
                        Text ('Beef', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
                        ),)
                        ,)
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Beef Steak", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Beef+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp100.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(list[0][0]!=0) {
                                    _b1--;
                                    list[0][0] = _b1;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text('$_b1', textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _b1++;
                                  list[0][0] = _b1;
                                  setState(() {});
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Beef Steak", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Beef+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp100.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(_b2!=0) {
                                    _b2--;
                                    setState(() {});
                                    list[0][1] = _b2;
                                    count();
                                  }
                                },
                              ),
                              Text("$_b2", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _b2++;
                                  setState(() {});
                                  list[0][1] = _b2;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Beef Steaks", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Beef+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp100.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(_b3!=0) {
                                    _b3--;
                                    setState(() {});
                                    list[0][2] = _b3;
                                    count();
                                  }
                                },
                              ),
                              Text("$_b3", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _b3++;
                                  setState(() {});
                                  list[0][2] = _b3;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),


                Container(
                  color: Color(0xffB8B8B8),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child:
                        Text ('Ayam', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
                        ),)
                        ,)
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Steak Ayam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Ayam+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp50.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(_a1!=0) {
                                    _a1--;
                                    setState(() {});
                                    list[1][0] = _a1;
                                    count();
                                  }
                                },
                              ),
                              Text("$_a1", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _a1++;
                                  setState(() {});
                                  list[1][0] = _a1;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Steak Ayam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Ayam+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp50.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(_a2!=0) {
                                    _a2--;
                                    setState(() {});
                                    list[1][1] = _a2;
                                    count();
                                  }
                                },
                              ),
                              Text("$_a2", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _a2++;
                                  setState(() {});
                                  list[1][1] = _a2;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 1, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Steak Ayam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Ayam+Sayur", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp50.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),



                      Padding(padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 10.0),
                          child:
                          Row(
                            children: [
                              FlatButton(
                                child: Text('-', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  if(_a3!=0) {
                                    _a3--;
                                    setState(() {});
                                    list[1][2] = _a3;
                                    count();
                                  }
                                },
                              ),
                              Text("$_a3", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _a3++;
                                  setState(() {});
                                  list[1][2] = _a3;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/steak.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),
                Text("\n"),
                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      FlatButton(
                        child:
                        Text('Lihat Keranjang            Rp. ${_total}', style: TextStyle(fontSize: 20.0),),
                        color: Colors.indigoAccent,
                        minWidth: 5.0,
                        height: 40.0,
                        onPressed: () {

                        },
                      ),


                    ],
                  ),
                ),

              ],
            ),
          ),



        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: 'Keranjang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ) 
    );
  }
}
