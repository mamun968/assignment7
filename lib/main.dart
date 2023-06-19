import 'package:flutter/material.dart';
import 'cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProductList(),
    );
  }
}

class Product {
  final String name;
  final double price;
  int count=0;

  Product({required this.name, required this.price});
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Apple Watch 1', price: 100.0),
    Product(name: 'Apple Watch 2', price: 150.0),
    Product(name: 'Apple Watch 3', price: 200.0),
    Product(name: 'Apple Watch 4', price: 300.0),
    Product(name: 'Apple Watch 5', price: 350.0),
    Product(name: 'Apple Watch 6', price: 350.0),
    Product(name: 'Apple Watch 7', price: 400.0),
    Product(name: 'Apple Watch 8', price: 400.0),
    Product(name: 'MacBook Air M1 ', price: 1500.0),
    Product(name: 'MacBook Air M2', price: 1800.0),
    Product(name: 'MacBook Pro M1', price: 1500.0),
    Product(name: 'MacBook Pro M2', price: 2000.0),
  ];

  int totalItems = 0;

  void addToCart(Product product) {
    setState(() {
      product.count++;
      totalItems++;

      if (product.count == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Congratulations!'),
              content: Text('You have bought 5 ${product.name}!'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  void navigateToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage(totalItems: totalItems)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: navigateToCartPage,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product product = products[index];
          bool isOodItem = index % 2 == 0;
          Color bgColor = isOodItem
              ? const Color.fromARGB(255, 198, 234, 249)
              : const Color.fromARGB(255, 238, 242, 242);
          return Container(
            color: bgColor,
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Count: ${product.count}'),
                  ElevatedButton(
                    
                    child: const Text('Buy Now'),
                    onPressed: () {
                      addToCart(product);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
