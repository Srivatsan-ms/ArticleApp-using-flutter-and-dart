import 'package:firstapp/category_news.dart';
import 'package:firstapp/detailed_news.dart';
import 'package:firstapp/helper/data.dart';
import 'package:firstapp/modelfile/articlemodel.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/modelfile/categorymodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firstapp/helper/newsarticles.dart';

import 'about.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'package:cached_network_image/cached_network_image.dart';
bool toggle = true;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title});
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Categorymodel> categories = new List<Categorymodel>();
  List<ArticleModel> arti = new List<ArticleModel>();

  bool loading = true;
  bool theme = true;
  bool switch1 = false;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  void print1() {
    print("clicked");
  }

  getNews() async {
    NewsArticles news = NewsArticles();
    await news.getNews();
    arti = news.article;
    setState(() {
      loading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
          child: Drawer(
        child: Container(
          color: toggle ? Colors.white : Color(0xff212121),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 1.5,
                            color:
                                toggle ? Colors.black12 : Colors.blueAccent))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "News",
                      style: TextStyle(
                          color: toggle ? Color(0xff212121) : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                    Text(
                      "opedia",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 35,
                  margin: EdgeInsets.only(top: 15, left: 6),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 0.2,
                              color: toggle
                                  ? Colors.black12
                                  : Colors.blueAccent))),
                  child: Row(
                    children: [
                      Icon(Icons.brightness_4,
                          color:
                              toggle ? Color(0xff212121) : Colors.blueAccent),
                      SizedBox(width: 30),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(
                            "Dark Mode",
                            style: TextStyle(
                                color:
                                    toggle ? Color(0xff212121) : Colors.white),
                          )),
                      SizedBox(width: 100),
                      Switch(
                          value: switch1,
                          onChanged: (switchedvalue) {
                            setState(() {
                              switch1 = switchedvalue;
                              toggle = toggle ? false : true;
                            });
                          }),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => About2()));
                  print1();
                },
                child: Container(
                    height: 35,
                    margin: EdgeInsets.only(top: 15, left: 6),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.2,
                                color: toggle
                                    ? Colors.black12
                                    : Colors.blueAccent))),
                    child: Row(
                      children: [
                        Icon(Icons.person_pin,
                            color:
                                toggle ? Color(0xff212121) : Colors.blueAccent),
                        SizedBox(width: 30),
                        Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            child: Text(
                              "About",
                              style: TextStyle(
                                  color: toggle
                                      ? Color(0xff212121)
                                      : Colors.white),
                            )),
                      ],
                    )),
              ),
              Container(
                  //height: 35,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height - 280, left: 6),
                  //alignment: Alignment.bottomCenter,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          child: Row(children: [
                            Text(
                              "@i_vatsu",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontFamily: 'Open Sans',
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                    ],
                  )),
            ],
          ),
        ),
      )),
      appBar: AppBar(
        iconTheme: toggle
            ? IconThemeData(color: Colors.black12)
            : IconThemeData(color: Colors.white),
        title: Container(
          //margin: EdgeInsets.only(left: 60),
          //alignment: Alignment.center,
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(
                    color: toggle ? Color(0xff212121) : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "opedia",
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.bold),
              ),
              /*GestureDetector(
                onTap: () {
                  setState(() {
                    loading = true;
                    getNews();
                  });
                },
                child: Container(
                  //padding: EdgeInsets.only(left: 80),
                  child: Icon(
                    Icons.refresh,
                    color: toggle ? Colors.black12 : Colors.white,
                  ),
                ),
              ),*/
            ],
          ),
        ),
        backgroundColor: toggle ? Colors.white : Color(0xff212121),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              //toggle = toggle ? false : true;
              loading = true;
              getNews();
              //print(toggle);
            },
          );
        },
        child: Icon(Icons.refresh),
      ),
      body: SingleChildScrollView(
          //child: Container(
          child: Column(
        children: [
          ///tile
          Container(
            color: toggle ? Colors.white : Color(0xff212121),
            margin: toggle
                ? EdgeInsets.symmetric(vertical: 6, horizontal: 6)
                : EdgeInsets.symmetric(vertical: 0),
            height: 70,
            child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoryName,
                    toggle: toggle,
                  );
                }),
          ),

          ///blogie
          loading
              ? Container(
                  height: toggle
                      ? MediaQuery.of(context).size.height * 0.75
                      : MediaQuery.of(context).size.height * 0.78,
                  color: toggle ? Colors.white : Color(0xff212121),
                  child: Center(
                    child: Container(
                      child: SpinKitWave(
                          color: Colors.blueAccent, type: SpinKitWaveType.end),
                    ),
                  ),
                )
              /*
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SpinKitWave(
                        color: Colors.blueAccent, type: SpinKitWaveType.end),
                  ],
                )*/
              : Container(
                  color: toggle ? Colors.white : Color(0xff212121),
                  height: toggle
                      ? MediaQuery.of(context).size.height * 0.75
                      : MediaQuery.of(context).size.height * 0.78,
                  child: ListView.builder(
                      itemCount: arti.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          padding:
                              EdgeInsets.only(bottom: 16, right: 10, left: 10),
                          child: BlogTile(
                            imageUrl: arti[index].urlToImage,
                            desc: arti[index].description,
                            title: arti[index].title,
                            url: arti[index].url,
                            toggle: toggle,
                          ),
                        );
                      }),
                ),
        ],
      )),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  final toggle;
  CategoryTile({this.imageUrl, this.categoryName, @required this.toggle});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Category_News(
                      category: categoryName.toLowerCase(),
                      toggle: toggle,
                    )));
      },
      child: Container(
        color: toggle ? Colors.white : Color(0xff212121),
        margin: EdgeInsets.only(right: 16, left: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[700]),
                  borderRadius: BorderRadius.circular(6),
                  shape: BoxShape.rectangle,
                  color: Colors.black26,
                ),
                child: Text(categoryName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )))
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url,
      @required this.toggle});
  final imageUrl, title, desc, url, toggle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailed_news(
                      url: url,
                      toggle: toggle,
                    )));
      },
      child: Container(
        //padding: EdgeInsets.only(bottom: 16, right: 10, left: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: toggle ? Colors.black12 : Colors.grey[700]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: toggle ? Colors.grey[200] : Colors.grey[900],
                blurRadius: 5.0,
              ),
            ]),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Text(title,
                  style: TextStyle(
                      color: toggle ? Color(0xff212121) : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5, right: 10, left: 10),
              child: Text(desc,
                  style: TextStyle(
                      letterSpacing: 0.5,
                      color: toggle ? Colors.grey[700] : Colors.grey[300],
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}

/*class DrawerTab extends StatefulWidget {
  @override
  _DrawerTabState createState() => _DrawerTabState();
}

class _DrawerTabState extends State<DrawerTab> {
  bool switch1 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2,
                        color: toggle ? Colors.black12 : Colors.white))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: TextStyle(
                      color: toggle ? Color(0xff212121) : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
                Text(
                  "opedia",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
          Container(
              height: 30,
              margin: EdgeInsets.only(top: 15, left: 6),
              child: Row(
                children: [
                  Icon(Icons.brightness_4),
                  SizedBox(width: 90),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text("Dark Mode")),
                  SizedBox(width: 40),
                  Switch(
                      value: switch1,
                      onChanged: (switchedvalue) {
                        setState(() {
                          switch1 = switchedvalue;
                          toggle = toggle ? false : true;
                        });
                      }),
                ],
              ))
        ],
      ),
    ));
  }
}
*/
