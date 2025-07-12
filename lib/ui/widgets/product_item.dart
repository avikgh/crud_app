import 'package:flutter/material.dart';

import '../../entities/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.productDetails,
  });

  final ProductDetails productDetails;

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
                image: NetworkImage(productDetails.image, scale: 1)
              )
            ),
          ),
        ),
        title: Text(productDetails.productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Code: ${productDetails.productCode}'),
            Text('Unit Price: ${productDetails.unitPrice}'),
            Text('Total: ${productDetails.totalPrice}')
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.edit, size: 20, color: Colors.black54,),
            ),
            IconButton(
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('Delete Item'),
                    content: Text('Are you want delete this item?'),
                    actions: [
                      TextButton(
                        onPressed: () {

                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text('Delete'),
                      )
                    ],
                    surfaceTintColor: Color(0xFFC5C3F2),
                  );
                });
              },
              icon: Icon(Icons.delete, size: 20, color: Colors.black54,),
            )
          ],
        ),
      ),
    );
  }
}