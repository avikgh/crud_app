import 'dart:convert';
import 'package:crud_app/main.dart';
import 'package:crud_app/ui/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _codeTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _circularProgressIndicator = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add Product'),
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
                    keyboardType: TextInputType.text,
                    controller: _nameTEController,
                    decoration: InputDecoration(label: Text('Product Name')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _codeTEController,
                    decoration: InputDecoration(label: Text('Product Code')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _unitPriceTEController,
                    decoration: InputDecoration(label: Text('Unit Price')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _quantityTEController,
                    decoration: InputDecoration(label: Text('Quantity')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _totalPriceTEController,
                    decoration: InputDecoration(label: Text('Total Price')),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _imageTEController,
                    decoration: InputDecoration(label: Text('Image')),
                    validator: validate,
                  ),
                  SizedBox(height: 30),
                  Visibility(
                    visible: _circularProgressIndicator,
                    replacement: _buildCircularProgressIndicator(),
                    child: SizedBox(
                      height: 50,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _addProduct();
                          }
                        },
                        child: Text(
                          'Add Product',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
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

  Future<void> _addProduct() async {
    _circularProgressIndicator = false;
    setState(() {});
    const String url = 'https://crud.teamrabbil.com/api/v1/CreateProduct';
    Uri uri = Uri.parse(url);
    final Response response = await post(uri,
        body: jsonEncode({
          "ProductName": _nameTEController.text.trim() ?? '',
          "ProductCode": _codeTEController.text.trim() ?? '',
          "Img": _imageTEController.text.trim() ?? '',
          "UnitPrice": _unitPriceTEController.text.trim() ?? '',
          "Qty": _quantityTEController.text.trim() ?? '',
          "TotalPrice": _totalPriceTEController.text.trim() ?? '',
        }),
        headers: {'content-type': 'application/json'});
    if (response.statusCode == 200) {
      _nameTEController.clear();
      _codeTEController.clear();
      _unitPriceTEController.clear();
      _quantityTEController.clear();
      _totalPriceTEController.clear();
      _imageTEController.clear();
      _circularProgressIndicator = true;
      CustomSnackBar.buildSnackBar(
          'Successful', 'Product added successfully.', true, context);
      setState(() {});
    } else {
      _circularProgressIndicator = true;
      CustomSnackBar.buildSnackBar(
          'Failed', 'Product added failed.', false, context);
      setState(() {});
    }
  }

  String? validate(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Enter a valid value';
    }
    return null;
  }

  Widget _buildCircularProgressIndicator() {
    return CircularProgressIndicator(
      color: Color(0xFF8986C4),
    );
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
