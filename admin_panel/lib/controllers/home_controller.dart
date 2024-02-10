import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Product {
  final String productName;
  final String productDesc;
  final String productImageUrl;
  final String productPrice;

  Product({
    required this.productName,
    required this.productDesc,
    required this.productImageUrl,
    required this.productPrice,
  });
}

class HomeController extends GetxController {
  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescCtrl = TextEditingController();
  TextEditingController productImageUrlCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  RxList<Product> productList = <Product>[].obs;

  @override
  void onInit() {
    // Fetch initial data when the controller is initialized
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      var snapshot = await productCollection.get();
      productList.assignAll(snapshot.docs
          .map((doc) => Product(
                productName: doc['productName'],
                productDesc: doc['productDesc'],
                productImageUrl: doc['productImageUrl'],
                productPrice: doc['productPrice'],
              ))
          .toList());
    } catch (e) {
      // Handle error
      print('Error fetching data: $e');
    }
    update();
  }

  Future<void> addProduct() async {
    try {
      await productCollection.add({
        'productName': productNameCtrl.text,
        'productDesc': productDescCtrl.text,
        'productImageUrl': productImageUrlCtrl.text,
        'productPrice': productPriceCtrl.text,
      });

      // Update the product list after adding the product
      await fetchData();

      // Clear the text controllers after adding the product
      productNameCtrl.clear();
      productDescCtrl.clear();
      productImageUrlCtrl.clear();
      productPriceCtrl.clear();
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error adding product: $e');
    }
    update();
  }

  Future<void> deleteProduct(int index) async {
    try {
      await productCollection.doc(index.toString()).delete();

      // Update the product list after deleting the product
      await fetchData();
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error deleting product: $e');
    }
    update();
  }
}
