class ProductDetails {
  final String id;
  final String productName;
  final String productCode;
  final String unitPrice;
  final String totalPrice;
  final String quantity;
  final String image;

  ProductDetails(
      {required this.id,
      required this.productName,
      required this.productCode,
      required this.unitPrice,
      required this.totalPrice,
      required this.quantity,
      required this.image});
}
