import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int _selectedIndex = 0;
int _option = 0;
int _a1 =0;
int _a2 =0;
int _a3 =0;
int _b1 =0;
int _b2 =0;
int _b3 =0;
int _c1 =0;
int _c2 =0;
int _c3 =0;
int _m1 =0;
int _m2 =0;
int _m3 =0;
int _s1 =0;
int _s2 =0;
int _s3 =0;
int _total = 0;



List<List<int>> makanan = [[0,0,0],[0,0,0],[0,0,0],[25000,15000,30000],[100000,30000,20000],[50000,25000,50000]];
List<List<int>> minuman = [[0,0,0],[8000,20000,30000]];
List<List<int>> snack = [[0,0,0],[25000,20000,30000]];
List<int> res = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }

}


class HomePage extends State<Home> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _option = index;
    });
  }
  
  void count(){
    _total = 0;
    //makanan
    for (var i = 0; i < 3; i++) {
      var tot = makanan[0][i]*makanan[3][i];
      _total+=tot;
    }
    for (var i = 0; i < 3; i++) {
      var tot = makanan[1][i]*makanan[4][i];
      _total+=tot;
    }
    for (var i = 0; i < 3; i++) {
      var tot = makanan[2][i]*makanan[5][i];
      _total+=tot;
    }

    //minuman
    for (var i = 0; i < 3; i++) {
      var tot = minuman[0][i]*minuman[1][i];
      _total+=tot;
    }

    //snack
    for (var i = 0; i < 3; i++) {
      var tot = snack[0][i]*snack[1][i];
      _total+=tot;
    }


    setState(() {});
  }
  
  Future<bool> OnWillPop() async {
    setState(() {
      _option=0;
    });
    return false;
  }


  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(onWillPop: OnWillPop,
    child: 
    MaterialApp(
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
        body: getIndex()==0? 
        //main menu
          Container(
            child:
            Column(children: [
              FlatButton(
                                child: Text('MAKANANAN', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  setState(() {
                                    _option = 4;
                                  });
                                },
                              ),
                              FlatButton(
                                child: Text('MINUMAN', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  setState(() {
                                    _option = 5;
                                  });
                                },
                              ),
                              FlatButton(
                                child: Text('SNACK', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  setState(() {
                                    _option = 6;
                                  });
                                },
                              ),
                              FlatButton(
                                child: Text('Keranjang', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  setState(() {
                                    _option = 1;
                                  });
                                  _onItemTapped(1);
                                },
                              ),

            ],),
           ) 
           
           : getIndex()==4? 

        //makanan menu
          Container(
            
            child: SingleChildScrollView(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,children: [
              IconButton(
                
                  icon: Icon(Icons.arrow_back),
                  onPressed: () { _onItemTapped(0); },
                ),
              Container(
                  color: Color(0xffB8B8B8),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child:
                        Text ('Nasi Goreng', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
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
                            Text("Nasi Goreng Ayam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(makanan[0][0]!=0) {
                                    _a1--;
                                    makanan[0][0] = _a1;
                                    res[0] = _a1;
                                    setState(() {});
                                  count();
                                  }
                                },
                              ),
                              Text('$_a1', textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _a1++;
                                  makanan[0][0] = _a1;
                                  res[0] = _a1;
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
                          "images/nasgorayam.jpg",
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
                            Text("Nasi Goreng Bakso", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Bakso", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp15.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                    res[1] = _a2;
                                    makanan[0][1] = _a2;
                                    setState(() {});
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
                                  res[1] = _a2;
                                  makanan[0][1] = _a2;
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
                          "images/bakso.jpg",
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
                            Text("Nasi Goreng Seafood", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Seafood", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                    res[2] = _a3;
                                    makanan[0][2] = _a3;
                                    setState(() {});
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
                                  res[2] = _a3;
                                  makanan[0][2] = _a3;
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
                          "images/seafood.jpg",
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
                        Text ('Sapi', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
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
                                  if(makanan[1][0]!=0) {
                                    _b1--;
                                    res[3] = _b1;
                                    makanan[1][0] = _b1;
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
                                  makanan[1][0] = _b1;
                                  res[3] = _b1;
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
                            Text("Sapi Ladah Hitam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Sapi", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                    res[4] = _b2;
                                    makanan[1][1] = _b2;
                                    setState(() {});
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
                                  res[4] = _b2;
                                  makanan[1][1] = _b2;
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
                          "images/sapiladahhitam.jpg",
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
                            Text("Sapi Salted Egg", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Sapi", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                    res[5] = _b3;
                                    makanan[1][2] = _b3;
                                    setState(() {});
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
                                  res[5] = _b3;
                                  makanan[1][2] = _b3;
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
                          "images/saltedegg.webp",
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
                                  if(_c1!=0) {
                                    _c1--;
                                    res[6] = _c1;
                                    makanan[2][0] = _c1;
                                    setState(() {});
                                  count();
                                  }
                                },
                              ),
                              Text("$_c1", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _c1++;
                                  res[6] = _c1;
                                  makanan[2][0] = _c1;
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
                          "images/steak-ayam-tokomesin.jpg",
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
                            Text("Nasi Ayam Geprek", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(_c2!=0) {
                                    _c2--;
                                    res[7] = _c2;
                                    makanan[2][1] = _c2;
                                    setState(() {});
                                  count();
                                  }
                                },
                              ),
                              Text("$_c2", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _c2++;
                                  res[7] = _c2;
                                  makanan[2][1] = _c2;
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
                          "images/geprek.png",
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
                            Text("Nasi Ayam 3 Rasa", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
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
                                  if(_c3!=0) {
                                    _c3--;
                                    res[8] = _c3;
                                    makanan[2][2] = _c3;
                                    setState(() {});
                                  count();
                                  }
                                },
                              ),
                              Text("$_c3", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _c3++;
                                  res[8] = _c3;
                                  makanan[2][2] = _c3;
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
                          "images/3rasa.jpg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                )  

            ],)),
          ): getIndex()==5?
          //minuman menu
Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () { _onItemTapped(0); },
                ),
                Container(
                  color: Color(0xffB8B8B8),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child:
                        Text ('Minuman', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
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
                            Text("Es Teh", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Teh+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp8.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(minuman[0][0]!=0) {
                                    _m1--;
                                    minuman[0][0] = _m1;
                                    res[9] = _m1;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text('$_m1', textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _m1++;
                                  minuman[0][0] = _m1;
                                  res[9] = _m1;
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
                          "images/esteh.jpg",
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
                            Text("Es Jeruk", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Air Jeruk+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(_m2!=0) {
                                    _m2--;
                                    res[10] = _m2;
                                    minuman[0][1] = _m2;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text("$_m2", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _m2++;
                                  res[10] = _m2;
                                  minuman[0][1] = _m2;
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
                          "images/esjeruk.jpg",
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
                            Text("Jus Alpukat", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Alpukat+Air+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(_m3!=0) {
                                    _m3--;
                                    minuman[0][2] = _m3;
                                    res[11] = _m3;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text("$_m3", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _m3++;
                                  setState(() {});
                                  minuman[0][2] = _m3;
                                  res[11] = _m3;
                                  count();
                                },
                              ),
                            ],
                          )
                      ),
                      Padding(padding: EdgeInsets.only(right: 1, left: 20),
                        child:
                        Image.asset(
                          "images/jusalpukat.jpeg",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),


                
                
              ],
            ),
          ),



        ):getIndex()==6?

        //snack menu
        
        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () { _onItemTapped(0); },
                ),
            

                Container(
                  color: Color(0xffB8B8B8),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                        child:
                        Text ('Snack', textAlign: TextAlign.left, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold
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
                            Text("Kentang Goreng", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Sambal", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(snack[0][0]!=0) {
                                    _s1--;
                                    snack[0][0] = _s1;
                                    res[12] = _s1;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text('$_s1', textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _s1++;
                                  snack[0][0] = _s1;
                                  res[12] = _s1;
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
                          "images/kentang.jpg",
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
                            Text("Roti Panggang", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Roti+Topping", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(_s2!=0) {
                                    _s2--;
                                    snack[0][1] = _s2;
                                    res[13] = _s2;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text("$_s2", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _s2++;
                                  snack[0][1] = _s2;
                                  res[13] = _s2;
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
                          "images/ropang.jpg",
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
                            Text("Croffle", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Croffle+Topping", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
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
                                  if(_s3!=0) {
                                    _s3--;
                                    snack[0][2] = _s3;
                                    res[14] = _s3;
                                    setState(() {});
                                    count();
                                  }
                                },
                              ),
                              Text("$_s3", textAlign: TextAlign.left, style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400
                              ),
                              ),
                              FlatButton(
                                child: Text('+', style: TextStyle(fontSize: 20.0),),
                                color: Colors.black26,
                                minWidth: 10,
                                onPressed: () {
                                  _s3++;
                                  snack[0][2] = _s3;
                                  res[14] = _s3;
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
                          "images/croffle.png",
                          width: 75,

                        ),
                      ),
                    ],
                  ),
                ),


                

              ],
            ),
          ),



        ):getIndex()==1?
        //keranjang belanja page
            
            
            (
              SingleChildScrollView( child:
              Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              if(_a1!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nasi Goreng Ayam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_a1")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_a2!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nasi Goreng Bakso", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Bakso", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp15.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_a2")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_a3!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nasi Goreng Seafood", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Telur+Seafood", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_a3")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_b1!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
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
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_b1")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_b2!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sapi Ladah Hitam", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Sapi", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_b2")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_b3!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Sapi Salted Egg", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Sapi", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_b3")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_c1!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
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
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_c1")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_c2!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nasi Ayam Geprek", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_c2")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_c3!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nasi Ayam 3 Rasa", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Nasi+Ayam", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp50.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_c3")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_m1!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Es Teh", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Teh+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp8.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_m1")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_m2!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Es Jeruk", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Air Jeruk+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_m2")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_m3!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Jus Alpukat", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Alpukat+Air+Es", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_m3")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_s1!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Kentang Goreng", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Kentang+Sambal", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp25.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_s1")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_s2!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Roti Panggang", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Roti+Topping", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp20.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_s2")
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if(_s3!=0) Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget> [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 5, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Croffle", textAlign: TextAlign.left, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                            Text("Croffle+Topping", textAlign: TextAlign.left,style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                            Text("Rp30.000,00", textAlign: TextAlign.left, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)
                          ],
                        ),
                      ),
                      
                      Padding(padding: EdgeInsets.only(right: 5, left: 20),
                        child:
                        Text("$_s3")
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if(_total!=0)
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      FlatButton(
                        child:
                        Text('Total Harga Rp. ${_total}', style: TextStyle(fontSize: 20.0),),
                        color: Colors.indigoAccent,
                        minWidth: 5.0,
                        height: 40.0,
                        onPressed: () {
                          _option=2;
                          _selectedIndex=2;
                          setState(() {
                          });
                        },
                      ),


                    ],
                  ),
                ),
            if(_total==0)
              Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Keranjang Kosong!",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            
            
            

            ],
            ))
            )


        //history menu
          :
          Text("History Page")



          ,
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
    ));
  }
}
int getIndex(){
  return _option;
}

