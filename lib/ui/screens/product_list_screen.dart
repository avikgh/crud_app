import 'dart:convert';

import 'package:crud_app/entities/product_details.dart';
import 'package:crud_app/ui/screens/add_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductDetails> productList = [];
  bool _circularProgressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Visibility(
        visible: _circularProgressIndicator,
        replacement: _buildCircularProgressIndicator(),
        child: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductItem(
              productDetails: productList[index],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddProductScreen()));
        },
        label: Text(
          'Add',
          style: TextStyle(fontSize: 15),
        ),
        icon: Icon(
          Icons.add,
          size: 22,
        ),
      ),
    );
  }

  Future<void> _getProduct() async {
    const String url = 'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(url);
    final Response response = await get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> productResponse = jsonDecode(response.body);
      for (Map<String, dynamic> products in productResponse['data']) {
        productList.add(ProductDetails(
            id: products['_id'],
            productName: products['ProductName'],
            productCode: products['ProductCode'],
            unitPrice: products['UnitPrice'],
            totalPrice: products['TotalPrice'],
            quantity: products['Qty'],
            image: products['Img']));
      }
    }
    _circularProgressIndicator = true;
    setState(() {});
  }

  @override
  void initState() {
    _getProduct();
    super.initState();
  }

  Widget _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Color(0xFF8986C4),
      ),
    );
  }
}
