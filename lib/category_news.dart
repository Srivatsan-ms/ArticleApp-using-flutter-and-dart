import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'detailed_news.dart';
import 'helper/newsarticles.dart';
import 'modelfile/articlemodel.dart';

// ignore: camel_case_types
class Category_News extends StatefulWidget {
  final String category;
  final toggle;
  Category_News({this.category, this.toggle});
  @override
  _Category_NewsState createState() => _Category_NewsState();
}

// ignore: camel_case_types
class _Category_NewsState extends State<Category_News> {
  List<ArticleModel> arti = new List<ArticleModel>();

  bool loading = true;
  bool t = false;
  bool switch1 = false;
  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsArticles news = CategoryNewsArticles();
    await news.getNews(widget.category);
    arti = news.article;
    await widget.toggle;
    t = widget.toggle;
    setState(() {
      loading = false;
    });
  }

  ClampingScrollPhysics clampingScrollPhysics = ClampingScrollPhysics();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            backgroundColor: t ? Colors.white : Color(0xff212121),
            body: Center(
              child: Container(
                child: SpinKitWave(
                    color: Colors.blueAccent, type: SpinKitWaveType.end),
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: t ? Colors.white : Color(0xff212121),
              leading: BackButton(
                color: t ? Colors.black : Colors.white,
              ),
              title: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "News",
                    style: TextStyle(
                        color: t ? Color(0xff212121) : Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "opedia",
                    style: TextStyle(
                        color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        loading = true;
                        getCategoryNews();
                      });
                    },
                    child: Container(
                      //padding: EdgeInsets.only(left: 80),
                      child: Icon(
                        Icons.refresh,
                        color: t ? Colors.black12 : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                Opacity(
                  opacity: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.save),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  loading
                      ? Center(
                          child: Container(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : SizedBox(
                          child: Container(
                            color: t ? Colors.white : Color(0xff212121),
                          ),
                          height: 10,
                        ),
                  Container(
                    color: t ? Colors.white : Color(0xff212121),
                    height: MediaQuery.of(context).size.height * 0.88,
                    //height: 560,
                    child: ListView.builder(
                        itemCount: arti.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: clampingScrollPhysics,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                bottom: 16, right: 10, left: 10),
                            child: BlogTile(
                              imageUrl: arti[index].urlToImage,
                              desc: arti[index].description,
                              title: arti[index].title,
                              url: arti[index].url,
                              t: t,
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ));
  }
}

class BlogTile extends StatelessWidget {
  BlogTile(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url,
      @required this.t});
  final imageUrl, url, t, title, desc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => detailed_news(
                      url: url,
                      toggle: t,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: t ? Colors.black12 : Colors.grey[700]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: t ? Colors.grey[200] : Colors.grey[900],
                blurRadius: 5.0,
              ),
            ]),
        // color: t ? Colors.white : Color(0xff212121),
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
              child: Text(title.toString(),
                  style: TextStyle(
                      color: t ? Color(0xff212121) : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Text(desc.toString(),
                  style: TextStyle(
                      color: t ? Color(0xff212121) : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
