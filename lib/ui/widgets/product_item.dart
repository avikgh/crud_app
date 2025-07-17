import 'package:crud_app/ui/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../entities/product_details.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productDetails,
  });

  final ProductDetails productDetails;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFe0dfff),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                image: DecorationImage(
                    image:
                        NetworkImage(widget.productDetails.image, scale: 1))),
          ),
        ),
        title: Text(widget.productDetails.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Code: ${widget.productDetails.productCode}'),
            Text('Unit Price: ${widget.productDetails.unitPrice}'),
            Text('Total: ${widget.productDetails.totalPrice}')
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateProductScreen(
                              products: widget.productDetails,
                            )));
              },
              icon: Icon(
                Icons.edit,
                size: 20,
                color: Colors.black54,
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Delete Item'),
                        content: Text('Are you want delete this item?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              _deleteProduct();
                            },
                            child: Text('Delete'),
                          )
                        ],
                        surfaceTintColor: Color(0xFFC5C3F2),
                      );
                    });
              },
              icon: Icon(
                Icons.delete,
                size: 20,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _deleteProduct() async {
    String url =
        'https://crud.teamrabbil.com/api/v1/DeleteProduct/${widget.productDetails.id}';
    Uri uri = Uri.parse(url);
    final Response response =
        await get(uri, headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      _buildSnackBar('Product deleted successfully.');
    } else {
      _buildSnackBar('failed to delete the product. Try again');
    }
  }

  void _buildSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }
}
