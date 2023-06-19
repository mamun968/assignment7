
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalItems;

  const CartPage({super.key, required this.totalItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text('Total items in cart: $totalItems'),
      ),
    );
  }
}