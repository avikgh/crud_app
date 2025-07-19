import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../entities/product_details.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.products});

  final ProductDetails products;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Product'),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameTEController,
                    decoration: InputDecoration(label: Text('Product Name')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _codeTEController,
                    decoration: InputDecoration(label: Text('Product Code')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _unitPriceTEController,
                    decoration: InputDecoration(label: Text('Unit Price')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _totalPriceTEController,
                    decoration: InputDecoration(label: Text('Total Price')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _quantityTEController,
                    decoration: InputDecoration(label: Text('Quantity')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _imageTEController,
                    decoration: InputDecoration(label: Text('Image')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _updateProduct();
                        }
                      },
                      child: Text(
                        'Update Product',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updateProduct() async {
    String url =
        'https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.products.id}';
    Uri uri = Uri.parse(url);
    Map<String, String> productDetails = {
      "ProductName": _nameTEController.text.trim() ?? '',
      "ProductCode": _codeTEController.text.trim() ?? '',
      "Img": _imageTEController.text.trim() ?? '',
      "UnitPrice": _unitPriceTEController.text.trim() ?? '',
      "Qty": _quantityTEController.text.trim() ?? '',
      "TotalPrice": _totalPriceTEController.text.trim() ?? ''
    };
    final Response response = await post(uri,
        body: jsonEncode(productDetails),
        headers: {'content-type': 'application/json'});
    if(response.statusCode == 200) {
      _buildSnackBar('Product updated successfully.');
      Navigator.pop(context, true);
    } else {
      _buildSnackBar('Failed to update product. Try again.');
    }
  }

  void _buildSnackBar(String content) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(content),
          backgroundColor: Color(0xFF8986C4),
          margin: EdgeInsets.all(20),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        )
    );
  }

  String? validate(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Enter a valid value';
    }
    return null;
  }

  @override
  void initState() {
    _nameTEController.text = widget.products.productName;
    _codeTEController.text = widget.products.productCode;
    _unitPriceTEController.text = widget.products.unitPrice;
    _totalPriceTEController.text = widget.products.totalPrice;
    _quantityTEController.text = widget.products.quantity;
    _imageTEController.text = widget.products.image;
    super.initState();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _codeTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _quantityTEController.dispose();
    _imageTEController.dispose();
    super.dispose();
  }
}
