import 'package:flutter/material.dart';
import '../utils/productDetails.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductDetails> _productDetails = [
    ProductDetails(title: 'Image 1', tag: 'tag 1', imageUrl: 'https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg'),
    ProductDetails(title: 'Image 3', tag: 'tag 2', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 3', tag: 'tag 3', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 4', tag: 'tag 4', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 5', tag: 'tag 5', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 6', tag: 'tag 6', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 7', tag: 'tag 7', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
    ProductDetails(title: 'Image 8', tag: 'tag 8', imageUrl: "https://n1.sdlcdn.com/imgs/c/9/8/Lambency-Brown-Solid-Casual-Blazers-SDL781227769-1-1b660.jpg"),
  ];
  List<ProductDetails> _searchResult = [];
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add

  @override
  void initState() {
    super.initState();

  }

  Widget _buildUsersList() {
    return new ListView.builder(
      itemCount: _productDetails.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/details_page");
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                child: Image.network(
                  _productDetails[index].imageUrl,
                ),
                height: 250.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2.2,
                ),
                SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                      child: Text(
                        _productDetails[index].title,
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      _productDetails[index].tag
                    )
                  ],
                )
              ]
            ),
          ),
          margin: const EdgeInsets.all(10.0),
        );
      },
    );
  }

  Widget _buildSearchResults() {
    return new ListView.builder(
      itemCount: _searchResult.length,
      itemBuilder: (context, idx) {
        return new Card(
          child: new InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/details_page");
            },
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Image.network(
                      _productDetails[idx].imageUrl,
                    ),
                    height: 250.0,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2.2,
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 10.0),
                        child: Text(
                          _productDetails[idx].title,
                          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                          _productDetails[idx].tag
                      )
                    ],
                  )
                ]
            ),
          ),
          margin: const EdgeInsets.all(10.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Container(
            color: Theme.of(context).primaryColor, child: _buildSearchBox()),
        new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? _buildSearchResults()
                : _buildUsersList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home'),
        elevation: 0.0,
      ),
      body: _buildBody(),
      resizeToAvoidBottomPadding: true,
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _productDetails.forEach((productDetail) {
      if (productDetail.title.toLowerCase().contains(text.toLowerCase()) ||
          productDetail.tag.toLowerCase().contains(text.toLowerCase())) _searchResult.add(productDetail);
    });

    setState(() {});
  }
}