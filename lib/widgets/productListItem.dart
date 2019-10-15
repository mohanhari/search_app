import 'package:flutter/material.dart';
import 'package:search_app/utils/constants.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final String tag;
  final String imageUrl;

  const ProductListItem({Key key, this.title, this.tag, this.imageUrl}) : super(key: key);

  Widget _buildProductDetails(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(
                'assets/$imageUrl'),
              fit: BoxFit.contain
            )
          ),
          height: 100.0,
          width: MediaQuery.of(context).size.width / 3.0,
        ),
        SizedBox(width: 10.0),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0.0, 0, 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.local_offer,
                  size: 16.0,
                ),
                Text(
                  tag,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ],
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5.0,
      child: new InkWell(
        onTap: () {
          Navigator.pushNamed(context, Constants.ROUTE_DETAILS_PAGE, arguments: imageUrl);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildProductDetails(context)
          ),
        ),
      ),
      margin: const EdgeInsets.all(10.0),
    );
  }
}
