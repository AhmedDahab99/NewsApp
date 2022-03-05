import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_demo_app/helper/data.dart';
import 'package:news_demo_app/helper/news.dart';
import 'package:news_demo_app/model/ArticleModel.dart';
import 'package:news_demo_app/model/CategoryModel.dart';
import 'package:news_demo_app/view/ArticlesView.dart';
import 'package:news_demo_app/view/CategoryView.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories=new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async{
    News newsClass= News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }
  CategoryTile categoryTile = new CategoryTile();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Today News',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
        ),
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              //Categories

              Container(
                height: 100.0,
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),

              //Blogs
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                      return NewsTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                        url: articles[index].url,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>CategoryNews(
              category : categoryName.toLowerCase()
            )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3, vertical: 10.0),
        padding: EdgeInsets.all(5.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imageUrl,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                width: 120,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  categoryName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                )
            )
          ],
        ),
      ),
    );
  }
}


class NewsTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  NewsTile({@required this.imageUrl,@required this.title,@required this.desc,@required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticlesView(
              blogUrl: url,
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(height: 8,),

            Card(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(title,style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold
                ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(desc, style: TextStyle(
              color: Colors.grey[200],
              fontSize: 15.0,
            ),
            textDirection: TextDirection.rtl,
            ),
          ],
        ),
      ),
    );
  }
}