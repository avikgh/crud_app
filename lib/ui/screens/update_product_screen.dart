import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Product'),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),
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
                    decoration: InputDecoration(
                        label: Text('Product Name')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _codeTEController,
                    decoration: InputDecoration(
                        label: Text('Product Code')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _unitPriceTEController,
                    decoration: InputDecoration(
                        label: Text('Unit Price')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _totalPriceTEController,
                    decoration: InputDecoration(
                        label: Text('Total Price')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _quantityTEController,
                    decoration: InputDecoration(
                        label: Text('Quantity')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: _imageTEController,
                    decoration: InputDecoration(
                        label: Text('Image')
                    ),
                    validator: validate,
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {

                        }
                      },
                      child: Text('Update Product', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),),
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

  String? validate(String? value) {
    if(value?.trim().isEmpty ?? true) {
      return 'Enter a valid value';
    }
    return null;
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