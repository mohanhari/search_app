import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:search_app/widgets/productListItem.dart';
import '../utils/productDetails.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductDetails> _productDetails = [
    ProductDetails(
        title: 'Apple Watch', tag: 'Watches', imageUrl: 'apple_watch.jpg'),
    ProductDetails(title: 'Iphone 11', tag: 'Phones', imageUrl: "iphone.jpg"),
    ProductDetails(title: 'Hp Laptop', tag: 'Laptops', imageUrl: "laptop1.jpg"),
    ProductDetails(
        title: 'Macbook pro', tag: 'Laptops', imageUrl: "macbook2.jpeg"),
    ProductDetails(
        title: 'AlienWare', tag: 'Laptops', imageUrl: "alienware.png"),
    ProductDetails(
        title: 'Samsung s10', tag: 'phones', imageUrl: "samsung_s10.jpg"),
    ProductDetails(
        title: 'One plus 7t', tag: 'phones', imageUrl: "one_plus.jpg"),
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
      scrollDirection: Axis.horizontal,
      itemCount: _productDetails.length,
      itemBuilder: (context, index) {
        return ProductListItem(
            title: _productDetails[index].title,
            tag: _productDetails[index].tag,
            imageUrl: _productDetails[index].imageUrl);
      },
    );
  }

  Widget _buildSearchResults() {
    return new ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _searchResult.length,
      itemBuilder: (context, idx) {
        return ProductListItem(
            title: _searchResult[idx].title,
            tag: _searchResult[idx].tag,
            imageUrl: _searchResult[idx].imageUrl);
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
        new Flexible(
            child: Container(
          height: 200.0,
          child: _searchResult.length != 0 || controller.text.isNotEmpty
              ? _buildSearchResults()
              : _buildUsersList(),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Center(child: new Text('Product List')),
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
          productDetail.tag.toLowerCase().contains(text.toLowerCase()))
        _searchResult.add(productDetail);
    });

    setState(() {});
  }
}
